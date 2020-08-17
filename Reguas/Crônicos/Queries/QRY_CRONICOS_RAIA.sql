SELECT 
    X.ID_CLIENTE
    ,X.CD_PRODUTO
    ,CONVERT(DATE,X.DT_VENDA, 101) AS DT_HR_VENDA
    ,CONVERT(DATE,( X.DT_VENDA + ( X.QTD_ITEM * X.NR_DURACAO_CAIXA ) ),101) AS DATA_BASE
    ,CONVERT(DATE,( X.DT_VENDA + ( X.QTD_ITEM * X.NR_DURACAO_CAIXA ) ) - 5,101) AS DT_PRIMEIRO_LEMBRETE
    ,CONVERT(DATE,( X.DT_VENDA + ( X.QTD_ITEM * X.NR_DURACAO_CAIXA ) ) + 7,101) AS DT_SEGUNDO_LEMBRETE
    ,CONVERT(DATE,( X.DT_VENDA + ( X.QTD_ITEM * X.NR_DURACAO_CAIXA ) ) + 14,101) AS DATA_RESGATE
    ,X.TEL_CELULAR
    ,X.NOME
    ,X.LOCALE
    ,X.URL_PRODUTO
    ,X.MS
    ,X.DESC_PRODUTO
    ,X.DESC_PROD_DETALHADA
    ,X.DESC_CLASSIF_PRODUTO
    FROM (

        SELECT 
                Y.ID_CLIENTE
                ,Y.CD_PRODUTO
                ,Y.NR_DURACAO_CAIXA
                ,Y.DT_ULTIMA_COMPRA
                ,Y.QTD_DO_ITEM
                ,Y.TEL_CELULAR
                ,Y.NOME
                ,Y.LOCALE
                ,Y.URL_PRODUTO
                ,Y.MS
                ,Y.DESC_PRODUTO
                ,Y.DESC_PROD_DETALHADA
                ,Y.DESC_CLASSIF_PRODUTO
                ,CASE 
                    WHEN Y.DT_ULTIMA_COMPRA <= (SELECT P.DATA_BASE FROM ( SELECT UT.DATA_BASE ,row_number() over(partition by UT.ID_CLIENTE, UT.CD_PRODUTO order by UT.DT_HR_VENDA desc) as RowNumber FROM DE_FULL_COMPRADORES_CRONICOS_RAIA UT WHERE UT.ID_CLIENTE = Y.ID_CLIENTE AND UT.CD_PRODUTO = Y.CD_PRODUTO AND UT.DT_HR_VENDA < Y.DT_ULTIMA_COMPRA) P WHERE RowNumber = 1 ) THEN (SELECT R.DT_HR_VENDA FROM ( SELECT U.DT_HR_VENDA ,row_number() over(partition by U.ID_CLIENTE, U.CD_PRODUTO order by U.DT_HR_VENDA desc) as RowNumber FROM DE_FULL_COMPRADORES_CRONICOS_RAIA U WHERE U.ID_CLIENTE = Y.ID_CLIENTE AND U.CD_PRODUTO = Y.CD_PRODUTO AND U.DT_HR_VENDA < Y.DT_ULTIMA_COMPRA) R WHERE RowNumber = 1 )
                    ELSE Y.DT_ULTIMA_COMPRA
                END AS DT_VENDA
                ,CASE 
                    WHEN Y.DT_ULTIMA_COMPRA <= (SELECT T.DATA_BASE FROM ( SELECT CR.DATA_BASE ,row_number() over(partition by CR.ID_CLIENTE, CR.CD_PRODUTO order by CR.DT_HR_VENDA desc) as RowNumber FROM DE_FULL_COMPRADORES_CRONICOS_RAIA CR WHERE CR.ID_CLIENTE = Y.ID_CLIENTE AND CR.CD_PRODUTO = Y.CD_PRODUTO AND CR.DT_HR_VENDA < Y.DT_ULTIMA_COMPRA) T WHERE RowNumber = 1 ) THEN ((SELECT S.QTD_DO_ITEM FROM ( SELECT H.QTD_DO_ITEM ,row_number() over(partition by H.ID_CLIENTE, H.CD_PRODUTO order by H.DT_HR_VENDA desc) as RowNumber FROM DE_FULL_COMPRADORES_CRONICOS_RAIA H WHERE H.ID_CLIENTE = Y.ID_CLIENTE AND H.CD_PRODUTO = Y.CD_PRODUTO AND H.DT_HR_VENDA < Y.DT_ULTIMA_COMPRA) S WHERE RowNumber = 1 ) + Y.QTD_DO_ITEM)
                    ELSE Y.QTD_DO_ITEM
                END AS QTD_ITEM
            FROM
                ( 
                    SELECT 
                        FUL.ID_CLIENTE
                        ,FUL.CD_PRODUTO 
                        ,FUL.DT_ULTIMA_COMPRA 
                        ,FUL.QTD_DO_ITEM
                        ,FUL.NR_DURACAO_CAIXA 
                        ,CL.TEL_CELULAR
                        ,CL.NOME
                        ,'PT-BR' AS LOCALE
                        ,PT.URL_PRODUTO
                        ,PT.MS
                        ,PD.DESC_PRODUTO
                        ,PD.DESC_PROD_DETALHADA
                        ,PD.DESC_CLASSIF_PRODUTO
                    FROM DE_DT_ULTIMA_COMPRA_CRONICOS_RAIA FUL
                    INNER JOIN  DE_CAD_CLIENTE_RAIA CL
                    ON FUL.ID_CLIENTE = CL.ID_CLIENTE
                    INNER JOIN DE_PRODUTOS_RAIA PT
                    ON FUL.CD_PRODUTO = PT.CD_PRODUTO
                    INNER JOIN ent.DE_CAD_PRODUTO PD
                    ON PT.CD_PRODUTO = PD.CD_PRODUTO
                    WHERE CL.TEL_CELULAR IS NOT NULL
                    AND PD.PRODUTO_INATIVO = 0 
                    AND NOT EXISTS 
                    (
                            SELECT 1
                            FROM ent.DE_BLACKLIST_CRONICOS CR
                            WHERE CR.CD_PRODUTO = FUL.CD_PRODUTO
                    )
                    AND NOT EXISTS 
                    (
                            SELECT 1
                            FROM DE_BOUNCES_BLACKLIST_RAIA BC
                            WHERE BC.ID_CLIENTE = FUL.ID_CLIENTE
                    )
                    AND NOT EXISTS 
                    (
                            SELECT 1
                            FROM DV_UndeliverableSms DVU
                            WHERE DVU.MobileNumber = CL.TEL_CELULAR
                            AND BounceCount >= 2
                    )
                    AND NOT EXISTS
                    (
                        SELECT 1
                        FROM DE_OPTOUT_CRONICOS_RAIA OPC
                        WHERE OPC.TEL_CELULAR = CL.TEL_CELULAR
                    )
                ) Y
    )X 
WHERE
 (
    CONVERT(VARCHAR(10),( X.DT_VENDA + ( X.QTD_ITEM * X.NR_DURACAO_CAIXA ) ) - 5,101) = CONVERT(VARCHAR(10),GETDATE(), 101) OR 
    CONVERT(VARCHAR(10),( X.DT_VENDA + ( X.QTD_ITEM * X.NR_DURACAO_CAIXA ) ) + 7,101) = CONVERT(VARCHAR(10),GETDATE(), 101) OR 
    CONVERT(VARCHAR(10),( X.DT_VENDA + ( X.QTD_ITEM * X.NR_DURACAO_CAIXA ) ) + 14,101) = CONVERT(VARCHAR(10),GETDATE(), 101)
 )

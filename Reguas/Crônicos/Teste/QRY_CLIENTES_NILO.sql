SELECT
    X.ID_CLIENTE
    ,X.CD_PRODUTO
    ,X.QTD_DO_ITEM
    ,X.NR_DURACAO_CAIXA
    ,CONVERT(DATE,X.DT_HR_VENDA, 101) AS DT_HR_VENDA
    ,CONVERT(DATE,X.DATA_BASE - 5, 101) AS DT_PRIMEIRO_LEMBRETE
    ,CONVERT(DATE,X.DATA_BASE + 7, 101) AS DT_SEGUNDO_LEMBRETE
    ,CONVERT(DATE,X.DATA_BASE_RESGATE, 101) AS DATA_RESGATE
    ,CONVERT(DATE,X.DATA_BASE, 101) AS DATA_BASE
    ,X.QT_DOSE_DIARIA
    ,X.ID_NF
FROM
    (
        SELECT DISTINCT
            Y.ID_CLIENTE
            ,Y.CD_PRODUTO
            ,Y.DT_HR_VENDA
            ,Y.NR_DURACAO_CAIXA
            ,Y.QT_DOSE_DIARIA
            ,Y.QTD_DO_ITEM
            ,Y.ID_NF
            ,( Y.DT_HR_VENDA + ( Y.QTD_DO_ITEM * Y.NR_DURACAO_CAIXA ) ) DATA_BASE
            ,( Y.DT_HR_VENDA + ( Y.QTD_DO_ITEM * Y.NR_DURACAO_CAIXA ) ) + 14 DATA_BASE_RESGATE
        FROM 
            (
                SELECT 
                        C.ID_CLIENTE
                        ,A.CD_PRODUTO
                        ,B.DT_HR_VENDA
                        ,A.NR_DURACAO_CAIXA
                        ,A.QT_DOSE_DIARIA
                        ,B.ID_NF
                        ,COUNT(B.CD_PRODUTO) AS QTD_DO_ITEM
                FROM ent.DE_PRODUTO_TRATAMENTO  A
                INNER JOIN DE_NOTA_ITEM_RAIA B
                ON A.CD_PRODUTO = B.CD_PRODUTO
                INNER JOIN DE_NOTA_HEADER_RAIA C
                ON B.ID_NF = C.ID_NF
                WHERE
                    A.NR_DURACAO_CAIXA > 9
                    AND CONVERT(DATE,B.DT_HR_VENDA, 101) = CONVERT(DATE,GETDATE(), 101)
                GROUP BY    
                        C.ID_CLIENTE
                        ,A.CD_PRODUTO
                        ,B.DT_HR_VENDA
                        ,B.ID_NF
                        ,A.NR_DURACAO_CAIXA
                        ,A.QT_DOSE_DIARIA
            )Y
    ) X

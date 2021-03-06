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
        SELECT 
            Y.ID_CLIENTE
            ,Y.CD_PRODUTO
            ,Y.DT_HR_VENDA
            ,Y.NR_DURACAO_CAIXA
            ,Y.QT_DOSE_DIARIA
            ,Y.ID_NF
            ,Y.QTD_DO_ITEM
            ,( Y.DT_HR_VENDA + ( Y.QTD_DO_ITEM * Y.NR_DURACAO_CAIXA ) ) DATA_BASE
            ,( Y.DT_HR_VENDA + ( Y.QTD_DO_ITEM * Y.NR_DURACAO_CAIXA ) ) + 14 DATA_BASE_RESGATE
        FROM
            ( 
                SELECT 
                    A.ID_CLIENTE 
                    ,B.CD_PRODUTO 
                    ,B.DT_HR_VENDA 
                    ,COUNT(B.CD_PRODUTO) AS QTD_DO_ITEM
                    ,C.NR_DURACAO_CAIXA 
                    ,C.QT_DOSE_DIARIA
                    ,A.ID_NF
                FROM ent.DE_PRODUTO_TRATAMENTO C
                INNER JOIN  DE_NOTA_ITEM_RAIA B
                ON B.CD_PRODUTO = C.CD_PRODUTO
                INNER JOIN DE_NOTA_HEADER_RAIA A
                ON A.ID_NF = B.ID_NF
                WHERE CONVERT(DATE,B.DT_HR_VENDA, 101) >= CONVERT(DATE,GETDATE()-365, 101)
                AND C.NR_DURACAO_CAIXA >= 10
                AND A.OPERACAO_FISCAL = 'VENDA'
                GROUP BY 
                    A.ID_CLIENTE
                    ,A.ID_NF
                    ,B.CD_PRODUTO 
                    ,B.DT_HR_VENDA 
                    ,C.NR_DURACAO_CAIXA 
                    ,C.QT_DOSE_DIARIA
            ) Y
    ) X 
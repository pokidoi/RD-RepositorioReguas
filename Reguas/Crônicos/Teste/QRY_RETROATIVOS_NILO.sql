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
            ,Y.QTD_DO_ITEM
            ,Y.DT_HR_VENDA
            ,Y.NR_DURACAO_CAIXA
            ,( Y.DT_HR_VENDA + ( Y.QTD_DO_ITEM * Y.NR_DURACAO_CAIXA ) ) DATA_BASE
            ,( Y.DT_HR_VENDA + ( Y.QTD_DO_ITEM * Y.NR_DURACAO_CAIXA ) ) + 14 DATA_BASE_RESGATE
            ,Y.QT_DOSE_DIARIA
            ,Y.ID_NF
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
                FROM DE_NOTA_HEADER_RAIA A
                INNER JOIN  DE_NOTA_ITEM_RAIA B
                ON A.ID_NF = B.ID_NF
                INNER JOIN ent.DE_PRODUTO_TRATAMENTO C
                ON B.CD_PRODUTO = C.CD_PRODUTO
                WHERE C.NR_DURACAO_CAIXA > 9
                GROUP BY 
                    A.ID_CLIENTE
                    ,A.ID_NF
                    ,B.CD_PRODUTO 
                    ,B.DT_HR_VENDA 
                    ,C.NR_DURACAO_CAIXA 
                    ,C.QT_DOSE_DIARIA
            ) Y
    ) X 
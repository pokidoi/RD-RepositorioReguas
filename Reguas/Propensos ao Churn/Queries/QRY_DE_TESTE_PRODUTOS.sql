SELECT
    DTP.ID_CLIENTE
    ,(
        SELECT 
            X.CD_PRODUTO
        FROM 
        (
            SELECT 
                DTP1.CD_PRODUTO
                ,row_number() over(partition by DTP1.ID_CLIENTE order by DTP1.CD_PRODUTO desc) as RowNumber 
            FROM DE_TESTE_PRODUTOS DTP1
        )X
        WHERE RowNumber = 1
    ) AS CD_PRODUTO1
    ,(
        SELECT 
            Y.CD_PRODUTO
        FROM 
        (
            SELECT 
                DTP2.CD_PRODUTO
                ,row_number() over(partition by DTP2.ID_CLIENTE order by DTP2.CD_PRODUTO desc) as RowNumber 
            FROM DE_TESTE_PRODUTOS DTP2
        )Y
        WHERE RowNumber = 2
    ) AS CD_PRODUTO2
    ,(
        SELECT 
            W.CD_PRODUTO
        FROM 
        (
            SELECT 
                DTP3.CD_PRODUTO
                ,row_number() over(partition by DTP3.ID_CLIENTE order by DTP3.CD_PRODUTO desc) as RowNumber 
            FROM DE_TESTE_PRODUTOS DTP3
        )W
        WHERE RowNumber = 3
    ) AS CD_PRODUTO3
    ,(
        SELECT 
            Z.CD_PRODUTO
        FROM 
        (
            SELECT 
                DTP4.CD_PRODUTO
                ,row_number() over(partition by DTP4.ID_CLIENTE order by DTP4.CD_PRODUTO desc) as RowNumber 
            FROM DE_TESTE_PRODUTOS DTP4
        )Z
        WHERE RowNumber = 4
    ) AS CD_PRODUTO4
FROM DE_TESTE_PRODUTOS DTP
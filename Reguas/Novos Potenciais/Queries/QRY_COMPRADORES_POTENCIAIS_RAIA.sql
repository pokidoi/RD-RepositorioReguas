SELECT
    X.ID_CLIENTE
    ,X.DATA_HORA_VENDA
    ,X.VALOR_TOTAL_NF
    ,X.ID_NF
    ,X.NR_PROMOCIONAL
FROM (
    SELECT
        PTR.ID_CLIENTE
        ,NTH.DATA_HORA_VENDA
        ,NTH.VALOR_TOTAL_NF
        ,NTI.ID_NF
        ,NTI.NR_PROMOCIONAL
        ,row_number() over(partition by PTR.ID_CLIENTE order by NTH.DATA_HORA_VENDA desc) as RowNumber
        FROM DE_ALL_NOVOS_POTENCIAIS_RAIA PTR
        INNER JOIN DE_NOTA_HEADER_RAIA NTH
        ON PTR.ID_CLIENTE = NTH.ID_CLIENTE
        INNER JOIN DE_NOTA_ITEM_RAIA NTI
        ON NTH.ID_NF = NTI.ID_NF
        WHERE CONVERT(DATE, PTR.DATA_CADASTRO, 101) != CONVERT(DATE, NTH.DATA_HORA_VENDA, 101)
)X
WHERE RowNumber = 1

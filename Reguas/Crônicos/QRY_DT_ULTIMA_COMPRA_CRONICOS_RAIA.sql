SELECT 
    T.ID_CLIENTE
    ,T.CD_PRODUTO
    ,T.DT_HR_VENDA as DT_ULTIMA_COMPRA
    ,T.QTD_DO_ITEM
    ,T.DATA_BASE
    ,T.NR_DURACAO_CAIXA
    ,T.DT_PRIMEIRO_LEMBRETE
    ,T.DT_SEGUNDO_LEMBRETE
    ,T.DATA_RESGATE
FROM
    (
        select 
            CR.ID_CLIENTE
            ,CR.CD_PRODUTO
            ,CR.QTD_DO_ITEM
            ,CR.DATA_BASE
            ,CR.NR_DURACAO_CAIXA
            ,CR.DT_HR_VENDA
            ,CR.DT_PRIMEIRO_LEMBRETE
            ,CR.DT_SEGUNDO_LEMBRETE
            ,CR.DATA_RESGATE
            ,row_number() over(partition by CR.ID_CLIENTE, CR.CD_PRODUTO order by CR.DT_HR_VENDA desc) as RowNumber
        from DE_FULL_COMPRADORES_CRONICOS_RAIA CR
    ) as T
WHERE RowNumber = 1

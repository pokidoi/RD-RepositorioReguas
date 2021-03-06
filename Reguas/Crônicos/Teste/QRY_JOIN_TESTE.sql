SELECT 
    TT.ID_CLIENTE
    ,TT.TEL_CELULAR
    ,TT.NOME
    ,TT.LOCALE
    ,TT.CD_PRODUTO
    ,TT.DT_HR_VENDA 
    ,CONVERT(DATE,( TT.DT_HR_VENDA + ( 1 * TR.NR_DURACAO_CAIXA ) ) - 5, 101) AS DT_PRIMEIRO_LEMBRETE
    ,CONVERT(DATE,( TT.DT_HR_VENDA + ( 1 * TR.NR_DURACAO_CAIXA ) ) + 7, 101) AS DT_SEGUNDO_LEMBRETE
    ,CONVERT(DATE,( TT.DT_HR_VENDA + ( 1 * TR.NR_DURACAO_CAIXA ) ) + 14, 101) AS DATA_RESGATE
    ,CONVERT(DATE,( TT.DT_HR_VENDA + ( 1 * TR.NR_DURACAO_CAIXA ) ), 101) AS DATA_BASE
    ,PR.URL_PRODUTO
    ,PR.MS
    ,CD.DESC_PRODUTO
    ,CD.DESC_PROD_DETALHADA
    ,CD.DESC_CLASSIF_PRODUTO
FROM DE_CRONICOS_TESTE TT
INNER JOIN DE_PRODUTOS_RAIA PR
ON TT.CD_PRODUTO = PR.CD_PRODUTO
INNER JOIN ent.DE_CAD_PRODUTO CD
ON TT.CD_PRODUTO = CD.CD_PRODUTO
INNER JOIN ENT.DE_PRODUTO_TRATAMENTO TR
ON TT.CD_PRODUTO = TR.CD_PRODUTO

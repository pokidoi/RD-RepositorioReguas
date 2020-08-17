SELECT
    CCL.ID_CLIENTE
    ,NRP.NR_PROMOCIONAL
    ,NRP.CD_FILIAL AS CD_FILIAL_FREQ
    ,NRP.CD_PRODUTO
    ,NRP.PRECO_DE
    ,NRP.PRECO_POR
    ,NRP.DT_INICIO
    ,NRP.DT_FIM
FROM ent.DE_NR_PROMO NRP
INNER JOIN DE_CAD_CLIENTE_RAIA CCL
ON NRP.CD_FILIAL = CCL.CD_FILIAL_FREQ
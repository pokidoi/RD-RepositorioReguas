SELECT
    CCL.ID_CLIENTE
    ,3 as CD_CAMPANHA_SECAO    
    ,1 AS CD_CAMPANHA_STATUS
    ,1 AS NR_PRIORIDADE_SECAO
    ,1 AS FL_ATIVO
    ,3 AS CD_CAMPANHA_CANAL
    ,CONVERT(DATE, NRP.DT_INICIO, 103) AS DT_INICIO
    ,CONVERT(DATE, NRP.DT_FIM, 103) AS DT_FIM
    ,1 AS CD_LOGOMARCA
    ,999 AS CD_CAMPANHA_OFERTA_POOL
    ,NRP.NR_PROMOCIONAL
    ,NRP.CD_FILIAL
    ,NRP.CD_CAMPANHA_OFERTA
    ,NRP.CD_PRODUTO
FROM ent.DE_NR_PROMO NRP
INNER JOIN DE_REGUAS_PRICING_DROGASIL CCL
ON NRP.CD_FILIAL = CCL.CD_FILIAL_FREQ
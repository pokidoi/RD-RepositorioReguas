SELECT DISTINCT TRG.ID_CLIENTE,
    STUFF(
            ( 
                SELECT DISTINCT ',' + CAST(T1.CD_PRODUTO AS VARCHAR)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
                FROM DE_DH_TARGETING_PROPENSOS_CHURN_RAIA T1
                WHERE
                T1.ID_CLIENTE = TRG.ID_CLIENTE
                FOR XML PATH('')
            ), 1, 1, '' 
        )
    AS [CD_PRODUTO]
    ,CCL.CPF 
    ,CCL.EMAIL
    ,CCL.TEL_CELULAR
    ,CCL.NOME
    ,'PT-BR' as LOCALE
    ,CCL.FILIAL_CADASTRO
    ,CONVERT(VARCHAR(10), GETDATE(), 101) AS DT_JOURNEY
FROM DE_DH_TARGETING_PROPENSOS_CHURN_RAIA TRG
INNER JOIN DE_CAD_CLIENTE_RAIA CCL
ON TRG.ID_CLIENTE = CCL.ID_CLIENTE
WHERE NOT EXISTS
(
    SELECT 1
    FROM DE_BOUNCES_BLACKLIST_RAIA BBR
    WHERE BBR.ID_CLIENTE = CCL.ID_CLIENTE
)
AND NOT EXISTS
(
    SELECT 1
    FROM ENT.DE_CAD_DONOTCALL DCN
    WHERE DCN.DDD_TELEFONE = CCL.TEL_CELULAR
)
AND (CCL.EMAIL IS NOT NULL OR CCL.TEL_CELULAR IS NOT NULL)
AND NOT EXISTS
(
    SELECT 1
    FROM ENT.DE_BLACKLIST_SF_RAIA BLC
    WHERE BLC.ID_CLIENTE = CCL.ID_CLIENTE
)
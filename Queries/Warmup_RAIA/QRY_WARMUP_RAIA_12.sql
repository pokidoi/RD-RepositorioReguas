SELECT TOP 40000
    GM2.EMAIL as EMAIL
    ,GM2.ID_CLIENTE AS ID_CLIENTE
    ,GM2.DOMINIO AS DOMINIO
    ,'4' as TEMPLATE
    ,CONVERT(DATE, GETDATE()+14) as DATA_WARM
FROM FLT_RAIA_GMAIL_SHABIT GM2
WHERE NOT EXISTS
(
    SELECT JR.EMAIL
    FROM DE_WARMUP_RAIA_JOURNEY JR
    WHERE JR.EMAIL = GM2.EMAIL
)

UNION

SELECT TOP 40000
    MF2.EMAIL as EMAIL
    ,MF2.ID_CLIENTE AS ID_CLIENTE
    ,MF2.DOMINIO AS DOMINIO
    ,'4' as TEMPLATE
    ,CONVERT(DATE, GETDATE()+14) as DATA_WARM
FROM FLT_RAIA_MICROSOFT_SHABIT MF2
WHERE NOT EXISTS
(
    SELECT JR.EMAIL
    FROM DE_WARMUP_RAIA_JOURNEY JR
    WHERE JR.EMAIL = MF2.EMAIL
)


UNION

SELECT TOP 40000
    YH2.EMAIL as EMAIL
    ,YH2.ID_CLIENTE AS ID_CLIENTE
    ,YH2.DOMINIO AS DOMINIO
    ,'4' as TEMPLATE
    ,CONVERT(DATE, GETDATE()+14) as DATA_WARM
FROM FLT_RAIA_YAHOO_SHABIT YH2
WHERE NOT EXISTS
(
    SELECT JR.EMAIL
    FROM DE_WARMUP_RAIA_JOURNEY JR
    WHERE JR.EMAIL = YH2.EMAIL
)

UNION

SELECT TOP 40000
    OT2.EMAIL as EMAIL
    ,OT2.ID_CLIENTE AS ID_CLIENTE
    ,OT2.DOMINIO AS DOMINIO
    ,'4' as TEMPLATE
    ,CONVERT(DATE, GETDATE()+14) as DATA_WARM
FROM FLT_RAIA_OUTROS_SHABIT OT2
WHERE NOT EXISTS
(
    SELECT JR.EMAIL
    FROM DE_WARMUP_RAIA_JOURNEY JR
    WHERE JR.EMAIL = OT2.EMAIL
)



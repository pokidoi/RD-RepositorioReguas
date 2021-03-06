    SELECT TOP 40000
        GM1.EMAIL as EMAIL
        ,GM1.ID_CLIENTE AS ID_CLIENTE
        ,GM1.DOMINIO AS DOMINIO
        ,'2' as TEMPLATE
        ,CONVERT(DATE, GETDATE()+14) as DATA_WARM
    FROM DE_ONOFRE_ATIVOS_GMAIL GM1
    WHERE NOT EXISTS
    (
        SELECT JR.EMAIL
        FROM DE_WARMUP_ONOFRE_JOURNEY JR
        WHERE JR.EMAIL = GM1.EMAIL
    )

    UNION

    SELECT TOP 40000
        MF1.EMAIL as EMAIL
        ,MF1.ID_CLIENTE AS ID_CLIENTE
        ,MF1.DOMINIO AS DOMINIO
        ,'2' as TEMPLATE
        ,CONVERT(DATE, GETDATE()+14) as DATA_WARM
    FROM DE_ONOFRE_ATIVOS_MICROSOFT MF1
    WHERE NOT EXISTS
    (
        SELECT JR.EMAIL
        FROM DE_WARMUP_ONOFRE_JOURNEY JR
        WHERE JR.EMAIL = MF1.EMAIL
    )





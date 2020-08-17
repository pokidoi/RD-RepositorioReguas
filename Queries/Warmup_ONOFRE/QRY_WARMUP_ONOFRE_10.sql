    SELECT TOP 40000
        GM1.EMAIL as EMAIL
        ,GM1.ID_CLIENTE AS ID_CLIENTE
        ,GM1.DOMINIO AS DOMINIO
        ,'1' as TEMPLATE
        ,CONVERT(DATE, GETDATE()+11) as DATA_WARM
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
        ,'1' as TEMPLATE
        ,CONVERT(DATE, GETDATE()+11) as DATA_WARM
    FROM DE_ONOFRE_ATIVOS_MICROSOFT MF1
    WHERE NOT EXISTS
    (
        SELECT JR.EMAIL
        FROM DE_WARMUP_ONOFRE_JOURNEY JR
        WHERE JR.EMAIL = MF1.EMAIL
    )

    UNION

    SELECT TOP 20000
        YH1.EMAIL as EMAIL
        ,YH1.ID_CLIENTE AS ID_CLIENTE
        ,YH1.DOMINIO AS DOMINIO
        ,'1' as TEMPLATE
        ,CONVERT(DATE, GETDATE()+11) as DATA_WARM
    FROM DE_ONOFRE_ATIVOS_YAHOO YH1
    WHERE NOT EXISTS
    (
        SELECT JR.EMAIL
        FROM DE_WARMUP_ONOFRE_JOURNEY JR
        WHERE JR.EMAIL = YH1.EMAIL
    )

    UNION

    SELECT TOP 40000
        OT1.EMAIL as EMAIL
        ,OT1.ID_CLIENTE AS ID_CLIENTE
        ,OT1.DOMINIO AS DOMINIO
        ,'1' as TEMPLATE
        ,CONVERT(DATE, GETDATE()+11) as DATA_WARM
    FROM DE_ONOFRE_ATIVOS_OUTROS OT1
    WHERE NOT EXISTS
    (
        SELECT JR.EMAIL
        FROM DE_WARMUP_ONOFRE_JOURNEY JR
        WHERE JR.EMAIL = OT1.EMAIL
    )







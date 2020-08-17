    SELECT TOP 2000
        GM1.EmailAddress as EMAIL
        ,GM1.IdCliente AS ID_CLIENTE
        ,GM1.Dominio AS DOMINIO
        ,'1' as TEMPLATE
        ,CONVERT(DATE, GETDATE()+3) as DATA_WARM
    FROM FLT_DROGASIL_GMAIL_ENGAJADOS GM1
    WHERE NOT EXISTS
    (
        SELECT JR.EMAIL
        FROM DE_WARMUP_DROGASIL_JOURNEY JR
        WHERE JR.EMAIL = GM1.EmailAddress
    )

    UNION

    SELECT TOP 2500
        MF1.EmailAddress as EMAIL
        ,MF1.IdCliente AS ID_CLIENTE
        ,MF1.Dominio AS DOMINIO
        ,'1' as TEMPLATE
        ,CONVERT(DATE, GETDATE()+3) as DATA_WARM
    FROM FLT_DROGASIL_MICROSOFT_ENGAJADOS MF1
    WHERE NOT EXISTS
    (
        SELECT JR.EMAIL
        FROM DE_WARMUP_DROGASIL_JOURNEY JR
        WHERE JR.EMAIL = MF1.EmailAddress
    )

    UNION

    SELECT TOP 2500
        YH1.EmailAddress as EMAIL
        ,YH1.IdCliente AS ID_CLIENTE
        ,YH1.Dominio AS DOMINIO
        ,'1' as TEMPLATE
        ,CONVERT(DATE, GETDATE()+3) as DATA_WARM
    FROM FLT_DROGASIL_YAHOO_ENGAJADOS YH1
    WHERE NOT EXISTS
    (
        SELECT JR.EMAIL
        FROM DE_WARMUP_DROGASIL_JOURNEY JR
        WHERE JR.EMAIL = YH1.EmailAddress
    )

    UNION

    SELECT TOP 2500
        OT1.EmailAddress as EMAIL
        ,OT1.IdCliente AS ID_CLIENTE
        ,OT1.Dominio AS DOMINIO
        ,'1' as TEMPLATE
        ,CONVERT(DATE, GETDATE()+3) as DATA_WARM
    FROM FLT_DROGASIL_OUTROS_ENGAJADOS OT1
    WHERE NOT EXISTS
    (
        SELECT JR.EMAIL
        FROM DE_WARMUP_DROGASIL_JOURNEY JR
        WHERE JR.EMAIL = OT1.EmailAddress
    )







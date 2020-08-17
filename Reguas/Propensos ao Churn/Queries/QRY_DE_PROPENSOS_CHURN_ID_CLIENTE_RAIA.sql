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
FROM DE_DH_TARGETING_PROPENSOS_CHURN_RAIA TRG


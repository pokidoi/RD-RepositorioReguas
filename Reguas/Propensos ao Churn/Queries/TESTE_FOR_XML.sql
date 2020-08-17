SELECT DISTINCT T2.ID_CLIENTE,
            STUFF(
                    ( 
                        SELECT DISTINCT ',' + CAST(T1.CD_PRODUTO AS VARCHAR)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
                        FROM DE_DH_TARGETING_PROPENSOS_CHURN_RAIA T1
                        WHERE
                        T1.ID_CLIENTE = T2.ID_CLIENTE
                        FOR XML PATH('')
                    ), 1, 1, '' 
                )
            AS [CD_PRODUTO],
            STUFF(
                    ( 
                        SELECT DISTINCT ',' + CAST(T1.NR_PROMOCIONAL AS VARCHAR)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
                        FROM DE_DH_TARGETING_PROPENSOS_CHURN_RAIA T1
                        WHERE
                        T1.ID_CLIENTE = T2.ID_CLIENTE
                        AND T1.CD_PRODUTO = T2.CD_PRODUTO
                        FOR XML PATH('')
                    ), 1, 1, '' 
                )
            AS [NR_PROMOCIONAL]
FROM DE_DH_TARGETING_PROPENSOS_CHURN_RAIA T2
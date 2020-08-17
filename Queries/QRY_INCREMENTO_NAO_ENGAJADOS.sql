SELECT TOP 500
        DE.EMAIL
        ,DE.ID_CLIENTE
        ,DE.DOMINIO
        ,'4' AS TEMPLATE
        ,GETDATE() AS DATA_WARM
	FROM DE_WARMUP_ONOFRE_JOURNEY DE
	JOIN _Sent S
	ON DE.ID_CLIENTE = S.SubscriberKey 
	JOIN _Job AS J 
	ON S.JobId = J.JobId
	WHERE J.TriggeredSendCustomerKey = '788'
    AND DE.DOMINIO = 'MICROSOFT'
    AND NOT EXISTS
    (
        SELECT 1
        FROM _Bounce B
        WHERE DE.ID_CLIENTE = B.SubscriberKey
    ) 
    AND NOT EXISTS
    (
        SELECT 1
        FROM DE_WARMUP_ONOFRE_JOURNEY_2 MT
        WHERE DE.ID_CLIENTE = MT.ID_CLIENTE
    )
    AND NOT EXISTS
    (
        SELECT 1 
        FROM _Open O
        WHERE DE.ID_CLIENTE = O.SubscriberKey
    )
    
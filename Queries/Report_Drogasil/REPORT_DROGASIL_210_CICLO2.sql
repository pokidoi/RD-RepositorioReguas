
SELECT 
        J.TriggererSendDefinitionObjectID
        ,J.TriggeredSendCustomerKey
        ,J.JobID
        ,'GMAIL' AS DOMINIO
        ,'13.111.157.210' AS IPAddress
        ,GETDATE() AS DATA_WARM
        ,(
            SELECT COUNT(1) AS COUNT_SENT
            FROM DE_WARMUP_DROGASIL_JOURNEY DE
            JOIN _Sent S
            ON DE.ID_CLIENTE = S.SubscriberKey 
            JOIN _Job AS J 
            ON S.JobId = J.JobId
            WHERE  J.EmailName = 'IP1_CICLO2_CUIDADOS_PELE_REPELENTES'
            AND J.TriggererSendDefinitionObjectID = '1FD52F81-045B-EA11-A2EA-48DF37143ED9'
            AND J.TriggeredSendCustomerKey = '448'
            AND convert(DATE, S.EventDate, 120) = convert(DATE,getdate(),120) 
        ) AS COUNT_SENT
        ,(
            SELECT COUNT(B.SubscriberKey) AS COUNT_BOUNCES
            FROM DE_WARMUP_DROGASIL_JOURNEY DE
            JOIN _Sent S
            ON DE.ID_CLIENTE = S.SubscriberKey 
            JOIN _Bounce B
            ON S.JobID = B.JobID and S.ListID = B.ListID and S.BatchID = B.BatchID and S.SubscriberID = B.SubscriberID and B.IsUnique = 1
            JOIN _Job AS J 
            ON B.JobId = J.JobId
            WHERE  J.EmailName = 'IP1_CICLO2_CUIDADOS_PELE_REPELENTES'
            AND J.TriggererSendDefinitionObjectID = '1FD52F81-045B-EA11-A2EA-48DF37143ED9'
            AND J.TriggeredSendCustomerKey = '448'
            AND convert(DATE, S.EventDate, 120) = convert(DATE,getdate(),120) 
        ) AS COUNT_BOUNCES
	FROM DE_WARMUP_DROGASIL_JOURNEY DE
	JOIN _Sent S
	ON DE.ID_CLIENTE = S.SubscriberKey 
	JOIN _Job AS J 
	ON S.JobId = J.JobId
	WHERE  J.EmailName = 'IP1_CICLO2_CUIDADOS_PELE_REPELENTES'
    AND J.TriggererSendDefinitionObjectID = '1FD52F81-045B-EA11-A2EA-48DF37143ED9'
    AND J.TriggeredSendCustomerKey = '448'
    AND convert(DATE, S.EventDate, 120) = convert(DATE,getdate(),120) 
GROUP BY J.TriggererSendDefinitionObjectID, J.IPAddress, J.JobID, J.TriggeredSendCustomerKey

UNION

SELECT 
        J.TriggererSendDefinitionObjectID
        ,J.TriggeredSendCustomerKey
        ,J.JobID
        ,'MICROSOFT' AS DOMINIO
        ,'13.111.157.210' AS IPAddress
        ,GETDATE() AS DATA_WARM
        ,(
            SELECT COUNT(1) AS COUNT_SENT
            FROM DE_WARMUP_DROGASIL_JOURNEY DE
            JOIN _Sent S
            ON DE.ID_CLIENTE = S.SubscriberKey 
            JOIN _Job AS J 
            ON S.JobId = J.JobId
            WHERE  J.EmailName = 'IP1_CICLO2_CUIDADOS_PELE_REPELENTES'
            AND J.TriggererSendDefinitionObjectID = 'F4675587-045B-EA11-A2EA-48DF37143ED9'
            AND J.TriggeredSendCustomerKey = '456'
            AND convert(DATE, S.EventDate, 120) = convert(DATE,getdate(),120) 
        ) AS COUNT_SENT
        ,(
            SELECT COUNT(B.SubscriberKey) AS COUNT_BOUNCES
            FROM DE_WARMUP_DROGASIL_JOURNEY DE
            JOIN _Sent S
            ON DE.ID_CLIENTE = S.SubscriberKey 
            JOIN _Bounce B
            ON S.JobID = B.JobID and S.ListID = B.ListID and S.BatchID = B.BatchID and S.SubscriberID = B.SubscriberID and B.IsUnique = 1
            JOIN _Job AS J 
            ON B.JobId = J.JobId
            WHERE  J.EmailName = 'IP1_CICLO2_CUIDADOS_PELE_REPELENTES'
            AND J.TriggererSendDefinitionObjectID = 'F4675587-045B-EA11-A2EA-48DF37143ED9'
            AND J.TriggeredSendCustomerKey = '456'
            AND convert(DATE, S.EventDate, 120) = convert(DATE,getdate(),120) 
        ) AS COUNT_BOUNCES
	FROM DE_WARMUP_DROGASIL_JOURNEY DE
	JOIN _Sent S
	ON DE.ID_CLIENTE = S.SubscriberKey 
	JOIN _Job AS J 
	ON S.JobId = J.JobId
	WHERE  J.EmailName = 'IP1_CICLO2_CUIDADOS_PELE_REPELENTES'
    AND J.TriggererSendDefinitionObjectID = 'F4675587-045B-EA11-A2EA-48DF37143ED9'
    AND J.TriggeredSendCustomerKey = '456'
    AND convert(DATE, S.EventDate, 120) = convert(DATE,getdate(),120) 
GROUP BY J.TriggererSendDefinitionObjectID, J.IPAddress, J.JobID, J.TriggeredSendCustomerKey

UNION

SELECT 
        J.TriggererSendDefinitionObjectID
        ,J.TriggeredSendCustomerKey
        ,J.JobID
        ,'YAHOO' AS DOMINIO
        ,'13.111.157.210' AS IPAddress
        ,GETDATE() AS DATA_WARM
        ,(
            SELECT COUNT(1) AS COUNT_SENT
            FROM DE_WARMUP_DROGASIL_JOURNEY DE
            JOIN _Sent S
            ON DE.ID_CLIENTE = S.SubscriberKey 
            JOIN _Job AS J 
            ON S.JobId = J.JobId
            WHERE  J.EmailName = 'IP1_CICLO2_CUIDADOS_PELE_REPELENTES'
            AND J.TriggererSendDefinitionObjectID = '5E49898D-045B-EA11-A2EA-48DF37143ED9'
            AND J.TriggeredSendCustomerKey = '471'
            AND convert(DATE, S.EventDate, 120) = convert(DATE,getdate(),120) 
        ) AS COUNT_SENT
        ,(
            SELECT COUNT(B.SubscriberKey) AS COUNT_BOUNCES
            FROM DE_WARMUP_DROGASIL_JOURNEY DE
            JOIN _Sent S
            ON DE.ID_CLIENTE = S.SubscriberKey 
            JOIN _Bounce B
            ON S.JobID = B.JobID and S.ListID = B.ListID and S.BatchID = B.BatchID and S.SubscriberID = B.SubscriberID and B.IsUnique = 1
            JOIN _Job AS J 
            ON B.JobId = J.JobId
            WHERE  J.EmailName = 'IP1_CICLO2_CUIDADOS_PELE_REPELENTES'
            AND J.TriggererSendDefinitionObjectID = '5E49898D-045B-EA11-A2EA-48DF37143ED9'
            AND J.TriggeredSendCustomerKey = '471'
            AND convert(DATE, S.EventDate, 120) = convert(DATE,getdate(),120) 
        ) AS COUNT_BOUNCES
	FROM DE_WARMUP_DROGASIL_JOURNEY DE
	JOIN _Sent S
	ON DE.ID_CLIENTE = S.SubscriberKey 
	JOIN _Job AS J 
	ON S.JobId = J.JobId
	WHERE  J.EmailName = 'IP1_CICLO2_CUIDADOS_PELE_REPELENTES'
    AND J.TriggererSendDefinitionObjectID = '5E49898D-045B-EA11-A2EA-48DF37143ED9'
    AND J.TriggeredSendCustomerKey = '471'
    AND convert(DATE, S.EventDate, 120) = convert(DATE,getdate(),120) 
GROUP BY J.TriggererSendDefinitionObjectID, J.IPAddress, J.JobID, J.TriggeredSendCustomerKey

UNION

SELECT 
        J.TriggererSendDefinitionObjectID
        ,J.TriggeredSendCustomerKey
        ,J.JobID
        ,'OUTROS' AS DOMINIO
        ,'13.111.157.210' AS IPAddress
        ,GETDATE() AS DATA_WARM
        ,(
            SELECT COUNT(1) AS COUNT_SENT
            FROM DE_WARMUP_DROGASIL_JOURNEY DE
            JOIN _Sent S
            ON DE.ID_CLIENTE = S.SubscriberKey 
            JOIN _Job AS J 
            ON S.JobId = J.JobId
            WHERE  J.EmailName = 'IP1_CICLO2_CUIDADOS_PELE_REPELENTES'
            AND J.TriggererSendDefinitionObjectID = 'D149898D-045B-EA11-A2EA-48DF37143ED9'
            AND J.TriggeredSendCustomerKey = '481'
            AND convert(DATE, S.EventDate, 120) = convert(DATE,getdate(),120) 
        ) AS COUNT_SENT
        ,(
            SELECT COUNT(B.SubscriberKey) AS COUNT_BOUNCES
            FROM DE_WARMUP_DROGASIL_JOURNEY DE
            JOIN _Sent S
            ON DE.ID_CLIENTE = S.SubscriberKey 
            JOIN _Bounce B
            ON S.JobID = B.JobID and S.ListID = B.ListID and S.BatchID = B.BatchID and S.SubscriberID = B.SubscriberID and B.IsUnique = 1
            JOIN _Job AS J 
            ON B.JobId = J.JobId
            WHERE  J.EmailName = 'IP1_CICLO2_CUIDADOS_PELE_REPELENTES'
            AND J.TriggererSendDefinitionObjectID = 'D149898D-045B-EA11-A2EA-48DF37143ED9'
            AND J.TriggeredSendCustomerKey = '481'
            AND convert(DATE, S.EventDate, 120) = convert(DATE,getdate(),120) 
        ) AS COUNT_BOUNCES
	FROM DE_WARMUP_DROGASIL_JOURNEY DE
	JOIN _Sent S
	ON DE.ID_CLIENTE = S.SubscriberKey 
	JOIN _Job AS J 
	ON S.JobId = J.JobId
	WHERE  J.EmailName = 'IP1_CICLO2_CUIDADOS_PELE_REPELENTES'
    AND J.TriggererSendDefinitionObjectID = 'D149898D-045B-EA11-A2EA-48DF37143ED9'
    AND J.TriggeredSendCustomerKey = '481'
    AND convert(DATE, S.EventDate, 120) = convert(DATE,getdate(),120) 
GROUP BY J.TriggererSendDefinitionObjectID, J.IPAddress, J.JobID, J.TriggeredSendCustomerKey


	

SELECT 
        J.TriggererSendDefinitionObjectID
        ,J.TriggeredSendCustomerKey
        ,J.JobID
        ,'GMAIL' AS DOMINIO
        ,'13.111.157.208' AS IPAddress
        ,GETDATE() AS DATA_WARM
        ,(
            SELECT COUNT(1) AS COUNT_SENT
            FROM DE_WARMUP_RAIA_JOURNEY DE
            JOIN _Sent S
            ON DE.ID_CLIENTE = S.SubscriberKey 
            JOIN _Job AS J 
            ON S.JobId = J.JobId
            WHERE J.TriggeredSendCustomerKey = '649'
            AND convert(DATE, S.EventDate, 120) = convert(DATE,getdate(),120) 
        ) AS COUNT_SENT
        ,(
            SELECT COUNT(B.SubscriberKey) AS COUNT_BOUNCES
            FROM DE_WARMUP_RAIA_JOURNEY DE
            JOIN _Sent S
            ON DE.ID_CLIENTE = S.SubscriberKey 
            JOIN _Bounce B
            ON S.JobID = B.JobID and S.ListID = B.ListID and S.BatchID = B.BatchID and S.SubscriberID = B.SubscriberID and B.IsUnique = 1
            JOIN _Job AS J 
            ON B.JobId = J.JobId
            WHERE J.TriggeredSendCustomerKey = '649'
            AND convert(DATE, S.EventDate, 120) = convert(DATE,getdate(),120) 
        ) AS COUNT_BOUNCES
	FROM DE_WARMUP_RAIA_JOURNEY DE
	JOIN _Sent S
	ON DE.ID_CLIENTE = S.SubscriberKey 
	JOIN _Job AS J 
	ON S.JobId = J.JobId
	WHERE J.TriggeredSendCustomerKey = '649'
    AND convert(DATE, S.EventDate, 120) = convert(DATE,getdate(),120) 
GROUP BY J.TriggererSendDefinitionObjectID, J.IPAddress, J.JobID, J.TriggeredSendCustomerKey

UNION

SELECT 
        J.TriggererSendDefinitionObjectID
        ,J.TriggeredSendCustomerKey
        ,J.JobID
        ,'MICROSOFT' AS DOMINIO
        ,'13.111.157.208' AS IPAddress
        ,GETDATE() AS DATA_WARM
        ,(
            SELECT COUNT(1) AS COUNT_SENT
            FROM DE_WARMUP_RAIA_JOURNEY DE
            JOIN _Sent S
            ON DE.ID_CLIENTE = S.SubscriberKey 
            JOIN _Job AS J 
            ON S.JobId = J.JobId
            WHERE J.TriggeredSendCustomerKey = '732'
            AND convert(DATE, S.EventDate, 120) = convert(DATE,getdate(),120) 
        ) AS COUNT_SENT
        ,(
            SELECT COUNT(B.SubscriberKey) AS COUNT_BOUNCES
            FROM DE_WARMUP_RAIA_JOURNEY DE
            JOIN _Sent S
            ON DE.ID_CLIENTE = S.SubscriberKey 
            JOIN _Bounce B
            ON S.JobID = B.JobID and S.ListID = B.ListID and S.BatchID = B.BatchID and S.SubscriberID = B.SubscriberID and B.IsUnique = 1
            JOIN _Job AS J 
            ON B.JobId = J.JobId
            WHERE J.TriggeredSendCustomerKey = '732'
            AND convert(DATE, S.EventDate, 120) = convert(DATE,getdate(),120) 
        ) AS COUNT_BOUNCES
	FROM DE_WARMUP_RAIA_JOURNEY DE
	JOIN _Sent S
	ON DE.ID_CLIENTE = S.SubscriberKey 
	JOIN _Job AS J 
	ON S.JobId = J.JobId
	WHERE J.TriggeredSendCustomerKey = '732'
    AND convert(DATE, S.EventDate, 120) = convert(DATE,getdate(),120) 
GROUP BY J.TriggererSendDefinitionObjectID, J.IPAddress, J.JobID, J.TriggeredSendCustomerKey

UNION

SELECT 
        J.TriggererSendDefinitionObjectID
        ,J.TriggeredSendCustomerKey
        ,J.JobID
        ,'YAHOO' AS DOMINIO
        ,'13.111.157.208' AS IPAddress
        ,GETDATE() AS DATA_WARM
        ,(
            SELECT COUNT(1) AS COUNT_SENT
            FROM DE_WARMUP_RAIA_JOURNEY DE
            JOIN _Sent S
            ON DE.ID_CLIENTE = S.SubscriberKey 
            JOIN _Job AS J 
            ON S.JobId = J.JobId
            WHERE J.TriggeredSendCustomerKey = '654'
            AND convert(DATE, S.EventDate, 120) = convert(DATE,getdate(),120) 
        ) AS COUNT_SENT
        ,(
            SELECT COUNT(B.SubscriberKey) AS COUNT_BOUNCES
            FROM DE_WARMUP_RAIA_JOURNEY DE
            JOIN _Sent S
            ON DE.ID_CLIENTE = S.SubscriberKey 
            JOIN _Bounce B
            ON S.JobID = B.JobID and S.ListID = B.ListID and S.BatchID = B.BatchID and S.SubscriberID = B.SubscriberID and B.IsUnique = 1
            JOIN _Job AS J 
            ON B.JobId = J.JobId
            WHERE J.TriggeredSendCustomerKey = '654'
            AND convert(DATE, S.EventDate, 120) = convert(DATE,getdate(),120) 
        ) AS COUNT_BOUNCES
	FROM DE_WARMUP_RAIA_JOURNEY DE
	JOIN _Sent S
	ON DE.ID_CLIENTE = S.SubscriberKey 
	JOIN _Job AS J 
	ON S.JobId = J.JobId
	WHERE J.TriggeredSendCustomerKey = '654'
    AND convert(DATE, S.EventDate, 120) = convert(DATE,getdate(),120) 
GROUP BY J.TriggererSendDefinitionObjectID, J.IPAddress, J.JobID, J.TriggeredSendCustomerKey

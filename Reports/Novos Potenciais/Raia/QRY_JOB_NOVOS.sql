SELECT JobID
    ,EmailID
    ,AccountID
    ,AccountUserID
    ,FromName
    ,FromEmail
    ,EmailName
    ,EmailSubject
    ,IPAddress
    ,SendType
    ,SendClassification
    ,EmailSendDefinition
    ,DeduplicateByEmail
    ,TriggererSendDefinitionObjectID
    ,TriggeredSendCustomerKey
FROM _Job
WHERE (EmailName like '%DR_ENG_NOVOSPOTENCIAIS_BOASVINDAS%'
or EmailName like '%DR_ENG_NOVOSPOTENCIAIS_OFERTATURBINADA%'
or EmailName like '%DR_ENG_NOVOSPOTENCIAIS_VOUCHER%'
or EmailName like '%DR_ENG_NOVOSPOTENCIAIS_VOUCHER_REPIQUE%')
and EmailSubject not like '%[Test]%'
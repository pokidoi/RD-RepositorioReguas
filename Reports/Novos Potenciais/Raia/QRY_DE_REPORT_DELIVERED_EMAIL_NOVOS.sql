select su.id_cliente
        ,su.email
from [_Sent] s
join [_JourneyActivity] ja 
on s.TriggererSendDefinitionObjectID = ja.JourneyActivityObjectID
join [_Journey] j
on ja.VersionID = j.VersionID
join DE_ALL_NOVOS_POTENCIAIS_RAIA su
on s.SubscriberKey = su.id_cliente
where ja.ActivityType in  ('EMAIL','EMAILV2')
and j.JourneyName = 'DR_ENG_NOVOSPOTENCIAIS'
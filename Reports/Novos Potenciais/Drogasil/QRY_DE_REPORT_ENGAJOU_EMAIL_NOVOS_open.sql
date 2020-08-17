select su.id_cliente
        ,su.email
        ,o.eventdate as dt_open
from [_Open] o
join [_JourneyActivity] ja 
on o.TriggererSendDefinitionObjectID = ja.JourneyActivityObjectID
join [_Journey] j
on ja.VersionID = j.VersionID
join DE_ALL_NOVOS_POTENCIAIS_DROGASIL su
on su.id_cliente = o.Subscriberkey
where ja.ActivityType in  ('EMAIL','EMAILV2')
and j.JourneyName = 'DS_ENG_NOVOSPOTENCIAIS'
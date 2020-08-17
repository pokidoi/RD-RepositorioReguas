select su.id_cliente
        ,su.email
        ,c.eventdate as dt_click
        ,ee.dt_open as dt_open
from [_Click] c
join [_JourneyActivity] ja 
on c.TriggererSendDefinitionObjectID = ja.JourneyActivityObjectID
join [_Journey] j
on ja.VersionID = j.VersionID
join DE_ALL_NOVOS_POTENCIAIS_RAIA su
on su.id_cliente = c.Subscriberkey
join DE_REPORT_ENGAJOU_EMAIL_NOVOS ee
on ee.ID_CLIENTE = c.Subscriberkey
where ja.ActivityType in  ('EMAIL','EMAILV2')
and j.JourneyName = 'DR_ENG_NOVOSPOTENCIAIS'
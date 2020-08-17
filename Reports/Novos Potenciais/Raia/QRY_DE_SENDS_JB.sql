select j.JourneyName,
cast(s.EventDate as date) as [Date],
ja.ActivityName as 'EmailName',
ja.ActivityExternalKey,
count(s.SubscriberKey) as [Sends]
from [_Sent] s
join [_JourneyActivity] ja 
on s.TriggererSendDefinitionObjectID = ja.JourneyActivityObjectID
join [_Journey] j
on ja.VersionID = j.VersionID
join DE_ALL_NOVOS_POTENCIAIS_RAIA su
on s.SubscriberKey = su.ID_CLIENTE
where ja.ActivityType in  ('EMAIL','EMAILV2')
and j.JourneyName = 'DR_ENG_NOVOSPOTENCIAIS'
group by j.JourneyName,j.JourneyID,cast(s.EventDate as date),ja.ActivityName,ja.ActivityExternalKey
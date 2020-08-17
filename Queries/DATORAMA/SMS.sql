  SELECT  
  JourneyName,
  Instituicao,
  Concurso,
  Curso,
  TipoJornada,
  AnoConcurso,
  SemestreConcurso,
  FORMAT(DataEnvio, 'yyyy-MM-dd') as DataEnvio,
  TipoEnvio,
  SUM(envios) Envio
FROM
(
  SELECT
    journey.JourneyName,
    sms.Instituicao,
    sms.Concurso,
    sms.Curso,
    sms.TipoJornada,
    sms.AnoConcurso,
    sms.SemestreConcurso,
    sms.CreatedDate as DataEnvio,
    'SMS' as TipoEnvio,
    count(sms.SubscriberKey) envios
  FROM 
    ent.DE_SMS_Sents sms
  INNER JOIN
    ent.DV_Journey journey
  ON
    sms.JourneyID = LOWER(journey.JourneyID)
  WHERE
    journey.JourneyStatus = 'Running'
  AND
    CONVERT(DATE, sms.CreatedDate) >= DATEADD(day, -7, CONVERT(DATE, GETDATE()))
  GROUP BY
    journey.JourneyName,
    sms.Instituicao,
    sms.Concurso,
    sms.Curso,
    sms.TipoJornada,
    sms.AnoConcurso,
    sms.SemestreConcurso,
    sms.CreatedDate
) final
GROUP BY
  JourneyName,
  Instituicao,
  Concurso,
  Curso,
  TipoJornada,
  AnoConcurso,
  SemestreConcurso,
  TipoEnvio,
  DataEnvio
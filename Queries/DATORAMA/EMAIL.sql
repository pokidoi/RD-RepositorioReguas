SELECT
    JourneyName,
    EmailName,
    Instituicao,
    Curso,
    Concurso,
    AnoConcurso,
    SemestreConcurso,
    TipoJornada,
    FORMAT(DataEnvio, 'yyyy-MM-dd') AS DataEnvio,
    TipoBounce,
    SUM(envios) Envios,
    SUM(cliques) Cliques,
    SUM(aberturas) Aberturas,
    SUM(bounces) Bounces
FROM
    (
        SELECT
            c.JourneyName,
            j.EmailName,
            s.Instituicao,
            s.Concurso,
            s.Curso,
            s.AnoConcurso,
            s.SemestreConcurso,
            s.TipoJornada,
            s.CreatedDate AS DataEnvio,
            COUNT(s.JobID) envios,
            COUNT(clk.JobID) cliques,
            COUNT(o.JobID) aberturas,
            COUNT(b.JobID) bounces,
            b.BounceCategory as TipoBounce
        FROM
            (
                SELECT
                    j.JourneyName,
                    s.JobID,
                    s.SubscriberKey
                FROM
                    ent.DV_Journey j
                    LEFT JOIN ent.DE_Journey_Sents s ON LOWER(j.JourneyID) = LOWER(s.JourneyID)
                WHERE
                    j.JourneyStatus IN ('Running')
                GROUP BY
                    j.JourneyName,
                    s.JobID,
                    s.SubscriberKey
            ) c
            LEFT JOIN (
                SELECT
                    DISTINCT JobID,
                    SubscriberKey,
                    EventDate,
                    IsUnique
                FROM
                    ent.DV_Click
            ) clk ON clk.JobID = c.JobID
            AND clk.SubscriberKey = c.SubscriberKey
            AND clk.IsUnique = 1
            LEFT JOIN (
                SELECT
                    DISTINCT JobID,
                    SubscriberKey,
                    EventDate,
                    IsUnique
                FROM
                    ent.DV_Open
            ) o ON o.JobID = c.JobID
            AND o.SubscriberKey = c.SubscriberKey
            AND o.IsUnique = 1
            LEFT JOIN (
                SELECT
                    DISTINCT JobID,
                    SubscriberKey,
                    IsUnique,
                    EventDate,
                    BounceCategory
                FROM
                    ent.DV_Bounce
            ) b ON b.JobID = c.JobID
            AND b.SubscriberKey = c.SubscriberKey
            AND b.IsUnique = 1
            LEFT JOIN (
                SELECT
                    DISTINCT JobID,
                    Instituicao,
                    Concurso,
                    Curso,
                    AnoConcurso,
                    SemestreConcurso,
                    TipoJornada,
                    CreatedDate,
                    SubscriberKey
                FROM
                    ent.DE_Journey_Sents
            ) s ON s.JobID = c.JobID
            AND s.SubscriberKey = c.SubscriberKey
            INNER JOIN (
                SELECT
                    DISTINCT JobID,
                    EmailName
                FROM
                    ent.DV_Job
            ) j ON j.JobID = c.JobID
        WHERE
            CONVERT(DATE, s.CreatedDate) >= DATEADD(day, -7, CONVERT(DATE, GETDATE()))
        GROUP BY
            j.EmailName,
            c.JourneyName,
            s.Instituicao,
            s.Concurso,
            s.Curso,
            s.AnoConcurso,
            s.SemestreConcurso,
            s.TipoJornada,
            s.CreatedDate,
            b.BounceCategory
    ) q
GROUP BY
    JourneyName,
    EmailName,
    Instituicao,
    Curso,
    Concurso,
    AnoConcurso,
    SemestreConcurso,
    TipoJornada,
    DataEnvio,
    TipoBounce,
    Envios,
    Cliques,
    Aberturas,
    Bounces
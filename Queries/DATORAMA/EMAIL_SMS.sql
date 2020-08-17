SELECT
    ROW_NUMBER() OVER (ORDER BY T.JourneyName) as PKey,
	T.JourneyName,
	T.TipoJornada,
	T.EmailName,
	T.Instituicao,
	T.Concurso,
	T.AnoConcurso,
	T.SemestreConcurso,
	T.DataEnvio,
	T.Envios,
	T.Cliques,
	T.Aberturas,
	T.Bounces,
	T.TipoBounce,
	T.TipoEnvio,
	T.Curso
FROM
	(SELECT
		JourneyName,
		TipoJornada,
		EmailName,
		Instituicao,
		Concurso,
		AnoConcurso,
		SemestreConcurso,
		DataEnvio,
		Envios,
		Cliques,
		Aberturas,
		Bounces,
		TipoBounce,
		TipoEnvio,
		Curso

	FROM
		ent.IntermediateEmailSents

	UNION ALL

	SELECT
		JourneyName,
		TipoJornada,
		'' as EmailName,
		Instituicao,
		Concurso,
		AnoConcurso,
		SemestreConcurso,
		DataEnvio,
		Envio as Envios,
		0 as Cliques,
		0 as Aberturas,
		0 as Bounces,
		'' as TipoBounce,
		TipoEnvio,
		Curso


	FROM
		ent.DatoramaEnvioSMS
	) T

	
SELECT
    PTR.ID_CLIENTE
    ,3 AS CD_CAMPANHA_SECAO    
    ,3 AS CD_CAMPANHA_ACAO
    ,1 AS CD_CAMPANHA_STATUS
    ,1 AS NR_PRIORIDADE_SECAO
    ,1 AS FL_ATIVO
    ,8 AS CD_CAMPANHA_CANAL
    ,1 AS CD_LOGOMARCA/*1 PARA RAIA E 2 PARA DROGASIL*/
    ,999 AS CD_CAMPANHA_OFERTA_POOL/*999 PARA RAIA E 998 PARA DROGASIL*/
    ,'06000002301008' AS NR_PROMOCIONAL/*CHECAR NA DE_NR_CONSULTA PARA DIFERENTES BANDEIRAS*/
    ,'126706' AS CD_CAMPANHA_OFERTA/*CHECAR NA DE_NR_CONSULTA PARA DIFERENTES BANDEIRAS*/
    ,10 AS VL_DESCONTO
    ,2 AS CD_GRUPO
    ,PTR.FILIAL_CADASTRO AS CD_FILIAL
    ,CONVERT(VARCHAR,GETDATE(), 103) AS DT_INICIO
    ,CONVERT(VARCHAR,GETDATE()+15, 103) AS DT_FIM
FROM DE_PRE_SEGMENTACAO_EX_FIEL_RAIA PTR /*CHECAR A DE PARA A RÉGUA*/
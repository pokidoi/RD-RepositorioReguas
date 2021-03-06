SELECT
    PTR.ID_CLIENTE
    ,3 as CD_CAMPANHA_SECAO    
    ,1 AS CD_CAMPANHA_STATUS
    ,1 AS NR_PRIORIDADE_SECAO
    ,1 AS FL_ATIVO
    ,8 AS CD_CAMPANHA_CANAL
    ,1 AS CD_LOGOMARCA
    ,999 AS CD_CAMPANHA_OFERTA_POOL
    ,PTR.NR_PROMOCIONAL_VC AS NR_PROMOCIONAL
    ,PTR.CD_CAMPANHA_OFERTA_RAIA_VC AS CD_CAMPANHA_OFERTA
    ,PTR.FILIAL_CADASTRO AS CD_FILIAL
    ,CONVERT(VARCHAR,GETDATE(), 101) AS DT_INICIO
    ,CONVERT(VARCHAR,GETDATE()+7, 101) AS DT_FIM
FROM DE_ALL_NOVOS_POTENCIAIS_RAIA PTR
INNER JOIN DE_DH_NOVOS_POTENCIAIS_RAIA DNPR
ON PTR.ID_CLIENTE = DNPR.ID_CLIENTE
WHERE PTR.NR_PROMOCIONAL_VC IS NOT NULL
AND PTR.CD_CAMPANHA_OFERTA_RAIA_VC IS NOT NULL
AND (PTR.FL_STEP = 1 OR PTR.FL_STEP = 2)
AND CONVERT(DATE, PTR.DT_VOUCHER, 101)= CONVERT(DATE,GETDATE(), 101)
AND NOT EXISTS
(
    SELECT 1
    FROM DE_COMPRADORES_POTENCIAIS_RAIA CPR
    WHERE PTR.ID_CLIENTE = CPR.ID_CLIENTE
)
SELECT 
    ACR.ID_CLIENTE 
    ,ACR.CD_PRODUTO 
    ,CL.CD_FILIAL_FREQ 
FROM DE_CRONICOS_RAIA ACR
INNER JOIN DE_CAD_CLIENTE_RAIA CL 
ON ACR.ID_CLIENTE = CL.ID_CLIENTE
INNER JOIN ENT.DE_CAD_FILIAL DCF
ON DCF.CD_FILIAL = CL.CD_FILIAL_FREQ
WHERE CL.CD_FILIAL_FREQ IS NOT NULL
AND DCF.FL_TERMINAL_CONSULTA = 1
AND DCF.BANDEIRA LIKE '%RAIA%' 
AND EXISTS
(
    SELECT FL.ID_CLIENTE
    FROM DE_FULL_COMPRADORES_CRONICOS_RAIA FL
    WHERE FL.ID_CLIENTE = ACR.ID_CLIENTE 
    GROUP BY FL.ID_CLIENTE
    HAVING COUNT(FL.ID_CLIENTE) = 1
)
AND NOT EXISTS
(
    SELECT 1
    FROM ent.DE_CAD_DONOTCALL DNC
    WHERE DNC.DDD_TELEFONE = CL.TEL_CELULAR
)
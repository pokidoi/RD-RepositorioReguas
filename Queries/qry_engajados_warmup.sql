SELECT RD.EmailAddress, RD.IdCliente, RD.Logomarca,
CASE 
        WHEN RD.EmailAddress LIKE '%@hotmail%' THEN 'HOTMAIL'        
        WHEN RD.EmailAddress LIKE '%@gmail%' THEN 'GMAIL'
        WHEN RD.EmailAddress LIKE '%@yahoo%' THEN 'YAHOO'
        WHEN RD.EmailAddress LIKE '%@outlook%' THEN 'OUTLOOK'
        WHEN RD.EmailAddress LIKE '%@bol%' THEN 'BOL'        
        WHEN RD.EmailAddress LIKE '%@uol%' THEN 'UOL'
        WHEN RD.EmailAddress LIKE '%@msn%' THEN 'MSN'
        ELSE 'OUTROS'
    END AS Dominio
FROM DE_ENGAJADOS_RD RD
WHERE RD.Logomarca like '%DrogaRaia%' AND 
NOT EXISTS (
        SELECT EG.EmailAddress, EG.IdCliente
        FROM DE_INTER_ENGAJADOS EG
        WHERE EG.EmailAddress = RD.EmailAddress
)



SELECT RD.EmailAddress, RD.IdCliente, RD.Logomarca,
CASE 
        WHEN RD.EmailAddress LIKE '%@hotmail%' THEN 'HOTMAIL'        
        WHEN RD.EmailAddress LIKE '%@gmail%' THEN 'GMAIL'
        WHEN RD.EmailAddress LIKE '%@yahoo%' THEN 'YAHOO'
        WHEN RD.EmailAddress LIKE '%@outlook%' THEN 'OUTLOOK'
        WHEN RD.EmailAddress LIKE '%@bol%' THEN 'BOL'        
        WHEN RD.EmailAddress LIKE '%@uol%' THEN 'UOL'
        WHEN RD.EmailAddress LIKE '%@msn%' THEN 'MSN'
        ELSE 'OUTROS'
    END AS Dominio
FROM DE_ENGAJADOS_RD RD
WHERE RD.Logomarca like '%Drogasil%' AND 
NOT EXISTS (
        SELECT EG.EmailAddress, EG.IdCliente
        FROM DE_INTER_ENGAJADOS EG
        WHERE EG.EmailAddress = RD.EmailAddress
)
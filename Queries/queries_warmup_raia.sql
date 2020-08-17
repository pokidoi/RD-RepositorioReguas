SELECT RD.EmailAddress, RD.IdCliente, RD.Logomarca,
CASE 
        WHEN RD.EmailAddress LIKE '%@hotmail%' THEN 'MICROSOFT'        
        WHEN RD.EmailAddress LIKE '%@gmail%' THEN 'GMAIL'
        WHEN RD.EmailAddress LIKE '%@yahoo%' THEN 'YAHOO'
        WHEN RD.EmailAddress LIKE '%@outlook%' THEN 'MICROSOFT'
        WHEN RD.EmailAddress LIKE '%@msn%' THEN 'MICROSOFT'
        ELSE 'OUTROS'
    END AS Dominio
FROM DE_ENGAJADOS_RD RD
WHERE RD.Logomarca like '%DrogaRaia%' AND 
NOT EXISTS (
        SELECT EG.EmailAddress, EG.IdCliente
        FROM DE_INTER_ENGAJADOS EG
        WHERE EG.EmailAddress = RD.EmailAddress
)
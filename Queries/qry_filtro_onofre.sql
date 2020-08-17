
    SELECT A.ID_CLIENTE, A.STATUS, A.EMAIL, 
    CASE 
        WHEN A.EMAIL LIKE '%@hotmail%' THEN 'MICROSOFT'            
        WHEN A.EMAIL LIKE '%@outlook%' THEN 'MICROSOFT'
        WHEN A.EMAIL LIKE '%@msn%' THEN 'MICROSOFT'    
        WHEN A.EMAIL LIKE '%@gmail%' THEN 'GMAIL'
        WHEN A.EMAIL LIKE '%@yahoo%' THEN 'YAHOO'
        ELSE 'OUTROS'
    END AS DOMINIO
    FROM DE_FULL_ONOFRE A
    WHERE B.STATUS NOT IN ('Unsubscribed','Held','Bounced')

    
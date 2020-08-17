
    SELECT A.ID_CLIENTE, A.NOME_COMPLETO, A.EMAIL, 
    CASE
        WHEN A.FLAG IS NULL THEN 'ABANDONOU'
    END AS FLAG,
    CASE 
        WHEN A.EMAIL LIKE '%@hotmail%' THEN 'HOTMAIL'        
        WHEN A.EMAIL LIKE '%@gmail%' THEN 'GMAIL'
        WHEN A.EMAIL LIKE '%@yahoo%' THEN 'YAHOO'
        WHEN A.EMAIL LIKE '%@outlook%' THEN 'OUTLOOK'
        WHEN A.EMAIL LIKE '%@bol%' THEN 'BOL'        
        WHEN A.EMAIL LIKE '%@uol%' THEN 'UOL'
        ELSE 'OUTROS'
    END AS DOMINIO
    FROM DE_WARMUP_RAIA_ABANDONOU A

    UNION

    SELECT B.ID_CLIENTE, B.NOME_COMPLETO, B.EMAIL,
    CASE
        WHEN B.FLAG IS NULL THEN 'DESCOMPROMISSADO'
    END AS FLAG,
    CASE 
        WHEN B.EMAIL LIKE '%@hotmail%' THEN 'HOTMAIL'        
        WHEN B.EMAIL LIKE '%@gmail%' THEN 'GMAIL'
        WHEN B.EMAIL LIKE '%@yahoo%' THEN 'YAHOO'
        WHEN B.EMAIL LIKE '%@outlook%' THEN 'OUTLOOK'
        WHEN B.EMAIL LIKE '%@bol%' THEN 'BOL'        
        WHEN B.EMAIL LIKE '%@uol%' THEN 'UOL'
        ELSE 'OUTROS'
    END AS DOMINIO
    FROM DE_WARMUP_RAIA_DESCOMPROMISSADO B

    UNION

    SELECT C.ID_CLIENTE, C.NOME_COMPLETO, C.EMAIL, 
    CASE
        WHEN C.FLAG IS NULL THEN 'EMABANDONO'
    END AS FLAG,
    CASE 
        WHEN C.EMAIL LIKE '%@hotmail%' THEN 'HOTMAIL'        
        WHEN C.EMAIL LIKE '%@gmail%' THEN 'GMAIL'
        WHEN C.EMAIL LIKE '%@yahoo%' THEN 'YAHOO'
        WHEN C.EMAIL LIKE '%@outlook%' THEN 'OUTLOOK'
        WHEN C.EMAIL LIKE '%@bol%' THEN 'BOL'        
        WHEN C.EMAIL LIKE '%@uol%' THEN 'UOL'
        ELSE 'OUTROS'
    END AS DOMINIO
    FROM DE_WARMUP_RAIA_EMABANDONO C

    UNION 

    SELECT D.ID_CLIENTE, D.NOME_COMPLETO, D.EMAIL, 
    CASE
        WHEN D.FLAG IS NULL THEN 'POTENCIAL'
    END AS FLAG,
    CASE 
        WHEN D.EMAIL LIKE '%@hotmail%' THEN 'HOTMAIL'        
        WHEN D.EMAIL LIKE '%@gmail%' THEN 'GMAIL'
        WHEN D.EMAIL LIKE '%@yahoo%' THEN 'YAHOO'
        WHEN D.EMAIL LIKE '%@outlook%' THEN 'OUTLOOK'
        WHEN D.EMAIL LIKE '%@bol%' THEN 'BOL'        
        WHEN D.EMAIL LIKE '%@uol%' THEN 'UOL'
        ELSE 'OUTROS'
    END AS DOMINIO
    FROM DE_WARMUP_RAIA_POTENCIAL D

    UNION 

    SELECT E.ID_CLIENTE, E.NOME_COMPLETO, E.EMAIL, 
    CASE
        WHEN E.FLAG IS NULL THEN 'PREMIUM'
    END AS FLAG,
    CASE 
        WHEN E.EMAIL LIKE '%@hotmail%' THEN 'HOTMAIL'        
        WHEN E.EMAIL LIKE '%@gmail%' THEN 'GMAIL'
        WHEN E.EMAIL LIKE '%@yahoo%' THEN 'YAHOO'
        WHEN E.EMAIL LIKE '%@outlook%' THEN 'OUTLOOK'
        WHEN E.EMAIL LIKE '%@bol%' THEN 'BOL'        
        WHEN E.EMAIL LIKE '%@uol%' THEN 'UOL'
        ELSE 'OUTROS'
    END AS DOMINIO
    FROM DE_WARMUP_RAIA_PREMIUM E

    UNION 

    SELECT F.ID_CLIENTE, F.NOME_COMPLETO, F.EMAIL, 
    CASE
        WHEN F.FLAG IS NULL THEN 'VALIOSO'
    END AS FLAG,
    CASE 
        WHEN F.EMAIL LIKE '%@hotmail%' THEN 'HOTMAIL'        
        WHEN F.EMAIL LIKE '%@gmail%' THEN 'GMAIL'
        WHEN F.EMAIL LIKE '%@yahoo%' THEN 'YAHOO'
        WHEN F.EMAIL LIKE '%@outlook%' THEN 'OUTLOOK'
        WHEN F.EMAIL LIKE '%@bol%' THEN 'BOL'        
        WHEN F.EMAIL LIKE '%@uol%' THEN 'UOL'
        ELSE 'OUTROS'
    END AS DOMINIO
    FROM DE_WARMUP_RAIA_VALIOSO F



    
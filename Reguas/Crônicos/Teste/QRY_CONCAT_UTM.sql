SELECT 
    X.CD_PRODUTO
    ,X.URL_PRODUTO
    ,X.UTM_1
    ,X.UTM_2
    ,X.UTM_3
    ,CONCAT(X.URL_PRODUTO, X.UTM_1) AS URL_PRIMEIRO_LEMBRETE
    ,CONCAT(X.URL_PRODUTO, X.UTM_2) AS URL_SEGUNDO_LEMBRETE
    ,CONCAT(X.URL_PRODUTO, X.UTM_3) AS URL_RESGATE
FROM 
    (
        SELECT 
            TR.CD_PRODUTO
            ,PT.URL_PRODUTO
            ,'?utm_source=crm_reguas&utm_medium=sms&utm_campaign=DR_REL_CRONICOS&utm_content=DR_REL_CRONICOS_LEMBRETE1' AS UTM_1
            ,'?utm_source=crm_reguas&utm_medium=sms&utm_campaign=DR_REL_CRONICOS&utm_content=DR_REL_CRONICOS_LEMBRETE2' AS UTM_2
            ,'?utm_source=crm_reguas&utm_medium=sms&utm_campaign=DR_REL_CRONICOS&utm_content=DR_REL_CRONICOS_RESGATE' AS UTM_3 
        FROM ent.DE_PRODUTO_TRATAMENTO TR
        INNER JOIN DE_PRODUTOS_ONOFRE PT
        ON TR.CD_PRODUTO = PT.CD_PRODUTO
    )X
    

===============================================================================


    SELECT 
    X.CD_PRODUTO
    ,X.URL_PRODUTO
    ,X.UTM_1
    ,X.UTM_2
    ,X.UTM_3
    ,CONCAT(X.URL_PRODUTO, X.UTM_1) AS URL_PRIMEIRO_LEMBRETE
    ,CONCAT(X.URL_PRODUTO, X.UTM_2) AS URL_SEGUNDO_LEMBRETE
    ,CONCAT(X.URL_PRODUTO, X.UTM_3) AS URL_RESGATE
FROM 
    (
        SELECT 
            TR.CD_PRODUTO
            ,PT.URL_PRODUTO
            ,'?utm_source=crm_reguas&utm_medium=sms&utm_campaign=DS_REL_CRONICOS&utm_content=DS_REL_CRONICOS_LEMBRETE1' AS UTM_1
            ,'?utm_source=crm_reguas&utm_medium=sms&utm_campaign=DS_REL_CRONICOS&utm_content=DS_REL_CRONICOS_LEMBRETE2' AS UTM_2
            ,'?utm_source=crm_reguas&utm_medium=sms&utm_campaign=DS_REL_CRONICOS&utm_content=DS_REL_CRONICOS_RESGATE' AS UTM_3 
        FROM ent.DE_PRODUTO_TRATAMENTO TR
        INNER JOIN DE_PRODUTOS_DROGASIL PT
        ON TR.CD_PRODUTO = PT.CD_PRODUTO
    )X




    ===============================================================================



    
    SELECT 
    X.CD_PRODUTO
    ,X.URL_PRODUTO
    ,X.UTM_1
    ,X.UTM_2
    ,X.UTM_3
    ,CONCAT(X.URL_PRODUTO, X.UTM_1) AS URL_PRIMEIRO_LEMBRETE
    ,CONCAT(X.URL_PRODUTO, X.UTM_2) AS URL_SEGUNDO_LEMBRETE
    ,CONCAT(X.URL_PRODUTO, X.UTM_3) AS URL_RESGATE
FROM 
    (
        SELECT 
            TR.CD_PRODUTO
            ,PT.URL_PRODUTO
            ,'?utm_source=crm_reguas&utm_medium=sms&utm_campaign=ON_REL_CRONICOS&utm_content=ON_REL_CRONICOS_LEMBRETE1' AS UTM_1
            ,'?utm_source=crm_reguas&utm_medium=sms&utm_campaign=ON_REL_CRONICOS&utm_content=ON_REL_CRONICOS_LEMBRETE2' AS UTM_2
            ,'?utm_source=crm_reguas&utm_medium=sms&utm_campaign=ON_REL_CRONICOS&utm_content=ON_REL_CRONICOS_RESGATE' AS UTM_3 
        FROM ent.DE_PRODUTO_TRATAMENTO TR
        INNER JOIN DE_PRODUTOS_ONOFRE PT
        ON TR.CD_PRODUTO = PT.CD_PRODUTO
    )X


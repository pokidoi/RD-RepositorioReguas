   Select
        e.Mobile as tel_celular
        ,CRN.ID_CLIENTE
From _smsmessagetracking e
INNER JOIN DE_ALL_CRONICOS_DROGASIL CRN
on e.Mobile = CRN.TEL_CELULAR
where (MessageID = 39
or MessageID = 40
OR MessageID = 26)
AND E.Delivered = 1
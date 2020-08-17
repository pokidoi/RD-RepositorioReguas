   Select
        e.Mobile as tel_celular
        ,CRN.ID_CLIENTE
From _smsmessagetracking e
INNER JOIN DE_ALL_CRONICOS_RAIA_BKP CRN
on e.Mobile = CRN.TEL_CELULAR
where (MessageID = 222
or MessageID = 221
OR MessageID = 171)
AND E.Delivered = 1
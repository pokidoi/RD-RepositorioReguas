   Select
        e.Mobile as tel_celular
        ,CRN.ID_CLIENTE
From _smsmessagetracking e
INNER JOIN DE_ALL_NOVOS_POTENCIAIS_RAIA CRN
on e.Mobile = CRN.TEL_CELULAR
where (MessageID = 179
OR MessageID = 180
OR MessageID = 184
OR MessageID = 182
OR MessageID = 185
OR MessageID = 186
OR MessageID = 187
OR MessageID = 188)
AND E.SENT = 1
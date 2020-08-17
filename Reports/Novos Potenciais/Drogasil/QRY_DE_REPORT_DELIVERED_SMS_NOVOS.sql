   Select
        e.Mobile as tel_celular
        ,CRN.ID_CLIENTE
From _smsmessagetracking e
INNER JOIN DE_ALL_NOVOS_POTENCIAIS_DROGASIL CRN
on e.Mobile = CRN.TEL_CELULAR
where (MessageID = 65
OR MessageID = 67
OR MessageID = 66
OR MessageID = 68
OR MessageID = 69
OR MessageID = 70
OR MessageID = 71
OR MessageID = 72
OR MessageID = 73
OR MessageID = 74
OR MessageID = 29
OR MessageID = 30
OR MessageID = 31
OR MessageID = 32
OR MessageID = 33
OR MessageID = 34
OR MessageID = 35
OR MessageID = 36
OR MessageID = 37
OR MessageID = 38)
AND E.Delivered = 1
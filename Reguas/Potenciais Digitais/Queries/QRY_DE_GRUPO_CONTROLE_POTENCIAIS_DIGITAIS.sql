SELECT ANP.ID_CLIENTE
    ,'POTENCIAIS DIGITAIS' AS REGUA
    ,ANP.DT_JOURNEY AS DT_GRUPO_CONTROLE
FROM DE_ALL_POTENCIAIS_DIGITAIS_RAIA ANP /*TROCAR PARA DE DE DROGASIL*/
WHERE ANP.FLAG_GC = 1
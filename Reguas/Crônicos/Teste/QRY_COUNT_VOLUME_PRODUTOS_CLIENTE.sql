SELECT ID_CLIENTE, CD_PRODUTO, count(*) as VOLUME
FROM DE_FULL_COMPRADORES_CRONICOS_RAIA
GROUP BY ID_CLIENTE, CD_PRODUTO
HAVING COUNT(*) > 1


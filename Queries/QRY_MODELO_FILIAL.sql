SELECT 
    a.CD_FILIAL_FREQ
    /*os campos que precisam ser selecionados*/
FROM DE_CAD_CLIENTE_RAIA A /*Nome da tabela que irá puxar os dados*/
WHERE EXISTS
/*subquery para selecionar apenas as filiais*/
(
    SELECT 1
    FROM /*nome da tabela com as filiais*/ b
    WHERE a.CD_FILIAL_FREQ = b.CD_FILIAL_FREQ
)
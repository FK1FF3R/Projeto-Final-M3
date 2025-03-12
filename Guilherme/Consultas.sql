/* Denúncias por Prioridade*/
SELECT
    prioridade,
    COUNT(*) AS Total_Denuncias
FROM
    Denuncia
GROUP BY
    prioridade
ORDER BY
    Total_Denuncias DESC;

   
    /* Político com Menos Demandas (Emendas)*/

    SELECT
    p.nome AS Nome_Politico,
    COUNT(e.id_emenda) AS Numero_Demandas
FROM
    Politico p
LEFT JOIN
    Emenda e ON p.id_politico = e.id_politico
GROUP BY
    p.id_politico
ORDER BY
    Numero_Demandas ASC
LIMIT 10;


/*Político com Mais Demandas (Emendas)  */

SELECT
    p.nome AS Nome_Politico,
    COUNT(e.id_emenda) AS Numero_Demandas
FROM
    Politico p
JOIN
    Emenda e ON p.id_politico = e.id_politico
GROUP BY
    p.id_politico
ORDER BY
    Numero_Demandas DESC
LIMIT 10;
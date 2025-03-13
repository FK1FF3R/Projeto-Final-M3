-- 1 Total de Valores das Emendas por Ano

SELECT ano, SUM(valor_emenda) AS total_valor_emendas
FROM emendas
GROUP BY ano
ORDER BY ano DESC;

-- 2 Corrupção e Transparência

SELECT id_emenda, area, valor
FROM emendas
WHERE valor > 1000000
ORDER BY valor DESC;

-- 3 Emendas Aprovadas por Ano

SELECT ano, COUNT(*) AS total_emendas_aprovadas
FROM emendas
WHERE status_emenda = 'Aprovada'
GROUP BY ano
ORDER BY ano DESC;
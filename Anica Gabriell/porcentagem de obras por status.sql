SELECT 
    status,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Obra), 2) AS porcentagem
FROM 
    Obra
GROUP BY 
    status;

SELECT 
    setor,
    ROUND(AVG(valor), 2) AS Media_Valor_Gasto
FROM 
    Emenda
GROUP BY 
    setor;

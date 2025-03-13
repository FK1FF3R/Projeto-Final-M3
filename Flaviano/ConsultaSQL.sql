-- Contar o número de emendas por empresa e status

SELECT 
    Emp.nome AS nome_empresa,
    E.status,
    COUNT(E.id_emenda) AS total_emendas
FROM 
    Emenda E
INNER JOIN 
    Empresa Emp ON E.id_empresa = Emp.id_empresa
GROUP BY 
    Emp.nome, E.status;

--  Listar todos os usuários e suas denúncias

SELECT 
    U.nome AS nome_usuario,
    U.email,
    D.id_denuncia,
    D.motivo,
    D.data
FROM 
    Usuario U
LEFT JOIN 
    Denuncia D ON U.id_usuario = D.id_usuario;

-- Calcular a média do valor das emendas por cidade do político

SELECT 
    P.cidade,
    AVG(E.valor) AS media_valor_emendas
FROM 
    Emenda E
INNER JOIN 
    Politico P ON E.id_politico = P.id_politico
GROUP BY 
    P.cidade;

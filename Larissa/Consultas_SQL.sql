-- 1 Consulta: Listar todas as emendas com os detalhes do político e da empresa associada
SELECT 
    E.id_emenda, 
    E.valor, 
    E.motivo, 
    E.setor, 
    E.data_emenda, 
    E.status_emenda, 
    P.nome AS nome_politico, 
    P.cargo, 
    P.partido, 
    Emp.razao_social AS empresa_razao_social, 
    Emp.nome_fantasia AS empresa_nome_fantasia
FROM 
    Emenda E
JOIN 
    Politico P ON E.id_politico = P.id_politico
JOIN 
    Empresa Emp ON E.id_empresa = Emp.id_empresa;

-- 2 Consulta: Listar todas as obras e seus vínculos com emendas
SELECT 
    O.nome AS nome_obra, 
    OE.id_obra_emenda, 
    OE.status_vinculo, 
    E.motivo AS motivo_emenda
FROM 
    Obra O
LEFT JOIN 
    Obra_Emenda OE ON O.id_obra = OE.id_obra
LEFT JOIN 
    Emenda E ON OE.id_emenda = E.id_emenda;

-- 3 Consulta: Listar todos os políticos e denúncias
SELECT 
    P.nome AS nome_politico, 
    D.id_denuncia, 
    D.motivo, 
    D.status_denuncia
FROM 
    Politico P
LEFT JOIN 
    Denuncia D ON P.id_politico = D.id_politico
UNION
SELECT 
    P.nome AS nome_politico, 
    D.id_denuncia, 
    D.motivo, 
    D.status_denuncia
FROM 
    Denuncia D
RIGHT JOIN 
    Politico P ON D.id_politico = P.id_politico;

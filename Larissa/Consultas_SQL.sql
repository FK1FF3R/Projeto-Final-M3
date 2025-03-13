-- 1 Consulta: Listar todas as emendas com os detalhes do político e da empresa associada
SELECT 
    E.id_emenda,
    E.valor,
    E.motivo,
    E.setor,
    E.data_solicitacao,
    E.status,
    P.nome AS nome_politico,
    P.cargo,
    P.partido,
    P.estado,
    P.cidade,
    P.email AS email_politico,
    Emp.nome AS nome_empresa,
    Emp.cnpj,
    Emp.razao_social,
    Emp.localizacao,
    Emp.email AS email_empresa
FROM 
    Emenda E
JOIN 
    Politico P ON E.id_politico = P.id_politico
JOIN 
    Empresa Emp ON E.id_empresa = Emp.id_empresa;

-- 2 Consulta: Listar todas as obras e seus vínculos com emendas
SELECT 
    O.id_obra,
    O.nome AS nome_obra,
    O.local,
    O.data_inicio,
    O.data_termino,
    O.status AS status_obra,
    O.orcamento,
    O.responsavel,
    E.id_emenda,
    E.valor AS valor_emenda,
    E.motivo AS motivo_emenda,
    E.setor AS setor_emenda,
    E.data_solicitacao,
    E.status AS status_emenda,
    Emp.nome AS nome_empresa,
    Emp.cnpj
FROM 
    Obra O
JOIN 
    Emenda E ON O.id_empresa = E.id_empresa
JOIN 
    Empresa Emp ON E.id_empresa = Emp.id_empresa;

-- 3 Consulta: Listar todos os políticos e denúncias
SELECT 
    P.id_politico,
    P.nome AS nome_politico,
    P.cargo,
    P.partido,
    P.estado,
    P.cidade,
    D.id_denuncia,
    D.motivo AS motivo_denuncia,
    D.descricao_detalhada,
    D.data AS data_denuncia,
    D.status AS status_denuncia,
    D.prioridade
FROM 
    Politico P
LEFT JOIN 
    Denuncia D ON P.id_politico = D.id_politico;

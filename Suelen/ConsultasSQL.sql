-- 1 Consulta: Listar todas as emendas pendentes com os detalhes do político e da empresa
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
    Emp.nome_fantasia AS empresa_nome_fantasia,
    Emp.cnpj AS cnpj_empresa
FROM 
    Emenda E
JOIN 
    Politico P ON E.id_politico = P.id_politico
JOIN 
    Empresa Emp ON E.id_empresa = Emp.id_empresa
WHERE 
    E.status_emenda = 'Pendente';

-- 2 Consulta: Listar todas as denúncias resolvidas com os detalhes do denunciante e do político envolvido
SELECT 
    D.id_denuncia, 
    D.nome_denunciante, 
    D.motivo, 
    D.descricao_detalhada, 
    D.data_denuncia, 
    D.status_denuncia, 
    D.prioridade, 
    U.nome AS nome_usuario, 
    P.nome AS nome_politico, 
    Emp.razao_social AS empresa_razao_social, 
    E.motivo AS motivo_emenda, 
    OC.nome_fantasia AS orgao_controle
FROM 
    Denuncia D
JOIN 
    Usuario U ON D.id_usuario = U.id_usuario
LEFT JOIN 
    Politico P ON D.id_politico = P.id_politico
LEFT JOIN 
    Empresa Emp ON D.id_empresa = Emp.id_empresa
LEFT JOIN 
    Emenda E ON D.id_emenda = E.id_emenda
LEFT JOIN 
    OrgaoControle OC ON D.id_orgao = OC.id_orgao
WHERE 
    D.status_denuncia = 'Resolvida';

-- 3 Consulta: Listar todos os órgãos de controle e as denúncias associadas
SELECT 
    OC.nome_fantasia AS orgao_controle, 
    D.id_denuncia, 
    D.motivo, 
    D.status_denuncia
FROM 
    Denuncia D
RIGHT JOIN 
    OrgaoControle OC ON D.id_orgao = OC.id_orgao;

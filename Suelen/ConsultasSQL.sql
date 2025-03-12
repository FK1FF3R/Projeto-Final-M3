-- 1 Consulta: Listar todas as emendas pendentes com os detalhes do político e da empresa
SELECT 
    e.id_emenda,
    e.valor,
    e.motivo,
    e.setor,
    e.data_solicitacao,
    e.status,
    p.nome AS nome_politico,
    p.cargo,
    p.partido,
    p.estado,
    p.cidade,
    emp.nome AS nome_empresa,
    emp.cnpj,
    emp.localizacao
FROM Emenda e
INNER JOIN Politico p ON e.id_politico = p.id_politico
INNER JOIN Empresa emp ON e.id_empresa = emp.id_empresa
WHERE e.status = 'Pendente';

-- 2 Consulta: Listar todas as denúncias resolvidas com os políticos envolvidos
SELECT 
    d.id_denuncia,
    d.motivo,
    d.descricao_detalhada,
    d.data,
    d.status,
    d.prioridade,
    p.nome AS nome_politico,
    p.cargo,
    p.partido,
    p.estado,
    p.cidade
FROM Denuncia d
LEFT JOIN Politico p ON d.id_politico = p.id_politico
WHERE d.status = 'Resolvida';

-- 3 Consulta: Listar todos os órgãos de controle e as denúncias associadas
SELECT 
    o.id_orgao,
    o.nome_fantasia AS orgao_nome,
    o.ramo,
    o.responsavel AS responsavel_orgao,
    d.id_denuncia,
    d.motivo,
    d.descricao_detalhada,
    d.data AS data_denuncia,
    d.status,
    d.prioridade
FROM OrgaoControle o
LEFT JOIN Denuncia d ON o.id_orgao = d.id_orgao;

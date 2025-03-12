-- 1) Consulta de Emendas Aprovadas e Seus Respectivos Políticos
SELECT 
    e.id_emenda,
    e.valor,
    e.motivo,
    e.setor,
    e.data_solicitacao,
    e.status,
    p.nome AS politico_responsavel,
    emp.nome AS empresa_executora
FROM Emenda e
JOIN Politico p ON e.id_politico = p.id_politico
JOIN Empresa emp ON e.id_empresa = emp.id_empresa
WHERE e.status = 'Concluída';

-- 2) Consulta de Obras em Andamento com Seus Orçamentos
SELECT 
    o.id_obra,
    o.nome AS nome_obra,
    o.local,
    o.data_inicio,
    o.data_termino,
    o.status,
    o.orcamento,
    emp.nome AS empresa_responsavel
FROM Obra o
JOIN Empresa emp ON o.id_empresa = emp.id_empresa
WHERE o.status = 'Em andamento';

-- 3) Consulta de Denúncias Pendentes e Seus Envolvidos
SELECT 
    d.id_denuncia,
    d.motivo,
    d.descricao_detalhada,
    d.data,
    d.status,
    d.prioridade,
    u.nome AS usuario_denunciante,
    p.nome AS politico_env,
    emp.nome AS empresa_env
FROM Denuncia d
JOIN Usuario u ON d.id_usuario = u.id_usuario
LEFT JOIN Politico p ON d.id_politico = p.id_politico
LEFT JOIN Empresa emp ON d.id_empresa = emp.id_empresa
WHERE d.status = 'Pendente';

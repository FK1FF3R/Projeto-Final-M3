-- 1 Números de usúarios registrados

SELECT COUNT(*) AS total_usuarios
FROM usuario;

-- 2 Partidos e números de políticos

SELECT partido, COUNT(*) AS numero_de_politicos
FROM politico
GROUP BY partido;


-- 3 Número de denúncias por prioridades

SELECT prioridade, COUNT(*) AS numero_de_denuncias
FROM denuncia
GROUP BY prioridade;
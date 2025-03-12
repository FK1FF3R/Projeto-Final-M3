CREATE DATABASE IF NOT EXISTS Monitoramento_Emendas;
USE Monitoramento_Emendas;

CREATE TABLE Usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(45) NOT NULL UNIQUE,
    senha VARCHAR(45) NOT NULL,
    cpf VARCHAR(14) UNIQUE,
    telefone VARCHAR(13),
    data_cadastro DATE NOT NULL
);

CREATE TABLE Politico (
    id_politico INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    cargo VARCHAR(45) NOT NULL,
    partido VARCHAR(45) NOT NULL,
    estado VARCHAR(45) NOT NULL,
    cidade VARCHAR(45) NOT NULL,
    email VARCHAR(45)
);

CREATE TABLE Empresa (
    id_empresa INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    cnpj VARCHAR(45) NOT NULL UNIQUE,
    razao_social VARCHAR(45) NOT NULL,
    localizacao VARCHAR(45) NOT NULL,
    email VARCHAR(45)
);

CREATE TABLE Emenda (
    id_emenda INT AUTO_INCREMENT PRIMARY KEY,
    valor FLOAT NOT NULL,
    motivo TEXT(6000),
    setor VARCHAR(45) NOT NULL,
    data_solicitacao DATE NOT NULL,
    status ENUM('Ativa', 'Concluída', 'Pendente', 'Cancelada') DEFAULT 'Ativa',
    id_politico INT NOT NULL,
    id_empresa INT NOT NULL,
    FOREIGN KEY (id_politico) REFERENCES Politico(id_politico),
    FOREIGN KEY (id_empresa) REFERENCES Empresa(id_empresa)
);

CREATE TABLE Obra (
    id_obra INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    local VARCHAR(45) NOT NULL,
    data_inicio DATE NOT NULL,
    data_termino DATE NOT NULL,
    status ENUM('Em andamento', 'Concluída', 'Em planejamento') NOT NULL,
    orcamento FLOAT,
    responsavel VARCHAR(100),
    id_empresa INT NOT NULL,
    FOREIGN KEY (id_empresa) REFERENCES Empresa(id_empresa)
);

CREATE TABLE OrgaoControle (
    id_orgao INT AUTO_INCREMENT PRIMARY KEY,
    cnpj VARCHAR(45) NOT NULL UNIQUE,
    razao_social VARCHAR(45) NOT NULL,
    nome_fantasia VARCHAR(45) NOT NULL,
    ramo VARCHAR(45) NOT NULL,
    responsavel VARCHAR(45) NOT NULL,
    telefone VARCHAR(13),
    endereco VARCHAR(100)
);

CREATE TABLE Denuncia (
    id_denuncia INT AUTO_INCREMENT PRIMARY KEY,
    motivo VARCHAR(100) NOT NULL,
    descricao_detalhada TEXT(6000),
    data DATE NOT NULL,
    status ENUM('Em investigação', 'Resolvida', 'Pendente') NOT NULL,
    prioridade ENUM('Alta', 'Média', 'Baixa', 'Crítica') DEFAULT 'Média',
    id_usuario INT NOT NULL,
    id_politico INT,
    id_empresa INT,
    id_emenda INT,
    id_orgao INT,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
    FOREIGN KEY (id_politico) REFERENCES Politico(id_politico),
    FOREIGN KEY (id_empresa) REFERENCES Empresa(id_empresa),
    FOREIGN KEY (id_emenda) REFERENCES Emenda(id_emenda),
    FOREIGN KEY (id_orgao) REFERENCES OrgaoControle(id_orgao)
);
 
SELECT * FROM Politico;
SELECT * FROM Obra;
SELECT * FROM Emenda;
SELECT * FROM Usuario;
SELECT * FROM Empresa;
SELECT * FROM OrgaoControle;
SELECT * FROM Denuncia;
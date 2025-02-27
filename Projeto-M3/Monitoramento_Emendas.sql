CREATE DATABASE Monitoramento_Emendas;

USE Monitoramento_Emendas;

CREATE TABLE Politico (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(200) NOT NULL,
    partido VARCHAR(50) NOT NULL,
    cargo VARCHAR(100) NOT NULL,
    estado CHAR(2) NOT NULL
);

CREATE TABLE Empresa (
    cnpj id INT PRIMARY KEY NOT NULL,
    razao_social VARCHAR(200) NOT NULL,
    nome_fantasia VARCHAR(200) NOT NULL,
    setor VARCHAR(100) NOT NULL,
    localizacao VARCHAR(100) NOT NULL
    );
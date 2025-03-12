CREATE DATABASE IF NOT EXISTS Monitoramento_Emendas;
USE Monitoramento_Emendas;

CREATE TABLE Usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    cpf VARCHAR(14) UNIQUE,
    telefone VARCHAR(20),
    data_cadastro DATE NOT NULL
);

CREATE TABLE Politico (
    id_politico INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    cargo VARCHAR(50) NOT NULL,
    partido VARCHAR(50) NOT NULL,
<<<<<<< HEAD
    estado VARCHAR(2) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    data_inicial DATE NOT NULL,
    data_final DATE NOT NULL,
    email_contato VARCHAR(100)
);

CREATE TABLE Empresa (
    id_empresa INT AUTO_INCREMENT PRIMARY KEY,
    cnpj VARCHAR(18) NOT NULL UNIQUE,
    razao_social VARCHAR(255) NOT NULL,
    nome_fantasia VARCHAR(255) NOT NULL,
    setor VARCHAR(100) NOT NULL,
    localizacao VARCHAR(255) NOT NULL,
    telefone_contato VARCHAR(20),
    email_contato VARCHAR(100)
);

CREATE TABLE Emenda (
    id_emenda INT AUTO_INCREMENT PRIMARY KEY,
    valor DECIMAL(15, 2) NOT NULL,
    motivo VARCHAR(255) NOT NULL,
    setor VARCHAR(100) NOT NULL,
    data_emenda DATE NOT NULL,
    status_emenda VARCHAR(50) DEFAULT 'Ativa',
    id_politico INT NOT NULL,
    id_empresa INT NOT NULL,
    FOREIGN KEY (id_politico) REFERENCES Politico(id_politico),
    FOREIGN KEY (id_empresa) REFERENCES Empresa(id_empresa)
);

CREATE TABLE Obra (
    id_obra INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    local_obra VARCHAR(255) NOT NULL,
    data_inicio DATE NOT NULL,
    data_termino DATE NOT NULL,
    status VARCHAR(50) NOT NULL,
    orcamento DECIMAL(15, 2),
    responsavel_tecnico VARCHAR(255)
);

CREATE TABLE Obra_Emenda (
    id_obra_emenda INT AUTO_INCREMENT PRIMARY KEY,
    id_obra INT NOT NULL,
    id_emenda INT NOT NULL,
    data_associacao DATE NOT NULL,
    responsavel_vinculo VARCHAR(255),
    status_vinculo VARCHAR(50) DEFAULT 'Ativo',
    FOREIGN KEY (id_obra) REFERENCES Obra(id_obra),
    FOREIGN KEY (id_emenda) REFERENCES Emenda(id_emenda)
);

CREATE TABLE OrgaoControle (
    id_orgao INT AUTO_INCREMENT PRIMARY KEY,
    cnpj VARCHAR(18) NOT NULL UNIQUE,
    razao_social VARCHAR(255) NOT NULL,
    nome_fantasia VARCHAR(255) NOT NULL,
    ramo VARCHAR(100) NOT NULL,
    responsavel VARCHAR(255) NOT NULL,
    telefone_contato VARCHAR(20),
    endereco VARCHAR(255)
);

CREATE TABLE Denuncia (
    id_denuncia INT AUTO_INCREMENT PRIMARY KEY,
    nome_denunciante VARCHAR(255),
    motivo VARCHAR(255) NOT NULL,
    descricao_detalhada TEXT,
    data_denuncia DATE NOT NULL,
    status_denuncia VARCHAR(50) NOT NULL,
    prioridade VARCHAR(20) DEFAULT 'Média',
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

INSERT INTO Usuario (nome, email, senha, cpf, telefone, data_cadastro) VALUES
('José Pereira', 'jose.pereira@email.com', 'senha123', '123.476.789-10', '(11) 91234-5678', '2023-01-15'),
('Maria Santos', 'maria.santos@email.com', 'senha456', '987.655.321-00', '(21) 98765-4321', '2023-02-20'),
('Carlos Mendes', 'carlos.mendes@email.com', 'senha789', '111.282.333-44', '(31) 99876-5432', '2023-03-10'),
('Ana Clara', 'ana.clara@email.com', 'senha101', '222.333.446-55', '(51) 98765-6789', '2023-04-05'),
('Bruno Martins', 'bruno.martins@email.com', 'senha202', '333.444.555-66', '(71) 91234-8765', '2023-05-10'),
('Carla Dias', 'carla.dias@email.com', 'senha303', '444.555.616-77', '(85) 92345-6789', '2023-06-15'),
('Daniel Souza', 'daniel.souza@email.com', 'senha404', '595.666.777-88', '(41) 93456-7890', '2023-07-20'),
('Eduarda Lima', 'eduarda.lima@email.com', 'senha505', '666.677.888-99', '(11) 94567-8901', '2023-08-25'),
('Felipe Rocha', 'felipe.rocha@email.com', 'senha606', '777.838.999-00', '(21) 95678-9012', '2023-09-30'),
('Gabriela Castro', 'gabriela.castro@email.com', 'senha707', '838.999.000-11', '(31) 96789-0123', '2023-10-05'),
('Henrique Alves', 'henrique.alves@email.com', 'senha808', '999.000.136-22', '(51) 97890-1234', '2023-11-10'),
('Isabela Santos', 'isabela.santos@email.com', 'senha909', '000.432.222-33', '(71) 98901-2345', '2023-12-15'),
('João Pedro', 'joao.pedro@email.com', 'senha010', '111.222.027-44', '(85) 99012-3456', '2024-01-20');

INSERT INTO Politico (nome, cpf, cargo, partido, estado, cidade, data_inicial, data_final, email_contato) VALUES
('João Silva', '123.456.789-01', 'Deputado', 'PT', 'SP', 'São Paulo', '2019-02-01', '2023-02-01', 'joao.silva@politico.gov.br'),
('Maria Oliveira', '987.654.321-02', 'Senadora', 'PSDB', 'RJ', 'Rio de Janeiro', '2019-03-15', '2023-03-15', 'maria.oliveira@senado.gov.br'),
('Carlos Souza', '111.222.333-04', 'Vereador', 'MDB', 'MG', 'Belo Horizonte', '2019-01-10', '2023-01-10', 'carlos.souza@camaramg.gov.br'),
('Ana Costa', '222.333.444-55', 'Deputada', 'PSOL', 'RS', 'Porto Alegre', '2020-05-20', '2024-05-20', 'ana.costa@deputada.gov.br'),
('Pedro Almeida', '333.444.555-66', 'Senador', 'DEM', 'BA', 'Salvador', '2020-07-01', '2024-07-01', 'pedro.almeida@senado.gov.br'),
('Fernanda Lima', '444.555.666-77', 'Vereadora', 'REDE', 'CE', 'Fortaleza', '2021-09-12', '2025-09-12', 'fernanda.lima@cmfor.ce.gov.br'),
('Ricardo Gomes', '555.666.777-88', 'Deputado', 'PL', 'PR', 'Curitiba', '2021-11-05', '2025-11-05', 'ricardo.gomes@deputadopr.gov.br');

INSERT INTO Empresa (cnpj, razao_social, nome_fantasia, setor, localizacao, telefone_contato, email_contato) VALUES
('12.345.678/0001-01', 'Construtora ABC Ltda', 'Construtora ABC', 'Construção', 'São Paulo, SP', '(11) 3123-4567', 'contato@abcconstrutora.com.br'),
('98.765.432/0001-02', 'Engenharia XYZ S.A.', 'Engenharia XYZ', 'Engenharia', 'Rio de Janeiro, RJ', '(21) 3987-6543', 'engenharia@xyz.com.br'),
('11.222.333/0001-04', 'Infraestrutura 123 Ltda', 'Infraestrutura 123', 'Infraestrutura', 'Belo Horizonte, MG', '(31) 3456-7890', 'contato@infra123.com.br'),
('23.456.789/0001-02', 'Construtora Delta Ltda', 'Construtora Delta', 'Construção', 'Porto Alegre, RS', '(51) 3344-5566', 'delta@construtoradelta.com.br'),
('34.567.890/0001-03', 'Engenharia Omega S.A.', 'Engenharia Omega', 'Engenharia', 'Salvador, BA', '(71) 3890-1122', 'contato@omegaengenharia.com.br'),
('45.678.901/0001-04', 'Infraestrutura Gamma Ltda', 'Infraestrutura Gamma', 'Infraestrutura', 'Fortaleza, CE', '(85) 3980-3344', 'gamma@infraestrutura.com.br'),
('56.789.012/0001-05', 'Tecnologia Sigma S.A.', 'Tecnologia Sigma', 'Tecnologia', 'Curitiba, PR', '(41) 3890-5566', 'contato@sigmatec.com.br');

INSERT INTO Emenda (valor, motivo, setor, data_emenda, status_emenda, id_politico, id_empresa) VALUES
(100000.00, 'Reforma de escolas', 'Educação', '2022-07-01', 'Ativa', 1, 1),
(200000.00, 'Construção de ponte', 'Infraestrutura', '2022-08-15', 'Concluída', 2, 2),
(150000.00, 'Pavimentação de ruas', 'Urbanismo', '2022-09-10', 'Ativa', 3, 3),
(300000.00, 'Construção de hospital', 'Saúde', '2022-10-01', 'Pendente', 4, 4),
(250000.00, 'Ampliação de rede de esgoto', 'Saneamento', '2022-11-01', 'Cancelada', 5, 5),
(400000.00, 'Modernização de escolas', 'Educação', '2022-12-01', 'Ativa', 6, 6),
(350000.00, 'Compra de equipamentos tecnológicos', 'Tecnologia', '2023-01-01', 'Concluída', 7, 7);

INSERT INTO Obra (nome, local_obra, data_inicio, data_termino, status, orcamento, responsavel_tecnico) VALUES
('Reforma da Escola Municipal', 'São Paulo, SP', '2022-07-15', '2023-07-15', 'Em andamento', 120000.00, 'Eng. Paulo Henrique'),
('Construção da Ponte Rio-Niterói', 'Rio de Janeiro, RJ', '2022-08-20', '2024-08-20', 'Em andamento', 2500000.00, 'Eng. Marta Silva'),
('Pavimentação da Avenida Principal', 'Belo Horizonte, MG', '2022-09-15', '2023-09-15', 'Concluída', 800000.00, 'Eng. João Pedro'),
('Construção do Hospital Municipal', 'Porto Alegre, RS', '2022-10-15', '2024-10-15', 'Em andamento', 3200000.00, 'Eng. Ana Beatriz'),
('Ampliação da Rede de Esgoto', 'Salvador, BA', '2022-11-20', '2023-11-20', 'Em andamento', 950000.00, 'Eng. Carlos Eduardo'),
('Modernização da Escola Estadual', 'Fortaleza, CE', '2022-12-15', '2023-12-15', 'Concluída', 500000.00, 'Eng. Fernanda Costa'),
('Laboratório de Tecnologia', 'Curitiba, PR', '2023-01-20', '2024-01-20', 'Em planejamento', 1500000.00, 'Eng. Ricardo Lima');

INSERT INTO OrgaoControle (cnpj, razao_social, nome_fantasia, ramo, responsavel, telefone_contato, endereco) VALUES
('12.345.678/0001-01', 'Agência Nacional de Fiscalização', 'Agência Fiscal', 'Fiscalização', 'Carlos Alberto Souza', '(61) 3311-2233', 'Brasília, DF'),
('23.456.789/0001-02', 'Tribunal de Contas do Estado', 'TCE-SP', 'Controle Público', 'Renata Costa Silva', '(11) 3222-3344', 'São Paulo, SP'),
('34.567.890/0001-03', 'Controladoria Geral da União', 'CGU', 'Controle Interno', 'José Pereira Martins', '(61) 3456-7788', 'Brasília, DF'),
('45.678.901/0001-04', 'Agência de Regulação de Serviços Públicos', 'ARSP', 'Regulação', 'Fernanda Lima Souza', '(27) 3333-4455', 'Vitória, ES'),
('56.789.012/0001-05', 'Comissão de Ética do Congresso Nacional', 'CEC', 'Ética', 'Ricardo Gomes Alves', '(61) 3344-5566', 'Brasília, DF'),
('67.890.123/0001-06', 'Instituto de Transparência e Integridade', 'ITI', 'Transparência', 'Luciana Fernandes Costa', '(11) 3455-6677', 'São Paulo, SP'),
('78.901.234/0001-07', 'Fiscalização do Sistema de Saúde', 'FSS', 'Saúde Pública', 'Marcos Antônio Ribeiro', '(31) 3344-7788', 'Belo Horizonte, MG');

INSERT INTO Obra_Emenda (id_obra, id_emenda, data_associacao, responsavel_vinculo, status_vinculo) VALUES
(1, 1, '2022-07-10', 'Eng. Paulo Henrique', 'Ativo'),
(2, 2, '2022-08-18', 'Eng. Marta Silva', 'Ativo'),
(3, 3, '2022-09-12', 'Eng. João Pedro', 'Concluído'),
(4, 4, '2022-10-12', 'Eng. Ana Beatriz', 'Ativo'),
(5, 5, '2022-11-18', 'Eng. Carlos Eduardo', 'Cancelado'),
(6, 6, '2022-12-12', 'Eng. Fernanda Costa', 'Concluído'),
(7, 7, '2023-01-18', 'Eng. Ricardo Lima', 'Planejamento');

INSERT INTO Denuncia (
    nome_denunciante, 
    motivo, 
    descricao_detalhada,
    data_denuncia, 
    status_denuncia, 
    prioridade,
    id_usuario, 
    id_politico, 
    id_empresa, 
    id_emenda, 
    id_orgao
) VALUES
('Anônimo', 
 'Desvio de recursos na obra da ponte', 
 'Há indícios de que parte do valor destinado à construção da ponte foi desviado para outras finalidades.', 
 '2022-09-15', 
 'Em investigação', 
 'Alta', 
 1, 1, 1, 1, 1),

('José Pereira', 
 'Superfaturamento na reforma da escola', 
 'Relatórios apontam valores acima do mercado na aquisição de materiais para a reforma da escola municipal.', 
 '2022-08-20', 
 'Resolvida', 
 'Média', 
 1, 2, 2, 2, 2),

('Maria Santos', 
 'Atraso na pavimentação', 
 'As obras de pavimentação estão atrasadas há mais de seis meses sem justificativas claras.', 
 '2022-11-05', 
 'Pendente', 
 'Baixa', 
 2, 3, 3, 3, 3),

('Carlos Mendes', 
 'Falta de transparência na compra de equipamentos', 
 'Os dados sobre a licitação e o processo de compra dos equipamentos não estão disponíveis ao público.', 
 '2022-12-01', 
 'Em investigação', 
 'Alta', 
 3, 4, 4, 4, 4),

('Anônimo', 
 'Atraso na construção do hospital', 
 'A construção do hospital regional está parada, sem previsão de retomada, impactando a população local.', 
 '2023-02-01', 
 'Em investigação', 
 'Crítica', 
 2, 5, 5, 5, 5),

('José Pereira', 
 'Superfaturamento na ampliação da rede de esgoto', 
 'Contratos indicam valores superiores ao preço de mercado para os serviços de ampliação da rede de esgoto.', 
 '2023-03-01', 
 'Pendente', 
 'Média', 
 1, 6, 6, 6, 6),

('Maria Santos', 
 'Falta de transparência na modernização da escola', 
 'O portal da transparência não disponibiliza dados sobre os gastos na modernização da escola estadual.', 
 '2023-04-01', 
 'Resolvida', 
 'Baixa', 
 2, 7, 7, 7, 7),

('Carlos Mendes', 
 'Desvio de recursos no laboratório de tecnologia', 
 'Investigação aponta que recursos destinados ao laboratório de tecnologia foram utilizados de forma irregular.', 
 '2023-05-01', 
 'Em investigação', 
 'Alta', 
 3, 1, 1, 1, 1);
 
SELECT * FROM Politico;
SELECT * FROM Obra_Emenda;
SELECT * FROM Obra;
SELECT * FROM Emenda;
SELECT * FROM Usuario;
SELECT * FROM Empresa;
SELECT * FROM OrgaoControle;
SELECT * FROM Denuncia;
=======
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
>>>>>>> a16863d3f797f71720d9c66bdcfc0a06d21e6004

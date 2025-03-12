CREATE DATABASE IF NOT EXISTS Monitoramento_Emendas;
USE Monitoramento_Emendas;

CREATE TABLE Usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(45) NOT NULL UNIQUE,
    senha VARCHAR(45) NOT NULL,
    cpf VARCHAR(14) UNIQUE,
    telefone VARCHAR(14),
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

INSERT INTO Usuario (nome, email, senha, cpf, telefone, data_cadastro) VALUES
('José Pereira', 'jose.pereira@email.com', 'senha123', '123.476.789-10', '(11)91234-5678', '2023-01-15'),
('Maria Santos', 'maria.santos@email.com', 'senha456', '987.655.321-00', '(21)98765-4321', '2023-02-20'),
('Carlos Mendes', 'carlos.mendes@email.com', 'senha789', '111.282.333-44', '(31)99876-5432', '2023-03-10'),
('Ana Clara', 'ana.clara@email.com', 'senha101', '222.333.446-55', '(51)98765-6789', '2023-04-05'),
('Bruno Martins', 'bruno.martins@email.com', 'senha202', '333.444.555-66', '(71)91234-8765', '2023-05-10'),
('Carla Dias', 'carla.dias@email.com', 'senha303', '444.555.616-77', '(85)92345-6789', '2023-06-15'),
('Daniel Souza', 'daniel.souza@email.com', 'senha404', '595.666.777-88', '(41)93456-7890', '2023-07-20'),
('Eduarda Lima', 'eduarda.lima@email.com', 'senha505', '666.677.888-99', '(11)94567-8901', '2023-08-25'),
('Felipe Rocha', 'felipe.rocha@email.com', 'senha606', '777.838.999-00', '(21)95678-9012', '2023-09-30'),
('Gabriela Castro', 'gabriela.castro@email.com', 'senha707', '838.999.000-11', '(31)96789-0123', '2023-10-05'),
('Henrique Alves', 'henrique.alves@email.com', 'senha808', '999.000.136-22', '(51)97890-1234', '2023-11-10'),
('Isabela Santos', 'isabela.santos@email.com', 'senha909', '000.432.222-33', '(71)98901-2345', '2023-12-15'),
('João Pedro', 'joao.pedro@email.com', 'senha010', '111.222.027-44', '(85)99012-3456', '2024-01-20'),
('Laura Fernandes', 'laura.fernandes@email.com', 'senha111', '555.666.777-88', '(11)91234-1234', '2023-02-01'),
('Pedro Henrique', 'pedro.henrique@email.com', 'senha222', '666.777.888-99', '(21)92345-2345', '2023-03-05'),
('Mariana Costa', 'mariana.costa@email.com', 'senha333', '777.888.999-00', '(31)93456-3456', '2023-04-10'),
('Rafael Almeida', 'rafael.almeida@email.com', 'senha444', '888.999.000-11', '(41)94567-4567', '2023-05-15'),
('Camila Lima', 'camila.lima@email.com', 'senha555', '999.000.111-22', '(51)95678-5678', '2023-06-20');

INSERT INTO Politico (nome, cpf, cargo, partido, estado, cidade, email) VALUES
('João Silva', '123.456.789-01', 'Deputado', 'PT', 'SP', 'São Paulo', 'joao.silva@politico.gov.br'),
('Maria Oliveira', '987.654.321-02', 'Senadora', 'PSDB', 'RJ', 'Rio de Janeiro', 'maria.oliveira@senado.gov.br'),
('Carlos Souza', '111.222.333-04', 'Vereador', 'MDB', 'MG', 'Belo Horizonte', 'carlos.souza@camaramg.gov.br'),
('Ana Costa', '222.333.444-55', 'Deputada', 'PSOL', 'RS', 'Porto Alegre', 'ana.costa@deputada.gov.br'),
('Pedro Almeida', '333.444.555-66', 'Senador', 'DEM', 'BA', 'Salvador', 'pedro.almeida@senado.gov.br'),
('Fernanda Lima', '444.555.666-77', 'Vereadora', 'REDE', 'CE', 'Fortaleza', 'fernanda.lima@cmfor.ce.gov.br'),
('Ricardo Gomes', '555.666.777-88', 'Deputado', 'PL', 'PR', 'Curitiba', 'ricardo.gomes@deputadopr.gov.br'),
('Lucas Oliveira', '123.123.123-01', 'Deputado', 'PSB', 'PE', 'Recife', 'lucas.oliveira@politico.gov.br'),
('Juliana Santos', '456.456.456-02', 'Senadora', 'PV', 'SC', 'Florianópolis', 'juliana.santos@senado.gov.br'),
('Roberto Alves', '789.789.789-03', 'Vereador', 'PCdoB', 'AM', 'Manaus', 'roberto.alves@camaraam.gov.br'),
('Patrícia Lima', '321.321.321-04', 'Deputada', 'PSD', 'GO', 'Goiânia', 'patricia.lima@deputada.gov.br'),
('Fernando Costa', '654.654.654-05', 'Senador', 'PSC', 'PA', 'Belém', 'fernando.costa@senado.gov.br');

INSERT INTO Empresa (nome, cnpj, razao_social, localizacao, email) VALUES
('Construtora ABC', '12.345.678/0001-01', 'Construtora ABC Ltda', 'São Paulo, SP', 'contato@abcconstrutora.com.br'),
('Engenharia XYZ', '98.765.432/0001-02', 'Engenharia XYZ S.A.', 'Rio de Janeiro, RJ', 'engenharia@xyz.com.br'),
('Infraestrutura 123', '11.222.333/0001-04', 'Infraestrutura 123 Ltda', 'Belo Horizonte, MG', 'contato@infra123.com.br'),
('Construtora Delta', '23.456.789/0001-02', 'Construtora Delta Ltda', 'Porto Alegre, RS', 'delta@construtoradelta.com.br'),
('Engenharia Omega', '34.567.890/0001-03', 'Engenharia Omega S.A.', 'Salvador, BA', 'contato@omegaengenharia.com.br'),
('Infraestrutura Gamma', '45.678.901/0001-04', 'Infraestrutura Gamma Ltda', 'Fortaleza, CE', 'gamma@infraestrutura.com.br'),
('Tecnologia Sigma', '56.789.012/0001-05', 'Tecnologia Sigma S.A.', 'Curitiba, PR', 'contato@sigmatec.com.br'),
('Construções Beta', '12.345.678/0002-01', 'Construções Beta Ltda', 'Brasília, DF', 'contato@construcoesbeta.com.br'),
('Engenharia Alfa', '98.765.432/0002-02', 'Engenharia Alfa S.A.', 'Curitiba, PR', 'engenharia@alfa.com.br'),
('Infraestrutura Gama', '11.222.333/0002-04', 'Infraestrutura Gama Ltda', 'Salvador, BA', 'contato@infragama.com.br'),
('Tecnologia Delta', '23.456.789/0002-02', 'Tecnologia Delta Ltda', 'Fortaleza, CE', 'delta@tecnologiadelta.com.br'),
('Construções Zeta', '34.567.890/0002-03', 'Construções Zeta S.A.', 'Porto Alegre, RS', 'contato@construcoeszeta.com.br');

INSERT INTO Emenda (valor, motivo, setor, data_solicitacao, status, id_politico, id_empresa) VALUES
(100000.00, 'Reforma de escolas', 'Educação', '2022-07-01', 'Ativa', 1, 1),
(200000.00, 'Construção de ponte', 'Infraestrutura', '2022-08-15', 'Concluída', 2, 2),
(150000.00, 'Pavimentação de ruas', 'Urbanismo', '2022-09-10', 'Ativa', 3, 3),
(300000.00, 'Construção de hospital', 'Saúde', '2022-10-01', 'Pendente', 4, 4),
(250000.00, 'Ampliação de rede de esgoto', 'Saneamento', '2022-11-01', 'Cancelada', 5, 5),
(400000.00, 'Modernização de escolas', 'Educação', '2022-12-01', 'Ativa', 6, 6),
(350000.00, 'Compra de equipamentos tecnológicos', 'Tecnologia', '2023-01-01', 'Concluída', 7, 7),
(50000.00, 'Reforma de creches', 'Educação', '2023-02-01', 'Ativa', 8, 8),
(75000.00, 'Construção de ciclovias', 'Urbanismo', '2023-03-15', 'Concluída', 9, 9),
(120000.00, 'Ampliação de rede elétrica', 'Energia', '2023-04-10', 'Pendente', 10, 10),
(90000.00, 'Construção de praças', 'Urbanismo', '2023-05-01', 'Cancelada', 11, 11),
(300000.00, 'Modernização de hospitais', 'Saúde', '2023-06-01', 'Ativa', 12, 12);

INSERT INTO Obra (nome, local, data_inicio, data_termino, status, orcamento, responsavel, id_empresa) VALUES
('Reforma da Escola Municipal', 'São Paulo, SP', '2022-07-15', '2023-07-15', 'Em andamento', 120000.00, 'Eng. Paulo Henrique', 1),
('Construção da Ponte Rio-Niterói', 'Rio de Janeiro, RJ', '2022-08-20', '2024-08-20', 'Em andamento', 2500000.00, 'Eng. Marta Silva', 2),
('Pavimentação da Avenida Principal', 'Belo Horizonte, MG', '2022-09-15', '2023-09-15', 'Concluída', 800000.00, 'Eng. João Pedro', 3),
('Construção do Hospital Municipal', 'Porto Alegre, RS', '2022-10-15', '2024-10-15', 'Em andamento', 3200000.00, 'Eng. Ana Beatriz', 4),
('Ampliação da Rede de Esgoto', 'Salvador, BA', '2022-11-20', '2023-11-20', 'Em andamento', 950000.00, 'Eng. Carlos Eduardo', 5),
('Modernização da Escola Estadual', 'Fortaleza, CE', '2022-12-15', '2023-12-15', 'Concluída', 500000.00, 'Eng. Fernanda Costa', 6),
('Laboratório de Tecnologia', 'Curitiba, PR', '2023-01-20', '2024-01-20', 'Em planejamento', 1500000.00, 'Eng. Ricardo Lima', 7),
('Reforma de Creches Municipais', 'Recife, PE', '2023-02-15', '2024-02-15', 'Em andamento', 60000.00, 'Eng. Lucas Silva', 8),
('Construção de Ciclovias Urbanas', 'Florianópolis, SC', '2023-03-20', '2024-03-20', 'Em andamento', 80000.00, 'Eng. Juliana Costa', 9),
('Ampliação da Rede Elétrica', 'Manaus, AM', '2023-04-15', '2024-04-15', 'Concluída', 130000.00, 'Eng. Roberto Alves', 10),
('Construção de Praças Públicas', 'Goiânia, GO', '2023-05-20', '2024-05-20', 'Em planejamento', 95000.00, 'Eng. Patrícia Lima', 11),
('Modernização de Hospitais', 'Belém, PA', '2023-06-15', '2024-06-15', 'Em andamento', 310000.00, 'Eng. Fernando Costa', 12);

INSERT INTO OrgaoControle (cnpj, razao_social, nome_fantasia, ramo, responsavel, telefone, endereco) VALUES
('12.345.678/0001-01', 'Agência Nacional de Fiscalização', 'Agência Fiscal', 'Fiscalização', 'Carlos Alberto Souza', '(61)3311-2233', 'Brasília, DF'),
('23.456.789/0001-02', 'Tribunal de Contas do Estado', 'TCE-SP', 'Controle Público', 'Renata Costa Silva', '(11)3222-3344', 'São Paulo, SP'),
('34.567.890/0001-03', 'Controladoria Geral da União', 'CGU', 'Controle Interno', 'José Pereira Martins', '(61)3456-7788', 'Brasília, DF'),
('45.678.901/0001-04', 'Agência de Regulação de Serviços Públicos', 'ARSP', 'Regulação', 'Fernanda Lima Souza', '(27)3333-4455', 'Vitória, ES'),
('56.789.012/0001-05', 'Comissão de Ética do Congresso Nacional', 'CEC', 'Ética', 'Ricardo Gomes Alves', '(61)3344-5566', 'Brasília, DF'),
('67.890.123/0001-06', 'Instituto de Transparência e Integridade', 'ITI', 'Transparência', 'Luciana Fernandes Costa', '(11)3455-6677', 'São Paulo, SP'),
('78.901.234/0001-07', 'Fiscalização do Sistema de Saúde', 'FSS', 'Saúde Pública', 'Marcos Antônio Ribeiro', '(31)3344-7788', 'Belo Horizonte, MG'),
('12.345.678/0002-01', 'Agência de Fiscalização Estadual', 'AFE-PE', 'Fiscalização', 'Carlos Eduardo Lima', '(81)3311-2233', 'Recife, PE'),
('23.456.789/0002-02', 'Tribunal de Contas Municipal', 'TCM-SC', 'Controle Público', 'Renata Oliveira', '(48)3222-3344', 'Florianópolis, SC'),
('34.567.890/0002-03', 'Controladoria Geral do Estado', 'CGE-AM', 'Controle Interno', 'José Roberto Alves', '(92)3456-7788', 'Manaus, AM'),
('45.678.901/0002-04', 'Agência de Regulação Municipal', 'ARM-GO', 'Regulação', 'Fernanda Souza', '(62)3333-4455', 'Goiânia, GO'),
('56.789.012/0002-05', 'Comissão de Ética Estadual', 'CEE-PA', 'Ética', 'Ricardo Fernandes', '(91)3344-5566', 'Belém, PA');

INSERT INTO Denuncia (motivo, descricao_detalhada, data, status, prioridade, id_usuario, id_politico, id_empresa, id_emenda, id_orgao) VALUES
('Desvio de recursos na obra da ponte', 'Há indícios de que parte do valor destinado à construção da ponte foi desviado para outras finalidades.', '2022-09-15', 'Em investigação', 'Alta', 1, 1, 1, 1, 1),
('Superfaturamento na reforma da escola', 'Relatórios apontam valores acima do mercado na aquisição de materiais para a reforma da escola municipal.', '2022-08-20', 'Resolvida', 'Média', 1, 2, 2, 2, 2),
('Atraso na pavimentação', 'As obras de pavimentação estão atrasadas há mais de seis meses sem justificativas claras.', '2022-11-05', 'Pendente', 'Baixa', 2, 3, 3, 3, 3),
('Falta de transparência na compra de equipamentos', 'Os dados sobre a licitação e o processo de compra dos equipamentos não estão disponíveis ao público.', '2022-12-01', 'Em investigação', 'Alta', 3, 4, 4, 4, 4),
('Atraso na construção do hospital', 'A construção do hospital regional está parada, sem previsão de retomada, impactando a população local.', '2023-02-01', 'Em investigação', 'Crítica', 2, 5, 5, 5, 5),
('Superfaturamento na ampliação da rede de esgoto', 'Contratos indicam valores superiores ao preço de mercado para os serviços de ampliação da rede de esgoto.', '2023-03-01', 'Pendente', 'Média', 1, 6, 6, 6, 6),
('Falta de transparência na modernização da escola', 'O portal da transparência não disponibiliza dados sobre os gastos na modernização da escola estadual.', '2023-04-01', 'Resolvida', 'Baixa', 2, 7, 7, 7, 7),
('Desvio de recursos no laboratório de tecnologia', 'Investigação aponta que recursos destinados ao laboratório de tecnologia foram utilizados de forma irregular.', '2023-05-01', 'Em investigação', 'Alta', 3, 1, 1, 1, 1),
('Atraso na reforma de creches', 'A reforma das creches municipais está atrasada há mais de 3 meses.', '2023-03-01', 'Em investigação', 'Alta', 4, 8, 8, 8, 8),
('Superfaturamento na construção de ciclovias', 'Valores acima do mercado foram identificados na construção das ciclovias.', '2023-04-15', 'Pendente', 'Média', 5, 9, 9, 9, 9),
('Falta de transparência na ampliação da rede elétrica', 'Os dados sobre a licitação não foram divulgados.', '2023-05-10', 'Em investigação', 'Baixa', 6, 10, 10, 10, 10),
('Desvio de recursos na construção de praças', 'Recursos destinados às praças foram desviados para outros fins.', '2023-06-01', 'Resolvida', 'Crítica', 7, 11, 11, 11, 11),
('Atraso na modernização de hospitais', 'A modernização dos hospitais está parada há 2 meses.', '2023-07-01', 'Em investigação', 'Alta', 8, 12, 12, 12, 12);
 
SELECT * FROM Politico;
SELECT * FROM Obra;
SELECT * FROM Emenda;
SELECT * FROM Usuario;
SELECT * FROM Empresa;
SELECT * FROM OrgaoControle;
SELECT * FROM Denuncia;
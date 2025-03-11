CREATE DATABASE IF NOT EXISTS Exemplo_Fiscalizacao_Emendas;
USE Exemplo_Fiscalizacao_Emendas;

CREATE TABLE Usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    cpf VARCHAR(14) UNIQUE,
    data_cadastro DATE NOT NULL
);

CREATE TABLE Politico (
    id_politico INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    cargo VARCHAR(50) NOT NULL,
    partido VARCHAR(50) NOT NULL,
    estado VARCHAR(2) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    data_inicial DATE NOT NULL,
    data_final DATE NOT NULL
);

CREATE TABLE Empresa (
    id_empresa INT AUTO_INCREMENT PRIMARY KEY,
    cnpj VARCHAR(18) NOT NULL UNIQUE,
    razao_social VARCHAR(255) NOT NULL,
    nome_fantasia VARCHAR(255) NOT NULL,
    setor VARCHAR(100) NOT NULL,
    localizacao VARCHAR(255) NOT NULL
);

CREATE TABLE Emenda (
    id_emenda INT AUTO_INCREMENT PRIMARY KEY,
    valor DECIMAL(15, 2) NOT NULL,
    motivo VARCHAR(255) NOT NULL,
    setor VARCHAR(100) NOT NULL,
    data_emenda DATE NOT NULL,
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
    status VARCHAR(50) NOT NULL
);

CREATE TABLE Obra_Emenda (
    id_obra_emenda INT AUTO_INCREMENT PRIMARY KEY,
    id_obra INT NOT NULL,
    id_emenda INT NOT NULL,
    FOREIGN KEY (id_obra) REFERENCES Obra(id_obra),
    FOREIGN KEY (id_emenda) REFERENCES Emenda(id_emenda)
);

CREATE TABLE OrgaoControle (
    id_orgao INT AUTO_INCREMENT PRIMARY KEY,
    cnpj VARCHAR(18) NOT NULL UNIQUE,
    razao_social VARCHAR(255) NOT NULL,
    nome_fantasia VARCHAR(255) NOT NULL,
    ramo VARCHAR(100) NOT NULL,
    responsavel VARCHAR(255) NOT NULL
);

CREATE TABLE Denuncia (
    id_denuncia INT AUTO_INCREMENT PRIMARY KEY,
    nome_denunciante VARCHAR(255),
    motivo VARCHAR(255) NOT NULL,
    data_denuncia DATE NOT NULL,
    status_denuncia VARCHAR(50) NOT NULL,
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

INSERT INTO Usuario (nome, email, senha, cpf, data_cadastro) VALUES
('José Pereira', 'jose.pereira@email.com', 'senha123', '123.476.789-10', '2023-01-15'),
('Maria Santos', 'maria.santos@email.com', 'senha456', '987.655.321-00', '2023-02-20'),
('Carlos Mendes', 'carlos.mendes@email.com', 'senha789', '111.282.333-44', '2023-03-10'),
('Ana Clara', 'ana.clara@email.com', 'senha101', '222.333.446-55', '2023-04-05'),
('Bruno Martins', 'bruno.martins@email.com', 'senha202', '333.444.555-66', '2023-05-10'),
('Carla Dias', 'carla.dias@email.com', 'senha303', '444.555.616-77', '2023-06-15'),
('Daniel Souza', 'daniel.souza@email.com', 'senha404', '595.666.777-88', '2023-07-20'),
('Eduarda Lima', 'eduarda.lima@email.com', 'senha505', '666.677.888-99', '2023-08-25'),
('Felipe Rocha', 'felipe.rocha@email.com', 'senha606', '777.838.999-00', '2023-09-30'),
('Gabriela Castro', 'gabriela.castro@email.com', 'senha707', '838.999.000-11', '2023-10-05'),
('Henrique Alves', 'henrique.alves@email.com', 'senha808', '999.000.136-22', '2023-11-10'),
('Isabela Santos', 'isabela.santos@email.com', 'senha909', '000.432.222-33', '2023-12-15'),
('João Pedro', 'joao.pedro@email.com', 'senha010', '111.222.027-44', '2024-01-20');

INSERT INTO Politico (nome, cpf, cargo, partido, estado, cidade, data_inicial, data_final) VALUES
('João Silva', '123.456.789-01', 'Deputado', 'PT', 'SP', 'São Paulo', '2019-02-01', '2023-02-01'),
('Maria Oliveira', '987.654.321-02', 'Senadora', 'PSDB', 'RJ', 'Rio de Janeiro', '2019-03-15', '2023-03-15'),
('Carlos Souza', '111.222.333-04', 'Vereador', 'MDB', 'MG', 'Belo Horizonte', '2019-01-10', '2023-01-10'),
('Ana Costa', '222.333.444-55', 'Deputada', 'PSOL', 'RS', 'Porto Alegre', '2020-05-20', '2024-05-20'),
('Pedro Almeida', '333.444.555-66', 'Senador', 'DEM', 'BA', 'Salvador', '2020-07-01', '2024-07-01'),
('Fernanda Lima', '444.555.666-77', 'Vereadora', 'REDE', 'CE', 'Fortaleza', '2021-09-12', '2025-09-12'),
('Ricardo Gomes', '555.666.777-88', 'Deputado', 'PL', 'PR', 'Curitiba', '2021-11-05', '2025-11-05');

INSERT INTO Empresa (cnpj, razao_social, nome_fantasia, setor, localizacao) VALUES
('12.345.678/0001-01', 'Construtora ABC Ltda', 'Construtora ABC', 'Construção', 'São Paulo, SP'),
('98.765.432/0001-02', 'Engenharia XYZ S.A.', 'Engenharia XYZ', 'Engenharia', 'Rio de Janeiro, RJ'),
('11.222.333/0001-04', 'Infraestrutura 123 Ltda', 'Infraestrutura 123', 'Infraestrutura', 'Belo Horizonte, MG'),
('23.456.789/0001-02', 'Construtora Delta Ltda', 'Construtora Delta', 'Construção', 'Porto Alegre, RS'),
('34.567.890/0001-03', 'Engenharia Omega S.A.', 'Engenharia Omega', 'Engenharia', 'Salvador, BA'),
('45.678.901/0001-04', 'Infraestrutura Gamma Ltda', 'Infraestrutura Gamma', 'Infraestrutura', 'Fortaleza, CE'),
('56.789.012/0001-05', 'Tecnologia Sigma S.A.', 'Tecnologia Sigma', 'Tecnologia', 'Curitiba, PR');

INSERT INTO Emenda (valor, motivo, setor, data_emenda, id_politico, id_empresa) VALUES
(100000.00, 'Reforma de escolas', 'Educação', '2022-07-01', 1, 1),
(200000.00, 'Construção de ponte', 'Infraestrutura', '2022-08-15', 2, 2),
(150000.00, 'Pavimentação de ruas', 'Urbanismo', '2022-09-10', 3, 3),
(300000.00, 'Construção de hospital', 'Saúde', '2022-10-01', 4, 4),
(250000.00, 'Ampliação de rede de esgoto', 'Saneamento', '2022-11-01', 5, 5),
(400000.00, 'Modernização de escolas', 'Educação', '2022-12-01', 6, 6),
(350000.00, 'Compra de equipamentos tecnológicos', 'Tecnologia', '2023-01-01', 7, 7);

INSERT INTO Obra (nome, local_obra, data_inicio, data_termino, status) VALUES
('Reforma da Escola Municipal', 'São Paulo, SP', '2022-07-15', '2023-07-15', 'Em andamento'),
('Construção da Ponte Rio-Niterói', 'Rio de Janeiro, RJ', '2022-08-20', '2024-08-20', 'Em andamento'),
('Pavimentação da Avenida Principal', 'Belo Horizonte, MG', '2022-09-15', '2023-09-15', 'Concluída'),
('Construção do Hospital Municipal', 'Porto Alegre, RS', '2022-10-15', '2024-10-15', 'Em andamento'),
('Ampliação da Rede de Esgoto', 'Salvador, BA', '2022-11-20', '2023-11-20', 'Em andamento'),
('Modernização da Escola Estadual', 'Fortaleza, CE', '2022-12-15', '2023-12-15', 'Concluída'),
('Laboratório de Tecnologia', 'Curitiba, PR', '2023-01-20', '2024-01-20', 'Em planejamento');

INSERT INTO OrgaoControle (cnpj, razao_social, nome_fantasia, ramo, responsavel) VALUES
('12.345.678/0001-01', 'Agência Nacional de Fiscalização', 'Agência Fiscal', 'Fiscalização', 'Carlos Alberto Souza'),
('23.456.789/0001-02', 'Tribunal de Contas do Estado', 'TCE-SP', 'Controle Público', 'Renata Costa Silva'),
('34.567.890/0001-03', 'Controladoria Geral da União', 'CGU', 'Controle Interno', 'José Pereira Martins'),
('45.678.901/0001-04', 'Agência de Regulação de Serviços Públicos', 'ARSP', 'Regulação', 'Fernanda Lima Souza'),
('56.789.012/0001-05', 'Comissão de Ética do Congresso Nacional', 'CEC', 'Ética', 'Ricardo Gomes Alves'),
('67.890.123/0001-06', 'Instituto de Transparência e Integridade', 'ITI', 'Transparência', 'Luciana Fernandes Costa'),
('78.901.234/0001-07', 'Fiscalização do Sistema de Saúde', 'FSS', 'Saúde Pública', 'Marcos Antônio Ribeiro');

INSERT INTO Obra_Emenda (id_obra, id_emenda) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7);

INSERT INTO Denuncia (nome_denunciante, motivo, data_denuncia, status_denuncia, id_usuario, id_politico, id_empresa, id_emenda, id_orgao) VALUES
('Anônimo', 'Desvio de recursos na obra da ponte', '2022-09-15', 'Em investigação', 1, 1, 1, 1, 1), 
('José Pereira', 'Superfaturamento na reforma da escola', '2022-08-20', 'Resolvida', 1, 2, 2, 2, 2), 
('Maria Santos', 'Atraso na pavimentação', '2022-11-05', 'Pendente', 2, 3, 3, 3, 3), 
('Carlos Mendes', 'Falta de transparência na compra de equipamentos', '2022-12-01', 'Em investigação', 3, 4, 4, 4, 4),
('Anônimo', 'Atraso na construção do hospital', '2023-02-01', 'Em investigação', 2, 5, 5, 5, 5),
('José Pereira', 'Superfaturamento na ampliação da rede de esgoto', '2023-03-01', 'Pendente', 1, 6, 6, 6, 6),
('Maria Santos', 'Falta de transparência na modernização da escola', '2023-04-01', 'Resolvida', 2, 7, 7, 7, 7),
('Carlos Mendes', 'Desvio de recursos no laboratório de tecnologia', '2023-05-01', 'Em investigação', 3, 1, 1, 1, 1);

SELECT 
    d.id_denuncia,
    d.nome_denunciante,
    d.motivo,
    d.status_denuncia,
    u.nome AS usuario_nome,
    u.email AS usuario_email
FROM Denuncia d
JOIN Usuario u ON d.id_usuario = u.id_usuario;

SELECT 
    o.nome AS nome_obra,
    o.local_obra,
    e.valor AS valor_emenda,
    e.motivo AS motivo_emenda
FROM Obra o
JOIN Obra_Emenda oe ON o.id_obra = oe.id_obra
JOIN Emenda e ON oe.id_emenda = e.id_emenda;

SELECT 
    p.nome AS nome_politico,
    p.partido,
    e.valor AS valor_emenda,
    e.setor
FROM Politico p
JOIN Emenda e ON p.id_politico = e.id_politico;

SELECT 
    d.id_denuncia,
    d.nome_denunciante,
    d.motivo,
    d.status_denuncia,
    u.nome AS usuario_nome,
    u.email AS usuario_email,
    o.razao_social AS orgao_razao_social,
    o.nome_fantasia AS orgao_nome_fantasia,
    o.ramo AS orgao_ramo,
    o.responsavel AS orgao_responsavel
FROM Denuncia d
JOIN Usuario u ON d.id_usuario = u.id_usuario
JOIN OrgaoControle o ON d.id_orgao = o.id_orgao;

SELECT * FROM Politico;
SELECT * FROM Obra_Emenda;
SELECT * FROM Obra;
SELECT * FROM Emenda;
SELECT * FROM Usuario;
SELECT * FROM Empresa;
SELECT * FROM OrgaoControle;
SELECT * FROM Denuncia;
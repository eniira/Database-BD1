-- Imobiliaria
-- Aluna: Catarine Soares Cruz
-- LINK: https://github.com/eniira/Database-BD1

DROP TABLE IF EXISTS MERC_FAZ_ANUN, CORR_TEM_CLI, CLIENTE, FIADOR, NEGOCIADOR_COMPRADOR,
NEGOCIADOR_INQUILINO ,NEGOCIADOR,FUNCIONARIO_MERCADOLOGO,FUNCIONARIO_CORRETOR ,FUNCIONARIO,
IMOVEL_ALUGUEL, IMOVEL_VENDA, IMOVEL, ANUNCIO;

CREATE TABLE CLIENTE (
email VARCHAR(50),
telefone CHAR(11),
nome VARCHAR(50),
PRIMARY KEY (email)
);

CREATE TABLE IMOVEL(
codigo INTEGER,
comissao REAL,
stats VARCHAR(10),
endereco VARCHAR(100),
metragem REAL,
descricao VARCHAR(100),
email_cli VARCHAR(100),
PRIMARY KEY (codigo),
FOREIGN KEY(email_cli) REFERENCES CLIENTE(email)
);

CREATE TABLE ANUNCIO (
codigo INTEGER,
orcamento REAL,
local_anuncio VARCHAR(50),
vzs_anuncio INTEGER,
codigo_imo INTEGER,
PRIMARY KEY (codigo),
FOREIGN KEY (codigo_imo) REFERENCES IMOVEL(codigo)
);

CREATE TABLE FIADOR(
nome VARCHAR(50),
cpf CHAR(11),
contrato VARCHAR(100),
PRIMARY KEY (cpf)
);

CREATE TABLE NEGOCIADOR(
email VARCHAR(50),
telefone CHAR(11),
nome VARCHAR(50),
PRIMARY KEY (email)
);

CREATE TABLE NEGOCIADOR_INQUILINO(
email VARCHAR(50),
cpf_fia CHAR(11),
PRIMARY KEY (email),
FOREIGN KEY(email) REFERENCES NEGOCIADOR(email) ON DELETE CASCADE,
FOREIGN KEY (cpf_fia) REFERENCES FIADOR (cpf)
);

CREATE TABLE NEGOCIADOR_COMPRADOR(
email VARCHAR(50),
PRIMARY KEY (email),
FOREIGN KEY(email) REFERENCES NEGOCIADOR(email) ON DELETE CASCADE
);

CREATE TABLE FUNCIONARIO(
cpf CHAR(11),
nome VARCHAR(50),
telefone CHAR(11),
PRIMARY KEY(cpf)
);

CREATE TABLE FUNCIONARIO_MERCADOLOGO(
area_atuacao VARCHAR(50),
tempo_empr INTEGER,
estrategia_util VARCHAR(50),
cpf_merc CHAR(11),
PRIMARY KEY(cpf_merc),
FOREIGN KEY(cpf_merc) REFERENCES FUNCIONARIO(cpf) ON DELETE CASCADE
);

CREATE TABLE FUNCIONARIO_CORRETOR(
email VARCHAR(50),
CRECI CHAR(6),
treinamento VARCHAR(50),
cpf_corr CHAR(11),
PRIMARY KEY(cpf_corr),
FOREIGN KEY(cpf_corr) REFERENCES FUNCIONARIO(cpf) ON DELETE CASCADE
);


CREATE TABLE IMOVEL_ALUGUEL(
condicoes VARCHAR(100),
valorMensal REAL,
periodo INTEGER,
codigo_alug INTEGER,
cpf_corr CHAR(11),
email_inq VARCHAR(50),
dataInicio DATE,
dataFim DATE,
vencimento DATE,
PRIMARY KEY(codigo_alug),
FOREIGN KEY(codigo_alug) REFERENCES IMOVEL(codigo) ON DELETE CASCADE,
FOREIGN KEY (cpf_corr) REFERENCES FUNCIONARIO_CORRETOR (cpf_corr),
FOREIGN KEY (email_inq) REFERENCES NEGOCIADOR_INQUILINO (email)
);

CREATE TABLE IMOVEL_VENDA(
tipo VARCHAR(20),
registro VARCHAR(20),
valorTotal REAL,
codigo_vend INTEGER,
cpf_corr CHAR(11),
email_comp VARCHAR(50),
dataVenda DATE,
PRIMARY KEY(codigo_vend),

FOREIGN KEY(codigo_vend) REFERENCES IMOVEL(codigo) ON DELETE CASCADE,
FOREIGN KEY (cpf_corr) REFERENCES FUNCIONARIO_CORRETOR (cpf_corr),
FOREIGN KEY (email_comp) REFERENCES NEGOCIADOR_COMPRADOR (email)
);

CREATE TABLE MERC_FAZ_ANUN(
codigo INTEGER,
cpf_merc CHAR(11),
PRIMARY KEY (codigo, cpf_merc),
FOREIGN KEY (codigo) REFERENCES ANUNCIO(codigo),
FOREIGN KEY (cpf_merc) REFERENCES FUNCIONARIO_MERCADOLOGO(cpf_merc)
);


CREATE TABLE CORR_TEM_CLI(
email_cli VARCHAR(100),
cpf_corr CHAR(11),
PRIMARY KEY (email_cli, cpf_corr),
FOREIGN KEY (email_cli) REFERENCES CLIENTE (email),
FOREIGN KEY (cpf_corr) REFERENCES FUNCIONARIO_CORRETOR(cpf_corr)
);

INSERT INTO CLIENTE(email, telefone, nome) VALUES ('joanasantos@gmail.com', '11997564115', 'Joana Santos'), ('matheusjunior@gmail.com', '33987564130', 'Matheus Junior'), ('anabrandao@hotmail.com', '43996543312', 'Ana Brandão'), ('pedromendes@gmail.com', '73999546129', 'Pedro Mendes'), ('laurabritto@gmail.com', '31982564170', 'Laura Brito'), ('carlosjose@gmail.com', '71997543166', 'Carlos Jose'), ('paulomesquita@gmail.com', '13996344412', 'Paulo Mesquita'), ('mariaedu_matos@gmail.com', '44987613240', 'Maria Eduarda Matos'),('tainararaic@gmail.com', '51985654443', 'Tainara Raic'),('eduardocamargo@gmail.com', '55986439981', 'Eduardo Camargo');
INSERT INTO IMOVEL(codigo, comissao, stats, endereco, metragem, descricao, email_cli) VALUES (11,20.00,'in', 'Rua jõao, 123', 150.00, '3 quartos', 'joanasantos@gmail.com'), (12, 20.00, 'in', 'Rua João, 124', 100.00, '2 quartos', 'joanasantos@gmail.com' ), (13, 15.00, 'in', 'Rua José, 32', 100.00, '3 quartos', 'matheusjunior@gmail.com'), (14, 15.00, 'in', 'Rua José, 55', 100.00, '3 quartos', 'matheusjunior@gmail.com'), (15, 20.00, 'out', 'Rua Mariana, 300', 200.00, '4 quartos', 'anabrandao@hotmail.com'), (16, 20.00, 'out', 'Rua Mariana, 140', 300.00, '5 quartos', 'anabrandao@hotmail.com'), (17, 15.00, 'in', 'Rua Pereira, 90', 250.00, '3 quartos', 'pedromendes@gmail.com'), (18, 16.00, 'out', 'Rua Pereira, 800', 100.00, '2 quartos', 'pedromendes@gmail.com'), (19, 17.00, 'in', 'Rua Capitão, 1000', 150.00, '2quartos', 'laurabritto@gmail.com'), (20, 20.00, 'out', 'Rua Capitão, 1001', 200.00, '3 quartos', 'laurabritto@gmail.com'),(21, 15.00, 'in', 'Av. Brasil, 500', 50.00, '1 quarto', 'carlosjose@gmail.com'), (22, 10.00, 'out', 'Av. Brasil, 700', 50.00, '1 quarto', 'carlosjose@gmail.com'), (23, 15.00, 'in', 'Av. Paraná, 4000', 100.00, '3 quartos', 'paulomesquita@gmail.com'), (24, 17.00, 'out', 'Av. Paraná, 300', 180.00, '2 quartos', 'paulomesquita@gmail.com'), (25, 18.00, 'in', 'Av. José, 90', 140.00, '3 quartos', 'mariaedu_matos@gmail.com'), (26, 20.00, 'in', 'Av. José, 7070', 160.00, '2 quartos', 'mariaedu_matos@gmail.com'), (27, 15.00, 'in', 'Rua México, 80', 200.00, '4 quartos', 'tainararaic@gmail.com'), (28, 10.00, 'out', 'Rua México, 70', 300.00, '2 quartos', 'tainararaic@gmail.com'), (29, 13.00, 'in', 'Rua Alemanha, 100', 150.00, '3 quartos', 'eduardocamargo@gmail.com'), (30, 20.00, 'in', 'Rua Alemanha, 50', 200.00, '5 quartos', 'eduardocamargo@gmail.com');
INSERT INTO ANUNCIO(codigo, orcamento, local_anuncio, vzs_anuncio, codigo_imo) VALUES (1, 1000.00, 'revista', 5, 11), (2, 4000.00, 'rede social', 2, 12), (3, 10000.00, 'email', 1, 13), (4, 1000.00, 'jornal', 4, 14), (5, 5000.00, 'rede social', 2, 15), (6, 15000.00, 'outdoor', 1, 16),(7, 2000.00, 'revista', 3, 17),(8, 3500.00, 'rede social', 2, 18), (9, 4000.00, 'jornal', 7, 19),(10, 1500.00, 'revista', 2, 20);
INSERT INTO NEGOCIADOR(email, telefone, nome) VALUES ('caiopereira@hotmail.com', '74987666543', 'Caio Pereira'), ('pedroeduardo@gmail.com', '31985454590', 'Pedro Eduardo'), ('rodrigoferr@gmail.com', '43996578091', 'Rodrigo Ferreira'), ('fernandosilva@hotmail.com', '13998876545', 'Fernando Silva'), ('clarafernandes@gmail.com', '31980145132', 'Clara Fernandes'), ('sofiamarques@gmail.com', '73991534723', 'Sofia Marques'), ('marianagarcia@hotmail.com', '41982274560', 'Mariana Garcia'), ('mirandacarva@gmail.com', '41997152344', 'Miranda Carvalho'), ('pedropaulo@gmail.com', '43998765413', 'Pedroo Paulo'), ('josepedro@gmail.com', '41933862540', 'Jose Pedro'),('juliacosta@gmail.com', '41996789090', 'Julia Costa'), ('ananunes@gmail.com', '73928734451', 'Ana Nunes'), ('lucascampos@gmail.com', '51990077051', 'Lucas Campos'), ('emillyaraujo@hotmail.com', '55948032162', 'Emilly Araujo'), ('fransales@gmail.com', '51965483211', 'Francisco Sales'), ('ferndguil@gmail.com', '41985674000', 'Fernando Guilherme'), ('enricobarb@gmail.com', '71987654002', 'Enrico Barbosa'), ('ceciliamelo@gmail.com', '73981265430', 'Cecilia Melo'), ('lorenzo_barb@gmail.com', '74980809123', 'Lorenzo Barbosa'), ('vitcunha@gmail.com', '31923456987', 'Vitoria Cunha');
INSERT INTO FIADOR(nome, cpf, contrato) VALUES ('Bruno Novaes', '90561228000', 'válido'), ('Alice Gonçalves', '55266100044', 'válido'), ('Maria Moreira', '03217541073', 'válido'), ('Joaquim Moraes', '14209961000', 'válido'), ('Marina Porto', '73031549066', 'válido'), ('Lucas Cardoso', '68420754080', 'inválido'), ('Luiza Barros', '78529279042', 'válido'), (' Vinicius Costa', '53770614038', 'válido'), ('Bruna Costa', '62056299097', 'válido'), ('Marcos Silva', '17331657038', 'inválido');
INSERT INTO NEGOCIADOR_INQUILINO(email, cpf_fia) VALUES ('juliacosta@gmail.com', '90561228000'), ('ananunes@gmail.com', '55266100044'), ('lucascampos@gmail.com', '03217541073'), ('emillyaraujo@hotmail.com', '14209961000'), ('fransales@gmail.com', '73031549066'), ('ferndguil@gmail.com', '68420754080'), ('enricobarb@gmail.com', '78529279042'), ('ceciliamelo@gmail.com', '53770614038'), ('lorenzo_barb@gmail.com', '62056299097'), ('vitcunha@gmail.com', '17331657038');
INSERT INTO NEGOCIADOR_COMPRADOR(email) VALUES ('caiopereira@hotmail.com'), ('pedroeduardo@gmail.com'), ('rodrigoferr@gmail.com'), ('fernandosilva@hotmail.com'), ('clarafernandes@gmail.com'), ('sofiamarques@gmail.com'), ('marianagarcia@hotmail.com'), ('mirandacarva@gmail.com'), ('pedropaulo@gmail.com'), ('josepedro@gmail.com');
INSERT INTO FUNCIONARIO(cpf, nome, telefone) VALUES ('29823231095',  'Evelyn Mendes', '86972934832'), ('11211937062', 'Joaquim Silva', '84973242668'), ('58743405053', 'Isabelly Gonçalves', '64993156424'), ('51351654012', 'Beatriz Silveira', '45998664555'), ('18460846016', 'Davi Lucca das Neves', '63991596529'), ('39573056089', 'Kamilly da Luz','79995031035'), ('23732423034', 'Nathan Campos', '43982618761'), ('89005328045', 'Ana Beatriz Costela', '88976527349'), ('32238708065', 'Calebe Rodrigues', '62994618384'), ('73646949007', 'João Vitor Gomes', '98997448394'), ('86761558018', 'Matheus Duarte', '98997448394'), ('86061742037', 'Paulo Barbosa', '64984334627'), ('53891110014', 'Mariana Rezende', '96971400347'), ('41967182051', 'Nina Martins', '97981237677'), ('70118120085', 'Ana Julia Melo', '68992478821'), ('65192439060', 'Valentina Porto', '41976294960'), ('73186084016', 'Gustavo Costa', '42995854005'), ('93194204084', 'Stephany Pires', '44973546722'), ('75523745006', 'Lucca Moraes', '42983556317'), ('45749959040', 'Cecília Novaes', '41987252628');
INSERT INTO FUNCIONARIO_MERCADOLOGO(area_atuacao, tempo_empr, estrategia_util, cpf_merc) VALUES ('consultoria', 3, 'Marketing de Conteúdo', '29823231095'), ('gestor de e-commerce', 4, 'Marketing de Conteúdo', '11211937062'), ('produtor de conteúdo', 3, 'Marketing de Produto', '58743405053'), ('produtor de conteúdo', 3, 'Marketing de Produto','51351654012'), ('produtor de conteúdo',1, 'Marketing Viral','18460846016'), ('neuromarketing', 1, 'Marketing Social', '39573056089'), ('neuromarketing', 2, 'Marketing Pessoal', '23732423034'), ('neuromarketing', 4, 'Marketing Pessoal', '89005328045'), ('consultoria', 4, 'Marketing Humanizado', '32238708065'), ('produtor de conteúdo', 2, 'Marketing de Relacionamento', '73646949007');
INSERT INTO FUNCIONARIO_CORRETOR(email, CRECI, treinamento, cpf_corr) VALUES ('matheusduarte@gmail.com', '100000', 'sim',  '86761558018'), ('marianarezende@gmail.com', '200000', 'sim', '53891110014'), ('ninamartins@gmail.com', '300000', 'não',  '41967182051'), ('anamelo@gmail.com', '400000', 'não' ,'70118120085'), ('valentinaporto@gmail.com', '500000', 'não', '65192439060'), ('gustavocosta@gmail.com', '600000', 'sim', '73186084016'), ('stephanypires@gmail.com', '700000', 'sim', '93194204084'), ('luccamoraes@gmail.com', '800000', 'sim','75523745006'), ('cecilianovaes@gmail.com', '900000', 'sim','45749959040'), ('paulobarbosa@gmail.com','110000', 'sim','86061742037');
INSERT INTO IMOVEL_ALUGUEL(condicoes, valorMensal, periodo, codigo_alug, cpf_corr, email_inq, dataInicio, dataFim, vencimento) VALUES ('válido', 1000.00, 12, 11, '86761558018', 'juliacosta@gmail.com', '2020-09-16' , '2021-09-16', '0000-09-16'), ('válido', 1000.00, 24, 12, '53891110014', 'ananunes@gmail.com', '2020-09-16', '2022-09-16', '0000-09-16'), ('válido', 1200.00, 12, 13,'41967182051', 'lucascampos@gmail.com', '2020-09-16', '2021-09-16', '0000-09-16'), ('válido', 1000.00, 24, 14,'70118120085', 'emillyaraujo@hotmail.com', '2020-09-16', '2022-09-16', '0000-09-16'), ('válido', 1500.00, 12, 15,'65192439060',  'fransales@gmail.com', '2020-09-16', '2021-09-16', '0000-09-16'), ('válido', 1200.00, 12, 16,'73186084016','ferndguil@gmail.com',' 2020-09-16', '2021-09-16', '0000-09-16'), ('válido', 1300.00, 24, 17, '93194204084','enricobarb@gmail.com', '2020-09-16', '2022-09-16', '0000-09-16'), ('válido', 1400.00, 24, 18,'75523745006', 'ceciliamelo@gmail.com', '2020-09-16', '2022-09-16', '0000-09-16'), ('válido',1000.00, 12, 19, '45749959040', 'lorenzo_barb@gmail.com', '2020-09-16', '2021-09-16', '0000-09-16'), ('válido', 1000.00, 24,  20, '86061742037', 'vitcunha@gmail.com', '2020-09-16', '2022-09-16', '0000-09-16');
INSERT INTO MERC_FAZ_ANUN(codigo, cpf_merc) VALUES (1, '29823231095'), (2, '11211937062'), (3, '58743405053'), (4, '51351654012'), (5, '18460846016'), (6, '39573056089'), (7, '23732423034'), (8, '89005328045'), (9, '32238708065'), (10, '73646949007');
INSERT INTO CORR_TEM_CLI(email_cli, cpf_corr) VALUES ('joanasantos@gmail.com', '86761558018'), ('matheusjunior@gmail.com', '53891110014'), ('anabrandao@hotmail.com',  '41967182051'), ('pedromendes@gmail.com', '70118120085'), ('laurabritto@gmail.com', '65192439060'), ('carlosjose@gmail.com', '73186084016'), ('paulomesquita@gmail.com', '93194204084'), ('mariaedu_matos@gmail.com', '75523745006'), ('tainararaic@gmail.com', '45749959040'), ('eduardocamargo@gmail.com', '86061742037');
INSERT INTO IMOVEL_VENDA(tipo, registro, valorTotal, codigo_vend, cpf_corr, email_comp, dataVenda) VALUES ('ap', 'válido', 90000.00, 21, '86761558018', 'caiopereira@hotmail.com', '2020-11-01'), ('ap', 'válido',90000.00, 22, '53891110014', 'pedroeduardo@gmail.com', '2020-11-01'), ('casa', 'válido', 200000.00, 23, '41967182051', 'josepedro@gmail.com', '2020-11-01'), ('casa', 'válido',200000.00,24, '70118120085','rodrigoferr@gmail.com', '2020-11-01'), ('casa','válido',200000.00, 25, '65192439060', 'fernandosilva@hotmail.com','2020-11-01'), ('casa','válido',200000.00,26, '73186084016', 'clarafernandes@gmail.com', '2020-11-01'), ('casa','válido',200000.00,27, '93194204084', 'sofiamarques@gmail.com', '2020-11-01'), ('casa','válido', 500000.00, 28,'75523745006','marianagarcia@hotmail.com', '2020-11-01'), ('comercial','válido', 500000.00, 29, '45749959040', 'mirandacarva@gmail.com', '2020-11-01'), ('comercial', 'válido',500000.00, 30, '86061742037', 'pedropaulo@gmail.com','2020-11-01');
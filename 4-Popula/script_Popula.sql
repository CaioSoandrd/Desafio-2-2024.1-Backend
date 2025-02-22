

INSERT INTO PROPIETARIO (CPF, Nome, Data_Nascimento, CEP, Numero_Complemento, Sexo, Bairro, Cidade, Estado) VALUES
('123.456.789-00', 'João Pereira', '1980-05-20', '50010-010', 'Casa 101', 'M', 'Boa Viagem', 'Recife', 'PE'),
('234.567.890-11', 'Maria Santos', '1992-08-15', '50020-020', 'Apto 202', 'F', 'Centro', 'Recife', 'PE'),
('345.678.901-22', 'Carlos Oliveira', '1975-11-30', '50030-030', 'Casa 303', 'M', 'Boa Vista', 'Recife', 'PE'),
('456.789.012-33', 'Ana Costa', '1988-03-10', '50040-040', 'Apto 404', 'F', 'Pina', 'Recife', 'PE'),
('567.890.123-44', 'Pedro Souza', '2000-07-05', '50050-050', 'Casa 505', 'M', 'Casa Forte', 'Recife', 'PE');


INSERT INTO TELEFONE (FK_PROPIETARIO_CPF, Numero) VALUES
('123.456.789-00', '81999991111'),
('123.456.789-00', '81999992222'),
('234.567.890-11', '81988883333'),
('345.678.901-22', '81977774444'),
('456.789.012-33', '81966665555'),
('567.890.123-44', '81955556666');


INSERT INTO MODELO (Nome) VALUES
('Gol MI'),
('Onix Plus'),
('Uno CS'),
('HB20S'),
('Tracker');

--  Inserir Categorias
INSERT INTO CATEGORIA (Nome) VALUES
('Automóvel'),
('Motocicleta'),
('Caminhão'),
('SUV'),
('Utilitário');


INSERT INTO VEICULO (Placa, Chassi, Cor, Ano_Fabricacao, FK_PROPIETARIO_CPF, FK_MODELO_ID, FK_CATEGORIA_ID) VALUES
('ABC1D23', '9BABCDEFG12345678', 'Branco', 2020, '123.456.789-00', 1, 1),
('DEF4G56', '9BCDEFGHI23456789', 'Preto', 2021, '123.456.789-00', 2, 4),
('HIJ7K89', '9BFGHIJKL34567890', 'Prata', 2019, '234.567.890-11', 3, 1),
('LMN0P12', '9BIJKLMNO45678901', 'Vermelho', 2018, '345.678.901-22', 4, 4),
('QRS3T45', '9BMNOPQRS56789012', 'Azul', 2022, '456.789.012-33', 5, 5);


INSERT INTO AGENTE (Matricula, Nome, Data_Contratacao) VALUES
(101, 'Roberto Almeida', '2015-02-10'),
(102, 'Fernanda Lima', '2018-06-20'),
(103, 'Ricardo Gomes', '2020-09-15'),
(104, 'Juliana Castro', '2022-01-05'),
(105, 'Lucas Mendes', '2023-04-30');


INSERT INTO TIPO_INFRACAO (Descricao, Valor) VALUES
('Avanço de sinal vermelho', 293.47),
('Excesso de velocidade', 880.41),
('Estacionamento em local proibido', 195.23),
('Uso de celular ao volante', 293.47),
('Direção sem cinto de segurança', 293.47);


INSERT INTO LOCAL (Latitude, Longitude, Velocidade_Permitida) VALUES
(-8.047562, -34.877001, 40.00),  -- Zona escolar
(-8.056000, -34.886000, 60.00),  -- Via urbana
(-8.050000, -34.880000, 50.00),   -- Via urbana de alto tráfego
(-8.030000, -34.870000, 80.00),  -- Rodovia
(-8.040000, -34.890000, 30.00);  -- Área residencial


INSERT INTO INFRACAO (Data_Hora, Velocidade_Aferida, FK_AGENTE_Matricula, FK_LOCAL_Latitude, FK_LOCAL_Longitude, FK_TIPO_INFRACAO_ID_Tipo, FK_VEICULO_Placa) VALUES
('2023-03-10 14:15:00', 85.00, 101, -8.047562, -34.877001, 2, 'ABC1D23'),
('2023-03-10 14:20:00', NULL, 101, -8.047562, -34.877001, 1, 'ABC1D23'),
('2023-03-10 14:25:00', 50.00, 101, -8.047562, -34.877001, 4, 'ABC1D23'),
('2023-04-05 09:30:00', 75.00, 102, -8.056000, -34.886000, 2, 'DEF4G56'),
('2023-04-05 09:35:00', NULL, 102, -8.056000, -34.886000, 3, 'DEF4G56'),
('2023-05-20 16:45:00', NULL, 103, -8.050000, -34.880000, 5, 'HIJ7K89'),
('2023-06-15 11:00:00', 90.00, 104, -8.030000, -34.870000, 2, 'LMN0P12'),
('2023-07-01 07:20:00', 35.00, 105, -8.040000, -34.890000, 4, 'QRS3T45');

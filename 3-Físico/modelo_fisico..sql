CREATE DATABASE DETRAN;
SHOW DATABASES;
USE DETRAN;
DROP DATABASE DETRAN;

CREATE TABLE PROPIETARIO (
    CPF CHAR(14) PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Data_Nascimento DATE NOT NULL,
    CEP CHAR(9) NOT NULL,
    Numero_Complemento VARCHAR(20),
    ENGINE=InnoDB
) ENGINE=InnoDB;

CREATE TABLE VEICULO (
    Placa CHAR(7) PRIMARY KEY,
    Chassi CHAR(17) UNIQUE NOT NULL,
    Cor VARCHAR(15) NOT NULL,
    Ano_Fabricacao YEAR NOT NULL,
    FK_PROPIETARIO_CPF CHAR(14) NOT NULL,
    ENGINE=InnoDB
) ENGINE=InnoDB;

CREATE TABLE MODELO (
    ID_MODELO INT(6) PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    FK_VEICULO_Placa CHAR(7) NOT NULL,
    ENGINE=InnoDB
) ENGINE=InnoDB;

CREATE TABLE TIPO_INFRACAO (
    ID_Tipo INT(6) PRIMARY KEY,
    Descricao VARCHAR(100) NOT NULL,
    Valor DECIMAL(10,2) NOT NULL,
    ENGINE=InnoDB
) ENGINE=InnoDB;

CREATE TABLE CATEGORIA (
    ID_Categoria INT(6) PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    FK_VEICULO_Placa CHAR(7) NOT NULL,
    ENGINE=InnoDB
) ENGINE=InnoDB;

CREATE TABLE LOCAL (
    Latitude DECIMAL(9,6) NOT NULL,
    Longitude DECIMAL(9,6) NOT NULL,
    Velocidade_Permitida DECIMAL(5,2) NOT NULL,
    PRIMARY KEY (Latitude, Longitude),
    ENGINE=InnoDB
) ENGINE=InnoDB;

CREATE TABLE AGENTE (
    Matricula INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Data_Contratacao DATE NOT NULL,
    ENGINE=InnoDB
) ENGINE=InnoDB;

CREATE TABLE INFRACAO (
    ID_InfracAO INT(6) PRIMARY KEY,
    Data_Hora DATETIME NOT NULL,
    Velocidade_Aferida DECIMAL(10,2) NOT NULL,
    FK_AGENTE_Matricula INT NOT NULL,
    FK_LOCAL_Latitude DECIMAL(9,6) NOT NULL,
    FK_LOCAL_Longitude DECIMAL(9,6) NOT NULL,
    FK_TIPO_INFRACAO_ID_Tipo INT(6) NOT NULL,
    FK_VEICULO_Placa CHAR(7) NOT NULL,
    ENGINE=InnoDB
) ENGINE=InnoDB;

CREATE TABLE TELEFONE (
    Numero CHAR(11) PRIMARY KEY,
    FK_PROPIETARIO_CPF CHAR(14) NOT NULL,
    ENGINE=InnoDB
) ENGINE=InnoDB;
 
ALTER TABLE VEICULO ADD CONSTRAINT FK_VEICULO_2
    FOREIGN KEY (FK_PROPIETARIO_CPF)
    REFERENCES PROPIETARIO (CPF)
    ON DELETE RESTRICT;

ALTER TABLE MODELO ADD CONSTRAINT FK_MODELO_2
    FOREIGN KEY (FK_VEICULO_Placa)
    REFERENCES VEICULO (Placa)
    ON DELETE RESTRICT;
 
ALTER TABLE CATEGORIA ADD CONSTRAINT FK_CATEGORIA_2
    FOREIGN KEY (FK_VEICULO_Placa)
    REFERENCES VEICULO (Placa)
    ON DELETE RESTRICT;
 
ALTER TABLE INFRACAO ADD CONSTRAINT FK_INFRACAO_2
    FOREIGN KEY (FK_AGENTE_Matricula)
    REFERENCES AGENTE (Matricula)
    ON DELETE RESTRICT;
 
ALTER TABLE INFRACAO ADD CONSTRAINT FK_INFRACAO_3
    FOREIGN KEY (FK_LOCAL_Latitude, FK_LOCAL_Longitude)
    REFERENCES LOCAL (Latitude, Longitude)
    ON DELETE RESTRICT;
 
ALTER TABLE INFRACAO ADD CONSTRAINT FK_INFRACAO_4
    FOREIGN KEY (FK_TIPO_INFRACAO_ID_Tipo)
    REFERENCES TIPO_INFRACAO (ID_Tipo)
    ON DELETE RESTRICT;
 
ALTER TABLE INFRACAO ADD CONSTRAINT FK_INFRACAO_5
    FOREIGN KEY (FK_VEICULO_Placa)
    REFERENCES VEICULO (Placa)
    ON DELETE RESTRICT;
 
ALTER TABLE TELEFONE ADD CONSTRAINT FK_TELEFONE_2
    FOREIGN KEY (FK_PROPIETARIO_CPF)
    REFERENCES PROPIETARIO (CPF)
    ON DELETE RESTRICT;

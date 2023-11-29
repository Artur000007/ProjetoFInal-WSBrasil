Create database RomullusCorp;
use RomullusCorp;

	--Criando Tabelas com PROCEDURES

  IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'contatosite')
  CREATE TABLE contatosite (
	id int primary key identity(1,1),
	nome varchar(80) not null,
	email varchar(80) not null,
	mensagem text not null,
	datahora datetime not null,
	fk_tipocontato_id int
);ELSE PRINT 'Tabela já criada'
	
 IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'tipocontato')
  CREATE TABLE tipocontato (
	id int primary key identity(1,1),
	nome varchar(80)not null)
ELSE PRINT 'Tabela já criada';

	-- Criacao Das Tabelas

	CREATE TABLE Usuario (
    ID INT PRIMARY KEY identity(1,1),
    Nome VARCHAR(120),
    Senha VARCHAR(32),
    DataHoraCriacao DATETIME,
    DataHoraUltimoAcesso DATETIME,
    Email VARCHAR(120),
    fk_TipoUsuario_ID INT
);


	CREATE TABLE TipoUsuario (
    ID INT PRIMARY KEY identity(1,1),
    Tipo VARCHAR(80)
);

	CREATE TABLE Cidade (
    Nome_cidade VARCHAR(50),
    ID INT PRIMARY KEY identity(1,1),
    fk_UF_ID INT
);
	
	CREATE TABLE Bairro (
    ID INT PRIMARY KEY identity(1,1),
    Nome_bairro VARCHAR(50),
    fk_Cidade_ID INT
);

	CREATE TABLE UF (
    ID INT PRIMARY KEY identity(1,1),
    Nome_UF VARCHAR(50),
    Sigla_UF VARCHAR(10)
);

	CREATE TABLE Endereco (
    ID INT PRIMARY KEY identity(1,1),
    Logradouro VARCHAR(120),
    Numero VARCHAR(50),
    Complemento VARCHAR(120),
    fk_Bairro_ID INT,
    fk_Imovel_ID INT
);

	CREATE TABLE TipoAnuncio (
    ID INT PRIMARY KEY identity(1,1),
    Nome_Tipo_Anuncio VARCHAR(80)
);

	CREATE TABLE TipoAnuncio (
    ID INT PRIMARY KEY identity(1,1),
    Nome_Tipo_Anuncio VARCHAR(80)
);

	CREATE TABLE Imovel (
    Qtd_vaga INT,
    Qtd_quarto INT,
    Qtd_suite INT,
    Qtd_banheiro INT,
    Comodidade TEXT,
    Area_util INT,
    Valor_imovel DECIMAL,
    ID INT PRIMARY KEY identity(1,1),
    Observacoes TEXT,
    fk_TipoImovel_ID INT,
    fk_TipoAnuncio_ID INT,
	fk_Endereco_ID INT
);

	CREATE TABLE TipoImovel (
    ID INT PRIMARY KEY identity(1,1),
    NomeTipoImovel VARCHAR(80)
);

	CREATE TABLE Imagem (
    ID INT PRIMARY KEY identity(1,1),
    Nome_Imagem VARCHAR(120),
    url VARCHAR(120),
    fk_Imovel_ID INT
);

	CREATE TABLE Login (
    Id INT PRIMARY KEY identity(1,1),
    Email VARCHAR(120),
    Senha VARCHAR(32),
    fk_Usuario_ID INT
);

	ALTER TABLE Usuario ADD CONSTRAINT FK_Usuario_2
    FOREIGN KEY (fk_TipoUsuario_ID)
    REFERENCES TipoUsuario (ID)
    ON DELETE CASCADE;
 
ALTER TABLE Cidade ADD CONSTRAINT FK_Cidade_2
    FOREIGN KEY (fk_UF_ID)
    REFERENCES UF (ID)
    ON DELETE CASCADE;
 
ALTER TABLE Bairro ADD CONSTRAINT FK_Bairro_2
    FOREIGN KEY (fk_Cidade_ID)
    REFERENCES Cidade (ID)
    ON DELETE CASCADE;
 
ALTER TABLE Endereco ADD CONSTRAINT FK_Endereco_2
    FOREIGN KEY (fk_Bairro_ID)
    REFERENCES Bairro (ID)
    ON DELETE CASCADE;
 
ALTER TABLE Endereco ADD CONSTRAINT FK_Endereco_3
    FOREIGN KEY (fk_Imovel_ID)
    REFERENCES Imovel (ID)
    ON DELETE CASCADE;
 
ALTER TABLE Imovel ADD CONSTRAINT FK_Imovel_2
    FOREIGN KEY (fk_TipoImovel_ID)
    REFERENCES TipoImovel (ID)
    ON DELETE CASCADE;
 
ALTER TABLE Imovel ADD CONSTRAINT FK_Imovel_3
    FOREIGN KEY (fk_TipoAnuncio_ID)
    REFERENCES TipoAnuncio (ID)
    ON DELETE CASCADE;
 
	ALTER TABLE Imovel ADD CONSTRAINT FK_Imovel_4
    FOREIGN KEY (fk_Endereco_ID)
    REFERENCES Endereco (ID)
    ON DELETE CASCADE;

ALTER TABLE Imagem ADD CONSTRAINT FK_Imagem_2
    FOREIGN KEY (fk_Imovel_ID)
    REFERENCES Imovel (ID)
    ON DELETE CASCADE;
 
ALTER TABLE Login ADD CONSTRAINT FK_Login_2
    FOREIGN KEY (fk_Usuario_ID)
    REFERENCES Usuario (ID)
    ON DELETE CASCADE;



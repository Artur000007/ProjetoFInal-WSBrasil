Use RomullusCorp;

	--Criando Tabelas Com Procedure

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

	--Chamando Procedure

	exec InserirDados @nome ='Não Encontrei o Imóvel';
exec InserirDados @nome ='Não Encontrei o Vendedor';
exec InserirDados @nome ='Não Quero Vender';
exec InserirDados @nome ='Crítica';
exec InserirDados @nome ='Sugestões';

go
	create procedure sp_GetCurrentDateTime
 as
 Select GETDATE() AS CurrentDateTime;
Execute sp_GetCurrentDateTime;

go
	
	--Criando Functions para Calculo

	go
CREATE FUNCTION CalcularValorTotalProTipo(@TipoImovelID INT)
Returns Decimal (10,2)
as
begin
	DECLARE @ValorTotal decimal
	SELECT @ValorTotal = SUM(Valor_imovel)
	from Imovel
	WHERE fk_TipoImovel_ID = @TipoImovelID
	Return @ValorTotal;
END;
go

go

	--Criando Procedures de Imagens por imovel

Create Procedure ImagensPorImovel
@ImovelID int
as
begin
	select * 
	from Imagem
	where fk_Imovel_ID = @ImovelID;

end;
go

	--Criando Procedures Para Inserir O Login

	go
Create procedure inserelogin

	@Email varchar(120),
	@senha varchar(32),
	@fk_Usuario_ID int
AS
BEGIN
	INSERT INTO Logins(Email,Senha,fk_Usuario_ID)
	values(@email,@senha,@fk_Usuario_ID);
end
go

	--Criando Procedures Para Alterar a Senha

	go
Create procedure EditarSenha
	@id int ,
	@novaSenha varchar(32)
	as 
	begin
	
update usuario
set Senha = @novaSenha
where ID = @id;
end;
go


	--Criando Procedure Para Deletar Os Logins

go 
Create Procedure DeleteLog
@id int
as 
begin 
	delete from logins 
	where id = @id;
end;
go

	--Criando Procedure Para Imoveis Por TipoAnuncio

go

CREATE PROCEDURE ImoveisTipoAnuncio
@idTipo int
as
begin 
	select Imovel.id,Imovel.Observacoes,TipoAnuncio.Nome_Tipo_Anuncio
	from Imovel
	 join TipoAnuncio
	on Imovel.fk_TipoAnuncio_ID = TipoAnuncio.ID 
	where fk_TipoAnuncio_ID = @idTipo;
end;


go

	--Criando Procedure Para Aumento Do Valor imovel

go
Create Procedure Aumento
@FatorAumento float
as 
begin
	update Imovel
	set Valor_imovel = Valor_imovel * @FatorAumento;
end;
go

	--Criando Procedure Para Inserir um Novo Usuario

go 
begin
create procedure NovoUsuario
@nome varchar(120),
@email varchar(120),
@senha varchar(32),
@fk_TipoUsuario int
as
begin
	insert into usuario(nome,email,senha,DataHoraCriacao,DataHoraUltimoAcesso,fk_TipoUsuario_ID)
	values(@nome,@email,@senha,getdate(),getdate(),@fk_TipoUsuario);
end;
go

	-- Criando Procedure Para Deletar um Imovel Por Cidade

IF OBJECT_ID('DeletarImoveisPorCidade', 'P') IS NOT NULL
    DROP PROCEDURE DeletarImoveisPorCidade;
GO

CREATE PROCEDURE DeletarImoveisPorCidade
    @nomeCidade VARCHAR(120)
AS
BEGIN
    DECLARE @cidadeID INT;
    SELECT @cidadeID = ID FROM Cidade WHERE Nome_cidade = @nomeCidade;

    IF @cidadeID IS NULL
    BEGIN
        PRINT('Cidade não encontrada');
        RETURN;
    END

    DELETE FROM Imovel
    WHERE fk_Endereco_ID IN (
        SELECT e.ID
        FROM Endereco e
        INNER JOIN Bairro b ON e.fk_Bairro_ID = b.ID
        WHERE b.fk_Cidade_ID = @cidadeID
    );

    PRINT('Imóveis na cidade ' + @nomeCidade + ' foram deletados com sucesso.');
END;
go










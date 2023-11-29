use RomullusCorp;

	--Usando os Selects
select * from Usuario;
Select * from TipoUsuario;
select * from Logins;
select * from Imovel;
Select * from TipoImovel;
Select * from tipocontato;
select * from contatosite;
select * from Imagem;
select * from endereco;
select * from bairro;
select * from cidade;
select * from TipoAnuncio;
Select * from QntdeImoveis;
select * from SomarOValorImovelPorTipo;
select * from QntdeimoveisPorTipoAnuncio;
select * from sys.procedures;
select * from sys.views;
SELECT ID, Area_util, FORMAT (Valor_imovel, 'C', 'pt-BR'), FORMAT( CAST( ROUND(
	CASE
		WHEN NULLIF(Area_util, 0) IS NULL THEN NULL
		ELSE Valor_Imovel / NULLIF(Area_util, 0)
	END, 2) AS DECIMAL (10, 2)), 'C', 'pt-BR') AS ValorPorMetroQuadrado
FROM Imovel;
Select dbo.CalcularValorTotalProTipo(1) as ValorImoveis;



	--Executando Procedures

	--inserindo Dados
	exec InserirDados @nome ='Não Encontrei o Imóvel';
exec InserirDados @nome ='Não Encontrei o Vendedor';
exec InserirDados @nome ='Não Quero Vender';
exec InserirDados @nome ='Crítica';
exec InserirDados @nome ='Sugestões';

	--Consultando Cidades

	EXEC ConsultaPorCidade @ID = 10;

	--Imagens Por Imovel

	exec ImagensPorImovel @ImovelID = 1; 

	--Inserindo Login

	exec inserelogin @email  = 'Nome',@senha = 'Senha', @fk_usuario_id = 'Seu ID'

	-- Alterando A Senha

	exec EditarSenha @id = 'ID do Usuario',@novaSenha ='SuaSenha'

	--Deletando Login Do Usuario

	exec deletelog @id = 'ID do Usuario'; 

	--Imoveis Por Tipo Anuncio

exec ImoveisTipoAnuncio @IdTipo = 1;
exec ImoveisTipoAnuncio @IdTipo = 2;
exec ImoveisTipoAnuncio @IdTipo = 3;

	--Aumento do Valor Do Imovel

	Exec Aumento @FatorAumento = 3.6;

	-- Iserindo Novo Usuario

exec NovoUsuario @nome = 'NomeDoUsuario',@Email = 'NOME@gmail.com',@senha = 'Senha de 18 digitos', @fk_TipoUsuario_ID = 'TipoUsuario'; 

	--Deletarimovelporcidade

	EXEC DeletarImoveisPorCidade @nomeCidade = 'NomeDaCidade';









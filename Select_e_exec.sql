use RomullusCorp;

	--Usando os Selects
Select * from UF;
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
FROM Imovel  ;
Select dbo.CalcularValorTotalProTipo(1) as ValorImoveis ;

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


	--------------------ooooooooooooooooooo0o0o0o0o0o0o0o0o0o0o0o0o0o0o0o0o0o0o0o0o0o0o0o0o0o0o0o0o0o0o0o0o0o0o0o0o0o0o0o0o0o0o0o0o0ooooooooooooooooooooooooooooooooooooooooooo---------------------------------------
	use RomullusCorp;

-- Calcular a média de valor por metro quadrado e ordenar por estado de forma crescente
SELECT
  Nome_UF,
    CAST (SUM(Valor_imovel) / SUM(Area_util) AS DECIMAL (10,2)) MediaPorMetroQuadrado
FROM Imovel i
JOIN UF u
ON i.ID = u.ID
GROUP BY Nome_UF
ORDER BY MediaPorMetroQuadrado ASC;

-- Traga em uma consulta os estados com menor e maior média por metro quadrado
	--1* primeira forma feita
SELECT TOP 2
    Nome_UF, CAST (sum(Valor_Imovel) / sum(Area_util) as Decimal(10,2))
    MediaPorMetroQuadrado
FROM UF u
join Imovel i 
on i.ID = u.ID
group by Nome_UF
ORDER BY MediaPorMetroQuadrado ASC;

--2* segunda forma feita
go
Create view vw_MediaPorMetroQuadrado_EstadosCidades as
WITH MediaPorMetroQuadrado AS (
    SELECT c.Nome_Cidade as 
		Cidades,
       AVG(i.Valor_imovel / Area_util * 1.0) AS MediaPorMetroQuadrado
    FROM Imovel i
	join Endereco e ON i.fk_Endereco_ID = e.ID
	join Bairro b ON e.fk_Bairro_ID = b.ID
	join Cidade c ON b.fk_Cidade_ID = c.ID
	join UF u on c.fk_UF_ID = u.ID
	Group by c.Nome_cidade
	
	)
  

  
SELECT TOP 2
    MediaPorMetroQuadrado.Cidades,
	FORMAT(MediaPorMetroQuadrado.MediaPorMetroQuadrado, 'C','PT-BR') AS MediaPorMetro
FROM MediaPorMetroQuadrado
go

select * from vw_MediaPorMetroQuadrado_EstadosCidades;
	--Consulta com mais de um imovel por estado ou/e cidade


go
create view vw_MediaMetro as
WITH MediaPorMetroQuadradoCTE AS (
    SELECT
        i.ID,
        u.Nome_UF,
        c.Nome_Cidade,
       FORMAT(AVG(i.Valor_Imovel / i.Area_util), 'C', 'PT-BR' )as MediaPorMetroQuadrado
    FROM  Imovel i 
    JOIN Endereco e ON i.fk_Endereco_ID = e.ID 
    JOIN Bairro b ON e.fk_Bairro_ID = b.ID
    JOIN Cidade c ON b.fk_Cidade_ID = c.ID
    JOIN UF u ON c.fk_UF_ID = u.ID
    GROUP BY u.Nome_UF, c.Nome_Cidade, i.ID
);
go
SELECT
    
	ID,
	Nome_UF,
    Nome_Cidade,
    MediaPorMetroQuadrado
FROM vw_MediaMetro;

;
go

select * from MediaMetro;

drop view MediaMetro;
/*
- pegar imoveis de rio branco - media do metro quadrado
- pegar os imoveis de salvador - media do metro quadrado
*/

select * from vw_MediaMetro where vw_MediaMetro.Nome_cidade = 'Salvador' or vw_MediaMetro.Nome_cidade = 'Rio Branco'

/*
-Consulta com 5 Cidades com maior média de valor por metro quadrado
*/
go
Create View vw_top5ImoveisComMaiorMedia as
SELECT TOP 5
	u.Sigla_UF,
	c.nome_cidade,
	COUNT(i.ID) as QntdeImoveis , 
	FORMAT(MAX(i.Valor_Imovel/I.Area_Util * 1.0), 'C', 'PT-BR') as MaxMetro
	FROM Imovel i
	join Endereco e ON i.fk_Endereco_ID = e.ID
	join Bairro b on e.fk_Bairro_ID = b.ID
	join Cidade c on b.fk_Cidade_ID = c.ID
	Join UF u ON c.fk_UF_ID = u.ID
	GROUP BY u.Sigla_UF, c.Nome_cidade
	ORDER BY QntdeImoveis DESC;
go
	
Select * from vw_top5ImoveisComMaiorMedia 

	/*
	--faça uma busca se mostra todos os imoveis que tenha áreas entre 110 330 e de o desconto no valor do imovel de 30%
	*/
	GO
	CREATE VIEW vw_AreasComDescontoDe30 as 
		SELECT ID, Area_util, FORMAT(Valor_imovel, 'C','pt_BR') AS Valor_Imovel, FORMAT(Valor_imovel*0.7, 'C', 'pt-BR') AS Valor_Com_Desconto
	FROM Imovel;
	GO

SELECT * FROM vw_AreasComDescontoDe30 WHERE Area_util BETWEEN 110 AND 330
ORDER BY Valor_Imovel DESC;

/*
*/
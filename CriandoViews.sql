Use RomullusCorp;

      ---Criando Views---

	--Detalhes dos Imoveis Do DF (Distrito Federal)

go
Create view vw_DetalhesImovelDF as 
select 
	i.ID,
	i.Valor_imovel,
	e.Logradouro,
	e.Numero,
	b.Nome_bairro,
	c.Nome_cidade,
	u.Nome_UF
	
from imovel i
join Endereco e 
on i.fk_Endereco_ID = e.ID
join Bairro b
on e.fk_Bairro_ID = b.ID 
join Cidade c
on b.fk_Cidade_ID = c.ID
join UF u
on c.fk_UF_ID = u.ID
where Nome_UF = 'Distrito Federal';
go

	
	--Quantidade De Imoveis Por Cidade

go
create view QntdeImoveis
as
select  count(i.ID) as ImoveiPorCidade
from imovel i
join endereco e
on i.fk_endereco_id = e.ID
join  bairro b 
on e.fk_bairro_ID = b.ID
join cidade c 
on b.fk_cidade_ID = c.id
where c.Nome_Cidade = 'Rio Branco'
go;

	-- Quantidade De imoveis Por Tipo Anuncio

go
Create View QntdeimoveisPorTipoAnuncio
as
select t.Nome_Tipo_Anuncio, count(i.ID)as qntdeimoveis
from imovel i 
join TipoAnuncio t
on i.fk_TipoAnuncio_ID = t.ID
join Endereco e
on i.fk_Endereco_ID = e.ID 
join bairro b
on e.fk_Bairro_ID = b.ID
join cidade c
on b.fk_Cidade_ID = c.ID
join UF u
on c.fk_UF_ID = u.ID
group by t.Nome_Tipo_Anuncio
go;

	--Somando Valores Por Tipo Imovel

go
CREATE VIEW SomarOValorImovelPorTipo
AS
SELECT SUM (i.Valor_imovel) AS SomaImovelValor, t.NomeTipoImovel
FROM Imovel i
	JOIN TipoImovel t ON i.fk_TipoImovel_ID = t.ID
GROUP BY t.NomeTipoImovel;
GO
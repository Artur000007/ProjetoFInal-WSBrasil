use RomullusCorp;

	--Inserindo ContatoSite

	insert into ContatoSite(Nome,Email,mensagem,DataHora,fk_TipoContato_id)values
	('Mattyahu','jogosujo@gmail.com','Quanto fica a casa pros menino tenho pressa pois eu to saindo, fica calmo so vai resumindo','2023-04-07T23:56:00',1),
	('Kyan','umquebradainteligente@gmail.com','vocês nem garantem a segurança, eu sim garanto, nois resolve melhor que vocês e também vende de noite','2023-11-13T11:44:21',2),
	('MDCHEFE','Lacoste@gmail.com','Ai neguin HAHAHA, não encontrei a casa não neguin HAHAHA','2023-08-01T08:02:29',1),
	('Derek','trapthefato@gmail.com','Não quero vender a casa pra você nego, se sabe que eu vou vender a casa só pra gang','2023-06-30T20:09:55',2),
	('RyuTheRunner','eocorredor@gmail.com','Sua casa ta caindo aos pedaços, negos não podem dar vacilo meu mano','2023-03-23T18:45:39',1),
	('Danzo','thedanzo@gmail.com','mano se você retocar as casa vai ficar com o preço bem bacana, nem tudo que nois pensa tem que colocar em ação logo nego','2023-12-09T16:30:11',2);
	
	--inserindo Usuario

	insert into usuario (nome,email,senha,DataHoraCriacao,DataHoraUltimoAcesso)values
('João da Silva', 'joao.silva@email.com', '123456', '2023-10-12T11:00:00','2023-10-12T19:00:00' ),
('Maria das Dores', 'maria.dores@email.com', '654321', '2023-11-19T11:01:00', '2023-12-12T11:00:00'),
('José Pereira', 'jose.pereira@email.com', '987654', '2023-01-08T11:02:00', '2023-02-10T11:00:00'),
('Ana Paula', 'ana.paula@email.com', '432198', '2023-01-14T11:03:00', '2023-10-15T11:00:00'),
('Pedro Henrique', 'pedro.henrique@email.com', '765432', '2023-12-14T11:04:00', '2023-12-20T11:00:00'),
('Clara Beatriz', 'clara.beatriz@email.com', '876543', '2023-11-07T11:05:00', '2023-12-14T11:00:00'),
('Joaquim Francisco', 'joaquim.francisco@email.com', '543219', '2023-05-01T11:06:00', '2023-07-12T11:00:00'),
('Luiza Gabriela', 'luiza.gabriela@email.com', '654321', '2023-03-12T11:07:00', '2023-06-10T11:00:00'),
('Carlos Eduardo', 'carlos.eduardo@email.com', '765432', '2023-11-14T11:08:00', '2023-12-17T11:00:00'),
('Isabela Carolina', 'isabela.carolina@email.com', '876543', '2023-09-17T11:09:00', '2023-11-12T21:00:00');

	--Inserindo TipoUsuario
		insert into TipoUsuario(Tipo)values
	('Adminstrativo'),
	('Corretor'),
	('Financeiro'),
	('Cliente');

	--Inserindo Cidades

			INSERT INTO Cidade (Nome_Cidade, fk_UF_ID)
VALUES
    ('Rio Branco', 1),
    ('Cruzeiro do Sul',1 ),
    ('Maceió', 7),
    ('Arapiraca', 7),
    ('Macapá', 2),
    ('Santana', 2),
    ('Manaus', 3),
    ('Parintins', 3),
    ('Salvador', 8),
    ('Feira de Santana', 8),
    ('Fortaleza', 9),
    ('Juazeiro do Norte', 9),
    ('Brasília', 15),
    ('Taguatinga', 15),
    ('Vitória',19),
    ('Vila Velha', 19),
    ('Goiânia', 16),
    ('Aparecida de Goiânia', 16),
    ('São Luís', 10),
    ('Imperatriz', 10);

		--Inserindo Bairros

			insert into Bairro (Nome_bairro,fk_Cidade_ID)
	values
	('Bairro da Paz',1),
	('Bairro Bosque',2),
	(' Pajuçara',3),
	('Caititus',4),
	(' Santa Inês',5),
	(' Remédios',6),
	('Cidade Nova',7),
	(' Paulo Corrêa',8),
	('Barra',9),
	('Centro',10),
	('Aldeota',11),
	('Lagoa Seca',12),
	('Asa Sul',13),
	('Taguatinga Norte',14),
	('Jardim Da Penha',15),
	('Coqueiral de Itarapica',16),
	('Setor Bueno',17),
	('Setor Garavelo',18),
	('Renascença',19),
	('Nova Imperatriz',20);

	--Inserindo UFs

	INSERT INTO UF
(Nome_UF,Sigla_UF)
VALUES
( 'Acre', 'AC'),
('Amapá','AP'),
('Amazonas', 'AM'),
('Roraima','RR'),
( 'Rondônia','RO'),
('Tocantins','TO'),
  ('Alagoas', 'AL'),
('Bahia','BA'),
('Ceará','CE'),
('Maranhão','MA'),
('Paraíba','PB'),
('Pernambuco','PE'),
('Piauí','PI'),
('Sergipe','SE'),
('Distrito Federal','DF'),
('Goiás','GO'),
('Mato Grosso','MT'),
('Mato Grosso do Sul','MS'),
( 'Espírito Santo','ES'),
('Minas Gerais','MG'),
('Rio de Janeiro','RJ'),
('São Paulo','SP'),
('Paraná','PR'),
('Santa Catarina','SC'),
('Rio Grande do Sul','RS');

	--Inserindo Enderecos

	INSERT INTO Endereco (Logradouro, Numero, Complemento, fk_Bairro_ID)
VALUES
    ('Rua da Serenidade', '123', 'Apto 301',1), -- Bairro da Paz
    ('Avenida das Árvores', '456', 'Casa 2',2), -- Bairro Bosque
    ('Rua das Marés', '789', 'Bloco B', 3), -- Pajuçara
    ('Alameda das Flores', '10', 'Kitnet 5', 4), -- Caititus
    ('Travessa das Rosas', '15', 'Cobertura 3', 5), -- Santa Inês
    ('Avenida da Saúde', '200', 'Apto 502', 6), -- Remédios
    ('Rua da Modernidade', '50', 'Casa de Campo', 7), -- Cidade Nova
    ('Avenida do Progresso', '30', 'Sobrado 1', 8), -- Paulo Corrêa
    ('Rua da Praia', '1000', 'Casa de Praia', 9), -- Barra
    ('Rua Principal', '15', 'Loft 3', 10), -- Centro
	('Rua das Palmeiras', '321', 'Apto 101', 11), -- Aldeota
    ('Avenida da Lagoa', '654', 'Casa 3', 12), -- Lagoa Seca
    ('Quadra 123 Sul', '789', 'Bloco C', 13), -- Asa Sul
    ('Rua do Comércio', '456', 'Loja 2', 14), -- Taguatinga Norte
    ('Avenida das Flores', '987', 'Cobertura 1', 15), -- Jardim Da Penha
    ('Rua do Coqueiro', '321', 'Apto 202', 16), -- Coqueiral de Itarapica
    ('Avenida Bueno', '654', 'Sobrado 3', 17), -- Setor Bueno
    ('Rua do Garavelo', '987', 'Casa 4', 18), -- Setor Garavelo
    ('Avenida da Renascença', '741', 'Apto 401', 19), -- Renascença
    ('Rua Nova Imperatriz', '852', 'Kitnet 6', 20); -- Nova Imperatriz

	--Inserindo TipoAnuncio

			insert into TipoAnuncio(Nome_Tipo_Anuncio)
	values
	('Aluguel'),
	('Compra'),
	('Venda');

	--Inserindo Imoveis

	INSERT INTO Imovel (Qtd_vaga, Qtd_quarto, Qtd_suite, Qtd_banheiro, Comodidade, Area_util, Valor_imovel, Observacoes, fk_TipoImovel_ID, fk_TipoAnuncio_ID, fk_Endereco_ID)
VALUES(1, 2, 1, 1, 'Piscina, Churrasqueira', 120, 180000.00, 'Ótima vista para a cidade', 2, 2,78),
    (3, 4, 2, 3, 'Ar condicionado, Jardim', 200, 400000.00, 'Imóvel amplo e moderno', 3,3, 81),
    (2, 2, 1, 2, 'Móveis planejados, Academia', 100, 150000.00, 'Excelente localização', 1, 2,90),
    (1, 1, 1, 1, 'Lareira, Terraço', 80, 120000.00, 'Aconchegante e bem iluminado', 4, 1,80),
    (2, 3, 2, 2, 'Piscina, Sauna', 180, 320000.00, 'Condomínio com lazer completo', 2, 2,88),
    (1, 1, 0, 1, 'Mobiliado, Segurança 24 horas', 60, 90000.00, 'Ideal para solteiros', 3, 1,84),
    (3, 4, 3, 3, 'Churrasqueira, Quadra esportiva', 220, 500000.00, 'Perfeito para famílias', 1, 2,77),
    (2, 2, 1, 2, 'Varanda gourmet, Closet', 130, 280000.00, 'Imóvel com acabamento de luxo', 4, 1,79),
    (1, 1, 1, 1, 'Piscina, Jardim de inverno', 90, 130000.00, 'Ótima oportunidade para investimento', 3, 2,82),
	(2, 3, 1, 2, 'Varanda, Armários embutidos', 150, 250000.00, 'Imóvel bem localizado', 1, 1,76);

	--Inserindo TipoImovel

	insert into TipoImovel(NomeTipoImovel)VALUES
('Residencial'),
('Comercial'),
('Institucional'),
( 'Industrial'),
( 'Agrícola');
	
	--Inserindo Imagens da Casa

		insert into imagem (Nome_Imagem,url,fk_imovel_id)values
	('1.1.jpeg','C:\Users\ead\Desktop\ArturDBA\tutu\1.1jpeg',18);
	insert into imagem (nome_imagem,url,fk_imovel_id)values
	('2.1.jpeg','C:\Users\ead\Desktop\ArturDBA\tutu\1.1.jpeg',19),('2.2.jpeg','C:\Users\ead\Desktop\ArturDBA\tutu\2.2.jpeg',19);
	insert into imagem (nome_imagem,url,Fk_imovel_id)values
	('1.2.jpeg','C:\Users\ead\Desktop\ArturDBA\tutu\1.2jpeg',21);
	insert into imagem (nome_imagem,url,fk_imovel_id)values
	('3.1','C:\Users\ead\Desktop\ArturDBA\tutu\3.1.jpeg',20),('3.2.jpeg','C:\Users\ead\Desktop\ArturDBA\tutu\3.2.jpeg',20);
	insert into imagem (nome_imagem,url,fk_imovel_id)values
	('4.1.jpeg','C:\Users\ead\Desktop\ArturDBA\tutu\4.1.jpeg',22),('4.2.jpeg','C:\Users\ead\Desktop\ArturDBA\tutu\4.2.jpeg',22);
	insert into imagem(nome_imagem,url,fk_imovel_id)values
	('5.1.jpeg','C:\Users\ead\Desktop\ArturDBA\tutu\5.1.jpeg',23),('7.1.jpeg','C:\Users\ead\Desktop\ArturDBA\tutu\7.1.jpeg',23);
	insert into imagem(nome_imagem,url,fk_imovel_id)values	
	('10.1.jpeg','C:\Users\ead\Desktop\ArturDBA\tutu\10.1.jpeg',24);
	insert into imagem(nome_imagem,url,fk_imovel_id)values
	('6.1.jpeg','C:\Users\ead\Desktop\ArturDBA\tutu\6.1jpeg',25),('6.2.jpeg','C:\Users\ead\Desktop\ArturDBA\tutu\6.2jpeg',25);
	insert into imagem (nome_imagem,url,fk_imovel_id)values
	('8.1.jpeg','C:\Users\ead\Desktop\ArturDBA\tutu\8.1.jpeg',26),('8.2.jpeg','C:\Users\ead\Desktop\ArturDBA\tutu\8.2.jpeg',26);
	insert into imagem(nome_imagem,url,fk_imovel_id)values
	('9.1.jpeg','C:\Users\ead\Desktop\ArturDBA\tutu\9.1.jpeg',27),('9.2.jpeg','C:\Users\ead\Desktop\ArturDBA\tutu\9.2.jpeg',27),('9.3.jpeg','C:\Users\ead\Desktop\ArturDBA\tutu\9.3.jpeg',27);

	--Inserindo Login Dos Usuarios

		insert into login(email,senha,fk_usuario_id)values
	('joao.silva@email.com',09876578,64),
	('maria.dores@email.com',08786534,65),
	('jose.pereira@email.com',90857983,66),
	('anapaula@email.com',98080875,67),
	('pedro.henrique@email.com',73621638,68),
	('clara.beatriz',74317233,69),
	('joaquim.francisco@@email.com',44456321,70),
	('luiza.gabriela@email.com',22990543,71),
	('carlos.eduardo@email.com',77643216,72),
	('isabela.carolina@email.com',65745398,73);

create database gama_teste;
use gama_teste;

create table PRODUTO (
	ProdutoId int primary key not null auto_increment,
    Nome Varchar(50) not null,
    PrecoUnitario double
);

create table NOTA_FISCAL (
	NotaFiscalId int primary key not null auto_increment,
    DataEmissao date not null
);
create table NOTA_FISCAL_ITEM (
	NotaFiscalItemId int primary key not null auto_increment,
    NotaFiscalId int not null,
    ProdutoId int not null,
    Quantidade integer not null,
    PrecoUnitario double not null,
    foreign key (NotaFiscalId) references NOTA_FISCAL(NotaFiscalId),
    foreign key (ProdutoId) references PRODUTO(ProdutoId)
);

insert into PRODUTO(ProdutoId, Nome, PrecoUnitario) values (1,"Notebook", 2000);
insert into PRODUTO(ProdutoId, Nome, PrecoUnitario) values (2,"Placa de video", 5000);
insert into PRODUTO(ProdutoId, Nome, PrecoUnitario) values (3,"Impressora", 500);
insert into PRODUTO(ProdutoId, Nome, PrecoUnitario) values (4,"Perifericos", 200);
insert into PRODUTO(ProdutoId, Nome, PrecoUnitario) values (5,"Outros", 100);

insert into NOTA_FISCAL(NotaFiscalId,DataEmissao) values (1, '2021-07-01');
insert into NOTA_FISCAL(NotaFiscalId,DataEmissao) values (2, '2021-07-01');
insert into NOTA_FISCAL(NotaFiscalId,DataEmissao) values (3, '2021-07-01');
insert into NOTA_FISCAL(NotaFiscalId,DataEmissao) values (4, '2021-07-01');
insert into NOTA_FISCAL(NotaFiscalId,DataEmissao) values (5, '2021-07-01');
insert into NOTA_FISCAL(NotaFiscalId,DataEmissao) values (6, '2021-07-01');
insert into NOTA_FISCAL(NotaFiscalId,DataEmissao) values (7, '2021-07-01');
insert into NOTA_FISCAL(NotaFiscalId,DataEmissao) values (8, '2021-07-01');
insert into NOTA_FISCAL(NotaFiscalId,DataEmissao) values (9, '2021-07-01');
insert into NOTA_FISCAL(NotaFiscalId,DataEmissao) values (10, '2021-07-01');

insert into NOTA_FISCAL_ITEM(NotaFiscalId, ProdutoId, Quantidade, PrecoUnitario) values(1,3,5,460);
insert into NOTA_FISCAL_ITEM(NotaFiscalId, ProdutoId, Quantidade, PrecoUnitario) values(2,1,2,1500);
insert into NOTA_FISCAL_ITEM(NotaFiscalId, ProdutoId, Quantidade, PrecoUnitario) values(3,1,5,1400);
insert into NOTA_FISCAL_ITEM(NotaFiscalId, ProdutoId, Quantidade, PrecoUnitario) values(4,2,50,3000);
insert into NOTA_FISCAL_ITEM(NotaFiscalId, ProdutoId, Quantidade, PrecoUnitario) values(5,4,200,100);
insert into NOTA_FISCAL_ITEM(NotaFiscalId, ProdutoId, Quantidade, PrecoUnitario) values(6,4,100,160);
insert into NOTA_FISCAL_ITEM(NotaFiscalId, ProdutoId, Quantidade, PrecoUnitario) values(7,5,500,80);
insert into NOTA_FISCAL_ITEM(NotaFiscalId, ProdutoId, Quantidade, PrecoUnitario) values(8,5,400,90);
insert into NOTA_FISCAL_ITEM(NotaFiscalId, ProdutoId, Quantidade, PrecoUnitario) values(9,5,300,95);
insert into NOTA_FISCAL_ITEM(NotaFiscalId, ProdutoId, Quantidade, PrecoUnitario) values(10,2,30,4000);

#A - Nome do produto com maior valor de venda (considere o valor do item na nota fiscal). 
select p.Nome from produto as p inner join nota_fiscal_item as n on p.ProdutoId = n.ProdutoId
order by n.PrecoUnitario desc
limit 1;


#B - Valor total de todas as notas e o valor total de todas as notas considerando o preço atual do produto. 
select sum(quantidade * precounitario) from nota_fiscal_item;
select sum(n.Quantidade * p.PrecoUnitario ) from nota_fiscal_item as n
inner join produto as p on n.ProdutoId = p.ProdutoId;

#C - Nome dos 5 produtos mais vendidos (quantidade) do mês atual.
select p.Nome from produto as p inner join nota_fiscal_item as n on p.ProdutoId = n.ProdutoId
inner join nota_fiscal as nf on nf.NotaFiscalId = n.NotaFiscalId
where month(nf.DataEmissao) = month(now())
group by NotaFiscalItemId order by n.Quantidade desc
limit 5;



 
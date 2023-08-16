create database ecommerce;
use ecommerce;

-- Tabelas cliente produto pedido
create table cliente(
idCliente int primary key auto_increment,
Fname  varchar(20),
minit char(3),
Lname varchar(20),
cpf char(11) not null,
unique(cpf),
endereco varchar(45),
data_de_nascimento date);


create table Produto(
idProduto int primary key auto_increment,
Pname  varchar(20),
classificacao_criancas bool,
categoria enum('Eletronico','Roupas''Brinquedos''Games','Livros'),
avaliacao float
);

create table pagamento(
id_Cliente int  ,
idPagamento int,
tipo_de_pagamento enum('dinheiro','cartão','PIX'),
limite float,

primary key(id_Cliente, idPagamento)

);

create table pedido(
idPedido int primary key auto_increment,
id_Cliente  int,
status_do_pedido enum('Cancelado','Confirmado','Em processamento') default 'Em processamento',
descricao varchar(255),
frete float default 0,
pagamento float,
constraint fk_pedido_Cliente foreign key(id_Cliente)references
cliente(IdCliente));

create table estoque(
idestoque int primary key auto_increment,
local varchar(255),
quantidade int default 10);

create table fornecedor(
idFornecedor int primary key auto_increment,
status_do_pedido enum('Cancelado','Confirmado','Em processamento') default 'Em processamento',
CNPJ char(15) not null, 
NomeSocial varchar(255),
contato varchar(20),

constraint unique_supplier  unique(CNPJ));

create table vendedor(
idVendedor int primary key auto_increment,
nomeSocial varchar(255) not null,
CNPJ char(15),
cpf char(11),
contato char(11),
constraint unique_vendedor_CNPJ  unique(CNPJ),
constraint unique_vendedor_CPF  unique(cpf));

create table Produto_Vendido(
idPVendido int ,
idProduto int,
quantidadeP int default 1,
primary key(idPVendido,idProduto),
constraint fk_Produto_Vendido foreign key(idPVendido) 
references vendedor(idVendedor),
constraint fk_Produto_Vendido_P foreign key(idProduto) 
references produto(idProduto));


create table Produto_Pedido(
idPedido int ,
idProduto int,
quantidadePP int default 1,
primary key(idPedido,idProduto),
constraint fk_Produto_Pedido foreign key(idPedido) 
references pedido(idPedido),
constraint fk_Produto_Pedido_P foreign key(idProduto) 
references produto(idProduto));

create table Localizacao_Estoque(
idProduto int ,
idEstoque int,
localizacao varchar(255),
primary key(idEstoque,idProduto),
constraint fk_Produto_Estoque foreign key(idEstoque) 
references estoque(idestoque),
constraint fk_Produto_Localizacao_E foreign key(idProduto) 
references produto(idProduto));

create table Produto_Fornecedor(
idProduto int ,
idFornecedor int,
primary key(idFornecedor,idProduto),
constraint fk_Produto_Fornecedor foreign key(idFornecedor) 
references fornecedor(idFornecedor),
constraint fk_Produto_Fornecedor_P foreign key(idProduto) 
references produto(idProduto));

-- Queries
insert into produto values(
	null,'Camisa',false,null,1.0),
(null,'PS5',false,null,5.0),
(null,'Boneca LManu',true,null,2.0);
select * from produto;
select * from produto order by avaliacao desc;
select * from produto where avaliacao>=2;





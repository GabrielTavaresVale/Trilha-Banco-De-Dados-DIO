create database oficina;
use oficina;
create table mecanico(
crea int primary key auto_increment,
nome varchar(255),
endereco varchar(255),
celular int,
cpf char(11));

create table Cliente(
CodCliente int primary key auto_increment,
nome varchar(255),
endereco varchar(255),
telefone int,
cnh int not null unique);

create table veiculo(
idVeiculo int primary key auto_increment,
placa varchar(25),
marca varchar(30),
modelo varchar(15),
ano int,
Cod_Cliente int,
constraint fk_Veiculo_Cliente foreign key(Cod_Cliente)references
cliente(CodCliente));

create table VeiculoPesado(
idVeiculoPesado int primary key auto_increment,
cumprimentoMetros int,
NumeroEixos int,
PesoToneladas int,
placa varchar(23)
);

create table Revisao(
CodRevisao int primary key auto_increment,
id_Veiculo int,
id_Mecanico int,
dataRevisoa date,
HoraRevisao time,
valorRevisao float,
Relatorio varchar(255) not null,
TrocaPecas bool,
constraint fk_Revisao_mecanico foreign key(id_Mecanico)references
Mecanico(crea),

constraint fk_Revisao_Veiculo  foreign key
(id_Veiculo) references Veiculo(IdVeiculo)

);
-- Queries
select * from veiculo;

select * from veiculo where ano>=2009;
select * from mecanico order by nome;



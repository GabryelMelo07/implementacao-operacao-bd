drop database if exists av2;

create database av2;

\c av2;

create table pessoa (
    id serial,
    nome varchar(255),
    sobrenome varchar(255),
    rua varchar(255),
    bairro varchar(255),
    complemento text,
    numero varchar(8),
    primary key(id)
);

insert into pessoa (nome, sobrenome, rua, bairro, complemento, numero) values
('Gabryel', 'Airez de Melo', 'R. Joao da Silva Silveira', 'Sao Joao', 'Praca', '559');

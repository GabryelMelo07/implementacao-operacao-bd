drop database if exists cinema;

create database cinema;

\c cinema;

drop table if exists genero;
drop table if exists filme;
drop table if exists sessao;
drop table if exists sala;
drop table if exists ingresso;

create table genero (
    id serial,
    descricao varchar(255),
    primary key (id)
);

create table filme (
    id serial,
    titulo varchar(255) not null,
    sinopse text,
    genero integer,
    foreign key (genero) references genero (id) ON DELETE CASCADE,
    primary key (id)
);

create table sala (
    id serial,
    nome varchar(255) not null,
    descricao text,
    max_lugares integer not null,
    primary key (id)
);

create table sessao (
    id serial,
    data date not null,
    hora time not null,
    sala integer not null,
    filme integer not null,
    foreign key (sala) references sala (id) ON DELETE CASCADE,
    foreign key (filme) references filme (id) ON DELETE CASCADE,
    primary key (id)
);

create table ingresso (
    id serial,
    lugar char(3) not null,
    sessao integer not null,
    foreign key (sessao) references sessao (id) ON DELETE CASCADE,
    primary key (id)
);

create role grupo_estagiario;
GRANT USAGE ON SCHEMA public TO grupo_estagiario;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO grupo_estagiario;

create role estagiario login password '123' in role grupo_estagiario;

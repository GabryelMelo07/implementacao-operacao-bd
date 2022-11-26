drop database if exists cinema;

create database cinema;

\c cinema;

drop schema if exists externo;
drop schema if exists interno;

create schema externo;
create schema interno;

set search_path to public, externo, interno;

create table externo.telespectador (
    id serial,
    cpf char(11) unique,
    nome text not null,
    primary key(id)
);

create table externo.filme (
    id serial,
    titulo text not null,
    duracao integer check (duracao > 0),
    primary key(id)
);

create table sala (
    id serial,
    nome text not null,
    capacidade integer check (capacidade > 0),
    primary key(id)
);

create table externo.sessao (
    id serial,
    data date not null,
    hora time not null,
    filme integer not null,
    sala integer not null,
    foreign key (filme) references filme (id),
    foreign key (sala) references sala (id),
    primary key(id)
);

create table externo.ingresso (
    id serial,
    valor_ingresso real,
    corredor char(1) not null,
    poltrona integer check (poltrona > 0),
    telespectador integer not null,
    sessao integer not null,
    foreign key (telespectador) references telespectador (id),
    foreign key (sessao) references sessao (id),
    primary key(id)
);

create table interno.setor (
    id serial,
    descricao text,
    valor_por_hora real,
    primary key(id)
);

create table interno.funcionario (
    id serial,
    nome text not null,
    setor integer not null,
    foreign key (setor) references setor (id),
    primary key(id)
);

create table interno.turno (
    sala integer,
    funcionario integer,
    data_hora_entrada timestamp default CURRENT_TIMESTAMP,
    data_hora_saida timestamp,
    foreign key (sala) references sala (id),
    foreign key (funcionario) references funcionario (id),
    primary key(sala, funcionario, data_hora_entrada)
);

insert into externo.telespectador (cpf, nome) values
('03064462008', 'Gabryel'),
('35544635072', 'Renato');

insert into externo.filme (titulo, duracao) values
('Dolittle', 120),
('Dupla Jornada', 99),
('Arremessando Alto', 102);

insert into sala (nome, capacidade) values
('Sala 1 Cinépic', 100),
('Sala 2', 150);

insert into externo.sessao (data, hora, filme, sala) values
('15-10-2022', '22:00', 2, 1),
('18-10-2022', '18:00', 1, 1),
('19-10-2022', '15:00', 3, 2);

insert into externo.ingresso (valor_ingresso, corredor, poltrona, telespectador, sessao) values
(25.50, 'F', 12, 1, 3),
(30.00, 'H', 15, 2, 1);

insert into interno.setor (descricao, valor_por_hora) values
('LIMPEZA', 10),
('ATENDIMENTO', 15),
('OPERACAO', 20);

insert into interno.funcionario (nome, setor) values
('Betito', 1),
('Igor', 2),
('Marcio', 3),
('Brião', 2);

insert into interno.turno (sala, funcionario, data_hora_saida) values
(1, 2, '20-10-2022 08:00'),
(2, 3, '20-10-2022 15:00');

insert into interno.turno (sala, funcionario, data_hora_entrada, data_hora_saida) values
(2, 1, '17-10-2022 08:00', '17-10-2022 20:00'),
(1, 4, '18-10-2022 08:00', '18-10-2022 20:00');
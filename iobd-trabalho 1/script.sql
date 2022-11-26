drop database if exists cinema;

create database cinema;

\c cinema;

create table genero (
    id serial,
    descricao text not null,
    primary key (id)
);

create table filme (
    id serial,
    titulo varchar(255) not null,
    sinopse text,
    genero integer not null,
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

insert into genero (descricao) values
('Ação'),
('Comedia'),
('Drama'),
('Suspense');

insert into filme (titulo, sinopse, genero) values
('Dolittle', 'Quando a Rainha Vitória fica doente, o recluso Dr. Dolittle parte em uma jornada épica ao lado de seu jovem aprendiz e seus amigos animais em busca de uma cura mágica.', 2),
('Dupla Jornada', 'Um caçador de vampiros tem uma semana para conseguir dinheiro para pagar as despesas da filha. E ele vai lutar com unhas e dentes para garantir o sustento da família.', 1),
('Arremessando Alto', 'Um olheiro de basquete azarado encontra um jogador com potencial de sucesso e se esforça para provar que ambos merecem chegar à NBA.', 3);

insert into sala (nome, descricao, max_lugares) values
('Sala 1 Cinépic', '3D', 2),
('Sala 2 Cinépic', '3D', 159),
('Sala 3', '2D', 160),
('Sala 4', '2D', 3);

insert into sessao (data, hora, sala, filme) values
('28-09-2022', '17:00', 1, 1),
('28-09-2022', '17:00', 2, 1),
('28-09-2022', '22:00', 1, 2),
('29-09-2022', '22:00', 1, 2),
('19-10-2022', '22:00', 4, 3);

insert into ingresso (lugar, sessao) values
('G11', 1),
('G12', 1),
('G13', 2),
('G14', 3),
('G15', 5),
('G16', 5),
('G17', 5);

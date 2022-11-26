drop database if exists aulas_particulares;

create database aulas_particulares;

\c aulas_particulares;

create table professor (
    id serial,
    nome varchar(255) not null,
    cpf char(11) unique not null,
    valor_hora_aula real,
    primary key (id)
);

create table aluno (
    id serial,
    nome varchar(255) not null,
    data_nascimento date not null,
    primary key (id)
);

create table aula (
    id serial,
    professor integer not null,
    aluno integer not null,
    data date default CURRENT_DATE,
    hora time default CURRENT_TIME,
    foreign key (professor) references professor(id),
    foreign key (aluno) references aluno(id),
    primary key (id)
);

create table disciplina (
    id serial,
    nome varchar(255) not null,
    primary key (id)
);

create table professor_disciplina (
    professor integer not null,
    disciplina integer not null,
    primary key (professor, disciplina)
);

insert into professor (nome, cpf, valor_hora_aula) values
('Marcio Josue Ramos Torres', '12345678910', 75.50),
('Igor Avila Pereira', '32165498701', 65.99),
('Rafael Betito', '32145698742', 31.98),
('Cibele Christ Sinoti', '78965432155', 58.99),
('Vinicius Fritzen Machado', '31156498871', 69.99),
('Luciano Vargas Gonçalves', '32145689732', 99.90);

insert into aluno (nome, data_nascimento) values
('Gabryel Airez de Melo', '17-02-2000'),
('Flavio Souza', '14-03-1968'),
('Rodrigo', '15-07-1989'),
('Katiane', '20-04-1989'),
('Diana', '30-09-2001');

insert into aula (professor, aluno) values
(1, 1),
(3, 1),
(2, 4),
(3, 3),
(3, 3),
(3, 3),
(3, 3),
(3, 3),
(4, 1),
(4, 2),
(4, 3),
(4, 3),
(4, 3),
(4, 4);

insert into disciplina (nome) values
('Matematica Discreta'),
('Logica de Programacao'),
('Fundamentos da Estatistica'),
('Fundamentos da Computacao'),
('Interface Web'),
('Programacao Orientada a Objetos'),
('Banco de Dados'),
('Engenharia de Software'),
('Lingua Inglesa');

insert into professor_disciplina (professor, disciplina) values
(1, 6),
(2, 7),
(3, 7),
(4, 8);


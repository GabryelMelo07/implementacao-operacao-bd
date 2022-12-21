drop database if exists empresa;

drop role if exists fulano;
drop role if exists ciclano;
drop role if exists grupo_estagiario;

create database empresa;

\c empresa;

CREATE FUNCTION validaCPF(character(11)) RETURNS boolean AS
$$
DECLARE
    resultado BOOLEAN;
    cpf ALIAS FOR $1;
    nro1 INTEGER;
    nro2 INTEGER;  
    nro3 INTEGER;
    nro4 INTEGER;
    nro5 INTEGER;
    nro6 INTEGER;
    nro7 INTEGER;
    nro8 INTEGER;
    nro9 INTEGER;
    nro10 INTEGER;
    nro11 INTEGER;
    soma INTEGER;
    resto INTEGER;
    resultadoDigito1 BOOLEAN;
    resultadoDigito2 BOOLEAN;
BEGIN
    resultado := FALSE;
    resultadoDigito1 := FALSE;
    resultadoDigito2 := FALSE;
    
    IF cpf is NULL THEN
        RETURN FALSE;
    END IF;
    IF LENGTH(cpf) != 11 THEN
        RETURN FALSE;
    END IF;
    IF cpf = '00000000000' or 
		cpf = '11111111111' or 
		cpf = '22222222222' or 
		cpf = '33333333333' or 
		cpf = '44444444444' or 
		cpf = '55555555555' or 
		cpf = '66666666666' or 
		cpf = '77777777777' or 
		cpf = '88888888888' or 
		cpf = '99999999999' THEN
        return FALSE;
    END IF;

    nro1 := SUBSTRING(cpf,1, 1);
    nro2 := SUBSTRING(cpf,2, 1);
    nro3 := SUBSTRING(cpf,3, 1);
    nro4 := SUBSTRING(cpf,4, 1);
    nro5 := SUBSTRING(cpf,5, 1);
    nro6 := SUBSTRING(cpf,6, 1);
    nro7 := SUBSTRING(cpf,7, 1);
    nro8 := SUBSTRING(cpf,8, 1);
    nro9 := SUBSTRING(cpf,9, 1);
    nro10 := SUBSTRING(cpf,10, 1);
    nro11 := SUBSTRING(cpf,11, 1);

    soma := nro1 * 10 + nro2 * 9 + nro3 * 8 + nro4 * 7 + nro5 * 6 + nro6 * 5 + nro7 * 4 + nro8 * 3 + nro9 * 2;
    resto := (soma * 10) % 11;   
    IF resto = 10 THEN
        resto := 0;
    END IF;
    IF resto = nro10 THEN
        resultadoDigito1 := TRUE;
    END IF;
--  DIGITO 2
    soma := nro1 * 11 + nro2 * 10 + nro3 * 9 + nro4 * 8 + nro5 * 7 + nro6 * 6 + nro7 * 5 + nro8 * 4 + nro9 * 3 + nro10 * 2;
    resto := (soma * 10) % 11;   
    IF resto = nro11 THEN
        resultadoDigito2 := TRUE;
    END IF;
    IF resto = nro10 THEN
        resultadoDigito1 := TRUE;
    END IF;
    resultado := resultadoDigito1 AND resultadoDigito2;
    return resultado;
exception
    when others then raise notice 'CPF Inválido.';
    return FALSE;
END;
$$ LANGUAGE 'plpgsql' SECURITY DEFINER;

create table funcionario (
    cpf char(11) check (validaCPF(cpf) is true),
    rg char(10),
    nome varchar(255),
    sexo char(1) check (sexo = 'M' or sexo = 'F'),
    data_nascimento date,
    endereco text,
    telefone char(11),
    estado_civil varchar(20),
    nacionalidade varchar(50),
    data_admissao date,
    primary key (cpf)
);

create table cargo (
    id serial,
    nome varchar(255),
    dt_inicio date not null,
    dt_fim date,
    primary key (id)
);

create table ocupacao (
    funcionario char(11),
    cargo integer,
    foreign key (funcionario) references funcionario (cpf),
    foreign key (cargo) references cargo (id),
    primary key (funcionario, cargo)
);

create table dependente (
    id serial,
    nome varchar(255),
    dt_nascimento date,
    funcionario char(11),
    foreign key (funcionario) references funcionario (cpf),
    primary key (id)
);

create role grupo_estagiario;

GRANT USAGE ON SCHEMA public TO grupo_estagiario;
REVOKE ALL PRIVILEGES ON DATABASE atividade4 FROM grupo_estagiario;
GRANT SELECT ON ALL TABLES IN SCHEMA public to grupo_estagiario;

create role fulano login password 'fulano' SUPERUSER;
create role ciclano login password 'ciclano' in role grupo_estagiario;

insert into funcionario (cpf, nome) values
('03064462008', 'Gabryel');
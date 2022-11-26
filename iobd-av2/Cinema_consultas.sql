-- 2)
select funcionario.nome, 'R$   ' || sum(extract(hour from turno.data_hora_saida - turno.data_hora_entrada)) * setor.valor_por_hora as salario from turno
inner join funcionario on turno.funcionario = funcionario.id
inner join setor on funcionario.setor = setor.id
where extract(month from turno.data_hora_entrada) = extract(month from CURRENT_DATE) and extract(year from turno.data_hora_entrada) = extract(year from CURRENT_DATE)
group by funcionario.nome, setor.valor_por_hora;

-- 3)
insert into interno.turno (sala, funcionario, data_hora_entrada) values
((select sala.id from sala order by random() limit 1), (select funcionario.id from funcionario order by random() limit 1), (select cast(cast(CURRENT_DATE + INTERVAL '1 day' as date) + cast('08:00' as time) as timestamp)));

-- 4)
create view ingressos as select sala.nome as sala, filme.titulo as filme, telespectador.nome as telespectador, to_char(sessao.data, 'DD/MM/YYYY') as data, sessao.hora, ingresso.corredor, ingresso.poltrona from sala
inner join sessao on sala.id = sessao.sala
inner join filme on sessao.filme = filme.id
inner join ingresso on sessao.id = ingresso.sessao
inner join telespectador on ingresso.telespectador = telespectador.id
group by 1, 2, 3, 4, 5, 6, 7;
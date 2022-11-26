--3)
select aluno.nome, count(aula.id) as aulas_realizadas from aula
inner join aluno on aula.aluno = aluno.id
where extract(month from aula.data) = extract(month from CURRENT_DATE)
group by 1;

--4)
select distinct professor.nome from professor
inner join aula on professor.id = aula.professor
inner join aluno on aula.aluno = aluno.id
where aluno.nome = 'Rodrigo';

--5)
select professor.nome from professor
where professor.nome not in (
    select professor.nome from professor
    inner join professor_disciplina on professor.id = professor_disciplina.professor
);

--6)
select nome from aluno
where extract(month from data_nascimento) = extract(month from CURRENT_DATE);

--7)
select avg(extract(year from CURRENT_DATE) - extract(year from data_nascimento)) from aluno;

--8)
select professor.nome from professor
inner join aula on professor.id = aula.professor
group by 1
having count(aula.id) in (
    select count(aula.professor) from aula
    inner join professor on aula.professor = professor.id
    group by professor.nome
    order by 1 desc limit 1
);

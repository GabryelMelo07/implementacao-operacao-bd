-- 2)
select filme.titulo as filme, sessao.id as sessao,
case
	when count(ingresso.id) = sala.max_lugares then 'limite de ingressos.'
else 'ingressos disponiveis.' end as ingressos
from filme
inner join sessao on filme.id = sessao.filme
inner join ingresso on sessao.id = ingresso.sessao
inner join sala on sessao.sala = sala.id
group by filme.id, sala.max_lugares, sessao.id
having count(ingresso.id) = sala.max_lugares;

-- 3)
select filme.titulo, count(*) as ingressos from filme
inner join sessao on filme.id = sessao.filme
inner join ingresso on sessao.id = ingresso.sessao
group by 1;

-- 4)
select filme.titulo from filme
inner join sessao on filme.id = sessao.filme
group by 1
having count(*) in (
    select count(sessao.filme) from sessao
    inner join filme on sessao.filme = filme.id
    group by filme.titulo
    order by 1 desc limit 1
);
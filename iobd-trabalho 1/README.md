**Trabalho 1**

Construa um B.D de um sistema de vendas de ingressos para um cinema.

* No cinema, não é possível vender dois ingressos para o mesmo lugar em uma mesma sessão.
* É possível que um mesmo filme seja exibido mais de uma vez em um mesmo dia (em qualquer horário e em qualquer sala).
* Durante a venda, só é possível vender ingressos para sessões de filmes disponíveis para exibição (dentro do período de exibição) e que ainda tenham lugares disponíveis.
* O cliente deve, no momento da compra, identificar as sessões disponíveis e os lugares disponíveis.
* Um filme pode ter várias sessões e uma sessão é de um único filme;
* Em uma sala pode existir diversas sessões (em horários e dias diferentes), mas uma sessão de uma única sala.
* Em um Ingresso deve constar o lugar e a sessão.
* Um filme deve ter um identificador único, título, sinopse e gênero.
* Para cada gênero temos um identificador único e uma descrição
* Para cada sala temos um identificador único, nome, a descrição e número máximo de lugares
* Um filme pode ter várias sessões mas um sessão e de um único filme;
* Em uma mesma sala poderá acontecer diversas sessões mas um sessão ocorre em um única sala
* Um filme tem somente um gênero mas um mesmo gênero pode ser gênero de diversos filmes
* Para cada sessão temos um id, a data e hora, o filme e a sala

obs: colunas adicionais podem ser criadas para a construção do banco.

1.(0.5) Construa o modelo relacional e o script SQL  
2.(0.5) Construa uma consulta SQL que retorne os filmes que venderam todos os ingressos de um determinada sessão (sessões que NÃO podem mais vender ingressos)  
3.(0.5) Construa uma consulta SQL que retorna para cada filme o total de ingressos vendidos (considerando todas as sessões de cada filme)  
4.(0.5) Construa uma consulta SQL que retorne o filme (ou filmes) que tiveram mais sessões no mês atual (em caso de empate deve aparecer todos os filmes empatados)  

**Valor**: 2

**Prazo**: 19/10

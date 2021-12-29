select cursos.* from cursos order by nome desc;  --seleciona todos os registros da tabela cursos, ordenando pela coluna nome da tabela. DESC || ASC de forma
-- decrescente ou ascendente, caso quiser ordenar dentro de uma ordenaçãao, basta adicionar uma virgula e por o proximo order by

select cursos.nome, cursos.carga, cursos.ano from cursos order by ano, nome; -- faz uma busca e apresenta as colunas especificadas, não mais todas, que é representada por(*)

select cursos.* from cursos where ano = '2016' order by nome; --seleciona com where(filtro) dos registro onde a coluna nome tem o valor de '2016'. O where pode ser 
--seguido de mais operadores logicos, como,  [>, <, <=, >=, =, !=]

select cursos.* from cursos where ano between 2014 and 2016;
 --seleciona todos as colunas da table cursos onde os valores dos anos estão entre(between) 2014 e(and) 2016

select cursos.* from cursos where ano between 2014 and 2016 order by ano desc, nome asc
 --ordenando o ano em decrescente e o nome em ascendente

select cursos.* from cursos where ano in 2014,2016,2018;
 --seleciona todas as colunas que dos registros que estão exatamente nos anos passados pelos parenteses

select cursos.nome, cursos.carga, cursos.totaulas from cursos where cursos.carga > 35  and cursos.totaulas < 35;
 --seleciona os campos nome, carga e totaulas de curso onde a carga for maior que 35 e(and) totaulas <35. Pode-se usar o or tbm.

select cursos.* from cursos where nome  like 'P%';
    -- o operador like faz um filtro nos registro. No caso acima a busca esta sendo feita onde o atributo nome começar po P e vem quaalquer caracter depois sendo 
    --devido a [%]  ignorando o case  %-> subistitui nenhum ou varioss caracters
select cursos.* from cursos where nome  like '%a';
    --vai realizar a busca onde o nome tem qualquer caracter ou nenhum antes do caracter a || A
select cursos.* from cursos where nome  like '%a%';
    --vai realizar a busca onde o nome tem qualquer caracter ou nenhum antes OU depois do caracter a || A
select cursos.* from cursos where nome not like '%a%';
    --vai realizar a busca onde o nome não(not) tem qualquer caracter ou nenhum antes OU depois do caracter a || A
select curso.* from curso where nome like 'ph%p_'
    -- o (_) obriga a ter um caracter no final

select distinct gafanhotos.nacionalidade from gafanhotos order by gafanhotos.nacionalidade;
    --faz uma seleção dos registros distintos do campo nacionalidade. Basicamente ve quais os registros que existe nãao repetindo as ocorrencias.

select count(cursos.idcurso) from cursos where cursos.carga > 40;
    --faz uma contagem de idcurso na tabela cursos onde carga > 40;

select max(cursos.carga) from cursos;
    --seleciona o valor maximo do campo carga da table cursos. é possivel utilizar as demais operações logicas
select max(cursos.totaulas) from cursos where cursos.ano = '2016';
    -- seleciona o maximo de total da tabela cursos onde o ano for igual a 2016 

select sum(cursos.totaulas) from cursos;
    --soma o totaulas da tablela cursos

select avg(cursos.totaulas) from cursos;
    --apresenta a media do totaulas da table cursos



    exercicios da propostos

    1) Uma lista com o nome de todos os gafanhotos Mulheres.
    2) Uma lista com os dados de todos aqueles que nasceram entre 1/Jan/2000 e 31/Dez/2015.
    3) Uma lista com o nome de todos os homens que trabalham como programadores.
    4) Uma lista com os dados de todas as mulheres que nasceram no Brasil e que têm seu nome iniciando com a letra J.
    5) Uma lista com o nome e nacionalidade de todos os homens que têm Silva no nome, não nasceram no Brasil e pesam menos de 100 Kg.
    6) Qual é a maior altura entre gafanhotos Homens que moram no Brasil?
    7) Qual é a média de peso dos gafanhotos cadastrados?
    8) Qual é o menor peso entre os gafanhotos Mulheres que nasceram fora do Brasil e entre 01/Jan/1990 e 31/Dez/2000?
    9) Quantas gafanhotos Mulheres tem mais de 1.90cm de altura?

    exercicios da propostos

    Respostas
    #1 -  select gafanhotos.nome from gafanhotos where sexo  = 'F';

    #2 - select gafanhotos.* from gafanhotos where gafanhotos.nascimento between '2000-01-01' and '2000-12-31';

    #3 - select gafanhotos.nome from gafanhotos where gafanhotos.sexo = 'M' and profissao = 'Programador';

    #4 - select gafanhotos.* from gafanhotos where gafanhotos.sexo = 'F' and nacionalidade = 'Brasil' and nome like 'J%';

    #5 - select gafanhotos.nome, gafanhotos.nacionalidade where gafanhotos.sexo = 'M' and nome like '_Silva' and nacionalidade != 'Brasil' and peso < '100';

    #6 - select max(gafanhotos.altura) from gafanhotos where gafanhotos.nacionalidade = 'Brasil' and gafanhotos.sexo = 'M';

    #7 - select avg(gafanhotos.peso) from gafanhotos;

    #8 - select min(gafanhotos.peso) from gafanhotos where gafanhotos.sexo = 'F' and gafanhotos.nacionalidade != 'Brasil' and nascimento between '1990-01-01' and '2000-12-31';

    #9 - select count(gafanhotos.id) from gafanhotos where gafanhotos.altura > '1.90' and gafanhotos.sexo ='F';

    
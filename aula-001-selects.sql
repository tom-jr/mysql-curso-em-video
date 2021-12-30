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




select cursos.carga,count(cursos.idcurso) from cursos group by carga;
    --faz um count dos idcurso agrupado por carga. O result é o mesmo que o distinct, porem com o group by é possivel realizar um count e saber quantos registro tem os
    -- valores atribuidos

select cursos.carga,cursos.totaulas, count(cursos.idcurso) from cursos where cursos.totaulas = 30 group by carga;
    -- agrupa pelo atributo carga, onde o total de aulas for igual a 30. e conta quantas ocorrencias de cada grupo de existente de carga.

select cursos.ano, count(cursos.idcurso) from cursos group by ano order by count(cursos.idcurso) desc
    --  agrupa por ano com a contagem das incidencias de cada grupo ordenando por ordem decrescente da contagem

select cursos.ano, count(cursos.idcurso) from cursos group by ano having count(cursos.idcurso) > 5 order by count(cursos.idcurso) desc
    --  agrupa por ano com a contagem das incidencias de cada grupo havendo o contador maior que 5 ordenando por ordem decrescente da contagem

select cursos.ano, count(cursos.idcurso) from cursos where totaulas > 30 group by ano having count(cursos.idcurso) > 5 order by count(cursos.idcurso) desc
    --  agrupa por ano com a contagem das incidencias de cada grupo onde o total de aulas for mair que 30 havendo o contador maior que 5 ordenando por ordem 
    -- decrescente da contagem

select cursos.carga, count(cursos.idcurso) from cursos where cursos.ano > 2015 group by carga having carga > (select avg(cursos.carga) from cursos);
    -- agrupa os cursos pelas cargas que tem o ano maior que 2015, pegando a contagem de cada grupo e printando apenas os grupo que tem a carga acima da media de cargas
    -- de todos os cursos




exercicios
#1 - lista com as profissões dos gafanhotos e seus respectivos quantitativos.
#2 - quantos gafanhotos homens e quantos gafanhotos muheres nasceram apos 2005-01-01
#3 - lista com gafanhotos que nasceram fora do brasil, mostrando o pais de origem e total de pessoas nascida la. So poises que ticverem mais de 3 gafanhotos
#4 - lista agrupada pela altura dos gafanhotos, mostrando quantos pesam mais do que 100 e que estao acima da media de altura de todos os cadastrados


Respostas
    select gafanhotos.profissao, count(gafanhotos.id) from gafanhotos group by gafanhotos.profissao;

    select gafanhotos.sexo, count(gafanhotos.id) from gafanhotos where gafanhotos.nascimento > '2005-01-01' group by gafanhotos.sexo;

    select gafanhotos.nacionalidade, count(gafanhotos.id) from gafanhotos where gafanhotos.nacionalidade != 'Brasil' 
    group by gafanhotos.nacionalidade having count(gafanhotos.id) > 3;

    select gafanhotos.altura, count(gafanhotos.id) from gafanhotos where gafanhotos.peso >'100' group by gafanhotos.altura
    having gafanhotos.altura > (select avg(gafanhotos.altura) from gafanhotos);


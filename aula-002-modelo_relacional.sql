alter table gafanhotos add column cursopreferido int ;
    -- adicionando uma nova coluna na tabela gafanhotos para que seja chave estrangeira da tabela cursos em uma relação do tipo 1 para muito, onde um gafanhoto
    -- pode preferir um unico curso e um curso pode ser preferido por varios gafanhotos
            -- |gafanhotos|n ---------------- 1|cursos|

alter table gafanhotos add foreign key (cursopreferido) references cursos(idcurso);
    -- altera a tabela gafanhoto adicionando a column cursopreferido como chave estrangeira de cursos para que aponte para o campo idcurso
    -- ao utilizar o discribe na tabela o campo de foreign key sera representado com MUL de chave multipla, que tambem siginifica chave estrangeira


        -- JUNÇÔES MYSQL

select gafanhotos.nome, gafanhotos.cursopreferido, cursos.nome, cursos.ano from gafanhotos inner join cursos
    --faz um produto cartesiano de com gafanhotos e cursos

select gafanhotos.nome, gafanhotos.cursopreferido, cursos.nome, cursos.ano from gafanhotos inner join cursos on cursos.idcurso = gafanhotos.cursopreferido;
    --faz um produto cartesiano de com gafanhotos e cursos apenas onde o idcurso for igual a curso preferido de gafanhotos

select g.nome, g.cursopreferido, c.nome, c.ano from gafanhotos as g inner join cursos as c on c.idcurso = g.cursopreferido;
    -- o as cria um alias para cada entidade do select, como uma variavel de referencia para executar os demais comandos do select. Normalmente para diminuir o tamanho 
    -- da query
     left outer join -- apresenta o alter join com todos os registros da tabela a esquerda, mesmo as que não tem  relação
     right outer join -- apresenta o alter join com todos os registros da tabela a direita, mesmo as que não tem  relação


    /*
    Criar uma tabela para representar o relacionamento de muitos para muitos entre a tabela gafanhotos e cursos

    |gafanhotos|1---n|gafanhotos_assiste_cursos|n---1|cursos|
    */

    create table gafanhoto_assiste_curso(
        id int not null auto_icrement,
        data date,
        id_gafanhoto int,
        id_curso int,
        primary key(id),
        foreign key(id_gafanhoto) references gafanhotos(id),
        foreign key(id_curso) references curso(idcurso)
    )default charset = utf8;


select g.nome, gac.id_curso 
from gafanhotos as g inner join gafanhoto_assiste_curso as gac
on gac.id_gafanhoto = g.id;
    -- selecionando nome do garfanhoto e id_curso de gafanhoto_assiste_curso onde o id_gafanhoto de gafanhoto_assiste_curso = ao id do garfanhoto



select g.nome, gac.id_curso,c.nome 
from gafanhotos as g inner join gafanhoto_assiste_curso as gac inner join cursos as c
on gac.id_gafanhoto = g.id and gac.id_curso = c.idcurso;
    -- selecionando nome do garfanhoto e id_curso de gafanhoto_assiste_curso onde o id_gafanhoto de gafanhoto_assiste_curso = ao id do garfanhoto
    -- juntando com o nome do curso onde id_curso de gafanhoto_assiste_curso = idcurso de curso 
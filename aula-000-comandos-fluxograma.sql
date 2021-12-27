    create database cadastro;  --cria um banco de dados com nome cadastro


/*
    Tipos primitivos

    Numericos{
        inteiro[tynint,smallint,int,mediumint,bigint]
        ,real[decimal,float,doble,real]
        ,logico[bit,boolean]
    }

    Data/tempo{date,datetime,timestamp,time,year}

    Literal{
        caracter[ char, varchar],
        texto[ tinytext, text, mediumtext,longtext],
        binario[ tinyblob, blob, mediumblob,longblob],
        colecao[enum, set],
        espacial[ geometry,point,polygon, multpolygon]
    }



*/
    use cadastro;  --comando para utilizar um banco de dados. Então poder trabalhar comandos no mesmo

    create table pessoas(
        nome varchar(30),
        idade tinyint(3),
        sexo char(1),
        peso float,
        altura float,
        nacionalidade varchar(20)
    );

    describe pessoas; --descreve a table 
    desc pessoas;      -- executa o describe tambem.

    drop database cadastro --comando de deletar banco de dados declarado

    /*
    Criar novamente o banco de dados cadastro com adição de constraints.
    Recriar a tabela pessoas com os dados opmizados
    */

    create database cadastro
    default character set utf8
    default collate utf8_general_ci;


    create table pessoas(
        nome varchar(30) not null,
        nascimento date,
        sexo enum('M','F'),
        peso decimal(5,2),
        altura decimal(3,2),
        nacionalidade varchar(20) default 'Brasil'
    )default charset =utf8;


/*
Criando chave primaria de pessoas. Conceito de chaave primaria é ter uma coluna de identificação unica. Onde nem um outro registro de mesmo tipo tenha um igual.
*/

    create table pessoas(
        id int not null auto_increment,
        nome varchar(30) not null,
        nascimento date,
        sexo enum('M','F'),
        peso decimal(5,3),
        altura decimal (3,2),
        nacionalidade varchar(20) default 'Brasil',
        primary key(id)
    )default charset =utf8;

    /*
    DDL (DATA, DEFINITION, LANGUAGE)
    linguagem de definição de dados
    create database, create table

    DML (DATA, MANIPULATION, LANGUAGEM)
    linguagem de manipulação de dados
    insert into, 
    */


    /*
    Inserir dados em uma table
    id não precisa ser passado pois o mesmo é auto_crement
    e a nacionalidade como tem default pode ser substituida por default caso queira.
    caso os values são informados na ordem correta o campo não precisa ser informado, apenas os values seram suficiente para inserção. prem, todos os campos devem 
    esta esplicitos na sequencia certa.
    Podemos inserir varios de uma vez só. bastando adicionar virgula e mais um parentese com os dados da proxima entidade

    */

    insert into pessoas (nome, nascimento, sexo, peso, altura, nacionalidade) values
    ('Godofredo','1984-01-02','M','78.5','1.83', default);


    insert into pessoas (nome, nascimento, sexo, peso, altura, nacionalidade) values
    ('Maria','1999-12-30','F','55.2','1.65', 'Portugal');


    insert into pessoas (id, nome, nascimento, sexo, peso, altura, nacionalidade) values
    (default, 'Creuza','1920-12-30','F','50.3','1.65', default);



    insert into pessoas values
    (default, 'Adalgiza','1930-11-2','F','63.2','1.75', 'Irlanda');



    insert into pessoas values
    (default, 'Ana','1930-11-2','F','63.2','1.75', 'Irlanda'),
    (default, 'Pedro','2000-07-15','M','52.3','1.45', default),
    (default, 'Maria','1999-05-30','F','75.9','1.70', 'Portugal');



    insert into pessoas values
    (default, 'Claudio','1975-4-22','M','99.2','2.11', 'Brasil'),
    (default, 'Pedro','1999-12-3','M','87','2', default),
    (default, 'Janaína','1987-11-12','F','75.4','1.66', 'EUA');


    alter table pessoas add column profissao varchar(10);  --comando de alteração de tabela, no caso adicionado uma coluna na tabela, a mesma se dirigi a ultima posi-
    --ção da tabela por default. Oss registros que ja existiam ficam null

    alter table pessoas drop column profissao; --comando para dropar a column profissao da tabela pessoas.

    alter table pessoas add column profissao varchar(10) after nome; --adiciona a coluna profissao depois da coluna nome na tabela pessoas. 
                                                                    -- after = antes, first = vai primeiro, default= ultimo



    alter table pessoas modify column profissao varchar(30) not null default '';  -- altera a tabela pessoas, modificando as propriedades da coluna profissao. Antes é
    --necessario settar todos como como ''. Para que não dispare erro.

    alter table pessoas change column profissao prof varchar(30) not null default ''; -- com o change se pode alterar o nome da column. Lembrando de readicionar todas
    --as columns. 


    alter table pessoas rename to gafanhotos; --renomea a tabela


    /*
    Criacao da tabela cursos.  Campos com contraint unique informa que o produto não pode ter valores diferente das demais. E contrint  unsigned informa que não ha
    sinal naquela variavel, sendo assim não tem valores negativos naquele registro
    */

    create table if not exists cursos(
        nome varchar(30) not null unique,
        descricao text,
        carga int unsigned,
        totaulas int unsigned,
        ano year default '2016'
    ) default charset=utf8;


    alter table cursos add column idcurso int auto_crement first;  --adicionando a coluna de idcursos para a table cursos como primeira

    alter table cursos add  primary key(idcurso);

    create table if not exists teste(
        id int,
        nome varchar(20),
        idade int
    );
    
    drop table if exists teste;   --deleta a table, mesmo se tiver registros na mesma.



    /*DROP TABLE -- Comando DDL*/



    insert into cursos values
('1', 'HTML4', 'Curso de HTML5', '40', '37', '2014'),
('2', 'Algoritmos', 'Lógica de Progamação', '20', '15', '2014'),
('3', 'Photoshop', 'Dicas de Photoshop CC', '10', '8', '2014'),
('4', 'PGP', 'Curso de PHP para iniciantes', '40', '20', '2010'),
('5', 'Jarva', 'Introdução à Linguagem Java', '10', '29', '2000'),
('6', 'MySQL', 'Banco de Dados MySQL', '30', '15', '2016'),
('7', 'Word', 'Curso completo de Word', '40', '30', '2016'),
('8', 'Sapateado', 'Danças Rítmicas', '40', '37', '2018'),
('9', 'Cozinha Árabe', 'Aprender a fazer Kibe', '40', '30', '2018'),
('10', 'YouTuber', 'Gerar polêmica e ganhar inscritos', '5', '2', '2018');

    update cursos set nome = 'HTML5' where idcurso =1;   --update na tabela pessoa, settando o nome como HTML 5 onde o id(PK) = 1;

    update cursos set nome = 'PHP', ano = '2015' where idcurso = 4;

    update cursos set nome = 'Java', ano = '2015', carga = '40' where idcurso = 5 limit 1; -- acontrint limit, garante que so umaa linha sera afetada ao rodar o update

    update cursos set ano = '2050', carga = '800' where ano = '2018';

    update cursos set ano = '2018', carga = '0' where ano = '2050' limit 1; --vai fazer alteração nos registros com limit 1 de afetados.

    delete from cursos where idcurso = 8;  --deleta tal registro da tabela com a o filtro especificado

    truncate table cursos; --deleta todas os registro da tabela especificada.

    






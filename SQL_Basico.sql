/*
Operações Básicas com o banco
	Create 	- inserir registros
	Read 	- ler os registros (SELECT)
	Update 	- alterar registros
	Delete 	- Apagar registros

Criação e Normalização do Banco

*/

-- 1º) Selecionar o Banco de dados Sakila
USE sakila;

-- 2º) Pesquisar no banco Quais tabelas existem
SHOW TABLES;

-- 3º) Descubra quais são as COLUNAS da tabela Actor
DESCRIBE actor;

-- 4º) Exibir o primeiro (first_name) e o sobrenome(last_name) da tabela Actor
SELECT first_name, last_name 
FROM actor;

-- Dentro do SQL temos algumas funções que permitem manipular o resultado da busca
-- COUNT() - permite contar o resultado da busca
SELECT COUNT( * ) FROM address;

-- 5º) Descubra quantos registros existem na tabela payment e rental
SELECT COUNT( * ) FROM payment;
SELECT COUNT( * ) FROM rental;

-- 6º) Simplificando as consultas com COUNT() em duas tabelas
SELECT COUNT( * ),
( SELECT COUNT( * ) FROM payment ),
( SELECT COUNT( * ) FROM actor )
FROM  rental ;

-- Comando/Função CONCAT() -  permite concatenar/juntar o resultado de dois ou mais campos
-- função UPPER/LOWER - colocam o texto da pesquisa em caixa alta ou baixa
-- 7º) Fazer a pesquisa na tabela actor retonando o nome e sobrenome juntos
 SELECT UPPER( CONCAT("Nome Completo: ", first_name," ", last_name ) ) AS nome_completo FROM actor;
 
 -- função REPLACE( "texto_original","sera_subst", "substituição" ) - altera um texto da busca
 -- 8º) Fazer uma pesquisa alterando uma parte dos resultados (PENELOPE para MARIA)
 SELECT REPLACE( first_name, "PENELOPE", "MARIA" ), last_name FROM actor;
 
 -- 9º) Fazer uma consulta juntando o sobrenome, nome da tabela actor e nomear a coluna como autor
 SELECT CONCAT( last_name," , ", first_name ) AS autor FROM actor;
 
 
 
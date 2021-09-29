/*
Operações Básicas com o banco
	Create 	- inserir registros ( INSERT )
	Read 	- ler os registros ( SELECT )
	Update 	- alterar registros ( UPDATE )
	Delete 	- Apagar registros

Criação e Normalização do Banco

*/

/*------------------------------------------
      Subindo um banco de Dados Existente

Conectar ao SGBD
	1º Se conectar ao SGBD (Sistema de Gerenciamento do Banco de dados (mySQL)

	2º Conectese através do menu "DATABASE" > "Connect to Database"

	3º Colocando as informações do seu servidor
		- IP ou nome do servidor - localhost
        - Porta do banco: 3306
        - usuário - super usuário root/admin
        - senha - vazia/sem senha - admin
        
Rodar o Script SQL que cria o banco de dados - BD
	1º Rodar o Script que cria o Banco de dados ou Schema
    
    2º Rodar o Scrip com os dados do Banco de Dados
    
------------------------------------------*/

/*-------------------------------------------------------------
	Read - Comandos de Pesquisa/Query's - SELECT e suas Funções
---------------------------------------------------------------*/
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
 
 -- 10º) A consulta é sempre LITERAL, ele traz exatamente resultados que comibem com a palavra pesquisada
 --      A consulta sempre retorna na ordem que aconteceu o cadastro ou ordenado
 -- 	 Cláusula ORDER BY coluna - serve para ordenarmos o retorno da busca
 -- 	 ASC ou DES - colocam em ordem Ascendente é o padrão (A-Z 0-9) ou Descendente (Z-A ou 9-0)
  SELECT actor_id , last_name  FROM actor ORDER BY actor_id DESC;
  
  -- 11º) Descobrir qual o maior e o menor pagamento recebido pela locadora (payment)
  -- 		MAX() - pega o valor máximo da coluna
  -- 		MIN() - pega o valor mínimo da coluna
  SELECT payment_id , amount  FROM payment;
  SELECT payment_id , MAX( amount ) FROM payment;
  SELECT payment_id , MIN( amount ) FROM payment;
 
 -- 12º) Descobrir o código ou códigos identificadores do maior e menor valor
 --     Cláusula WHERE campo= valor - permite filtrar os resultados
 -- 	Cláusula WHERE LIKE valor -  permite fazer consultas abertas
 -- 	% caracteres mútiplos (qualquer quantidade) _ ( caractere único)
 SELECT payment_id, amount FROM payment WHERE amount = 11.99;
 SELECT payment_id, amount FROM payment WHERE amount LIKE "__.%";
 
 -- 13º Quando temos muitos dados precisamos paginar esses dados (trazê-los aos poucos do banco).
 -- 	Cláusula LIMIT inicio, qtdade - nos permite escolher de qual resultado até qual será entregue pelo banco
 SELECT * FROM film LIMIT 0, 10 ;
 SELECT * FROM film LIMIT 10, 10 ;
 SELECT * FROM film ORDER BY film_id ASC LIMIT 20, 10;
 
 -- 14º Podemos fazer as operações básicas de soma +, subtração - , multiplicação * , divisão / e módulo %
 SELECT amount * 1.3 FROM payment; -- aumento de 30%
 SELECT amount + amount FROM payment; -- somando o valor com ele mesmo
 SELECT amount * 0.9 FROM payment; -- desconto de 10%
 
 -- 15º Podemos fazer comparações com os resultados da busca
 SELECT payment_id, amount FROM payment WHERE amount < 5.00 ;
 
/*-----------------------------------------
	Criando tabelas para o banco de dados
-----------------------------------------*/
USE sakila;

/*
	 Principais tipos de dados no Banco MySQL
     
     - INT (255) - para números inteiros é o mesmo que no C# int 
     - VARCHAR (255) - para caracteres alfanuméricos - é o mesmo que o string no C#
     - TIMESTAMP - armazena a hora da interação com o banco 
     - ENUM('item01', "item") - permite montar uma lista igual ao select no HTML
     
*/
CREATE TABLE IF NOT EXISTS usuarios ( 
	-- campo numérico (INT), comprimento (255 números) que aumenta automaticamente (auto_increment) e é chave primária (PK)
	usuarios_id INT(255) NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    -- campo de texto (VARCHAR), comprimento ( 255 caracteres ) e Obrigatório (NOT NULL)
    nome VARCHAR(255) NOT NULL
 );
 
/*-----------------------------------------
Inserindo dados na Tabela
-----------------------------------------*/ 
USE zedococo_bd;

INSERT INTO usuarios (
	nome,
    sobrenome,
    email,
    senha
) VALUES (
	"Maycon", 
    "Guerra",
    "maycon.aguerra@sp.senac.br",
    "1234"    
);

SELECT * FROM usuarios;

/*-----------------------------------------
Alterando dados na Tabela

No UPDATE é obrigatório usar o WHERE para evitar que mais de um registro seja alterado.
Sempre usando a PK (PRIMARY KEY) chave primária 

-----------------------------------------*/ 
USE zedococo_bd;
UPDATE usuarios SET senha =  MD5( "1234" )  WHERE id_usuarios = 1 ;


 
 -- Desenvolvido por Maycon Guerra
 
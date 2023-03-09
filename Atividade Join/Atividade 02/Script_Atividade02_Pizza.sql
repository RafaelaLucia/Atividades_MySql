CREATE DATABASE db_pizzaria_legal;
USE db_pizzaria_legal;

-- CRIACOES (DDL)

CREATE TABLE tb_pizzas(
   idPizza INT auto_increment PRIMARY KEY,
   sabor varchar(255) not null,
   preco decimal not null,
   Ingredientes varchar(300) not null,
   quantidadeFatias int not null,
   idCategoria int, 
   FOREIGN KEY (idCategoria) REFERENCES tb_categorias(idCategoria)
);

CREATE TABLE tb_categorias	(
    idCategoria int auto_increment PRIMARY KEY,
    descricaoCategoria varchar(255) NOT NULL,
    tempoPreparo varchar(255) not null
);

-- REGISTROS (DML)

INSERT INTO tb_categorias (descricaoCategoria, tempoPreparo) 
values ("Doce","15 minutos"),
       ("Salgada","25 minutos"),
       ("Vegetariana","28 minutos"),
       ("Especiais","30 minutos");
       
INSERT INTO tb_pizzas (sabor, preco, Ingredientes, quantidadeFatias, idCategoria)
values ("Mussarela", 37.00, "Mussarela e Tomate", 8, 2),
       ("Paulista", 47.00, "Mussarela, presunto, palmito, bacon e tomate", 8, 2),
       ("Romeu e Julieta", 25.00, "Creme de Leite, mussarela, goiabada e canela", 8, 1),
       ("Pizza da Casa", 52.00, "Mussarela, presunto, ervilha, palmito, ovos, catupiry, cebola e tomate", 8, 4),
       ("Toscana", 10.00, "Molho, mussarela, presunto, ovo, cebola, azeitona e orégano", 4, 2),
       ("Mix de Cogumelos", 49.00, "Molho de tomate fresco, cogumelos, shimeji, cebolinha picada, gergelim torrado, óregano, azeitona preta, pimenta biquinho", 8, 3),
       ("Marguerita", 62.00, "Molho, mussarela de castanha, tomate, manjericão,azeitona, orégano", 8, 3),
       ("Pizza Trem", 100.10, "4 Sabores: Mussarela, Calabresa, 4 queijos, Frango com catupiry - Serve 6 pessoas", 60, 4);
      
-- SELECTS (DQL)

 SELECT * FROM tb_pizzas;
 SELECT * FROM tb_categorias;

SELECT * FROM tb_pizzas WHERE preco > 45; -- pizzas com preço maior que 45 reais
SELECT * FROM tb_pizzas WHERE preco BETWEEN 50 AND 100; -- Pizzas com preço entre 50 e 100 reais
SELECT * FROM tb_pizzas WHERE sabor LIKE '%m%'; -- Procura sabores que possuam letra M em qualquer posição do nome
	
SELECT sabor, preco, Ingredientes, quantidadeFatias, descricaoCategoria, tempoPreparo from tb_pizzas 
INNER JOIN tb_categorias ON tb_pizzas.idCategoria = tb_categorias.idCategoria; -- Mostra todos os atributos


SELECT sabor, preco, Ingredientes, quantidadeFatias, descricaoCategoria, tempoPreparo from tb_pizzas 
INNER JOIN tb_categorias ON tb_pizzas.idCategoria = tb_categorias.idCategoria WHERE descricaoCategoria = 'Vegetariana'; -- Mostra todos os atributos somente das pizzas vegetarianas



       
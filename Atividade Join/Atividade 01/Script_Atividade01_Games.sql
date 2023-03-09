CREATE DATABASE db_generation_game_online;
USE db_generation_game_online;

-- CRIACOES (DDL)

CREATE TABLE tb_personagens(
   idPersonagem INT auto_increment PRIMARY KEY,
   nomePersonagem varchar(255) not null,
   QtdVida bigint not null,
   QtdMana bigint not null,
   nivel bigint not null,
   poderAtaque bigint not null,
   poderDefesa bigint not null,
   idClasse int, 
   FOREIGN KEY (idClasse) REFERENCES tb_classes(idClasse)
);

CREATE TABLE tb_classes(
    idClasse int auto_increment PRIMARY KEY,
    descricaoClasse varchar(255) NOT NULL,
    poderClasse varchar(255) NOT NULL
);

-- REGISTROS (DML)

INSERT INTO tb_classes (descricaoClasse, poderClasse) 
values ("Guerreiro","Golpe de Escudo: Bate seu escudo no chão causando dano em área"),
       ("Mago","Bola de Fogo: lança uma bola de fogo causando dano em área e queimando os inimigos durante um tempo"),
       ("Arqueiro","Chuva de Flechas: Atira várias flechas de uma vez causando dano em cada um dos inimigos"),
       ("Curandeiro","Poça de Cura: Lança diversas poças de cura no chão aumentando a vida dos aliados"),
       ("Necromante","Maldição Mortal: Amaldiçoa o inimigo causando dano progressivamente");
       
INSERT INTO tb_personagens (nomePersonagem, QtdVida, QtdMana, nivel, poderAtaque, poderDefesa, idClasse)
values ("Ragnar", 100, 50, 99, 2000, 2000, 1),
       ("Merlyn",50,100,26,900,1200,2),
       ("Lyra",90,20,21,2300,1200,3),
       ("Gaius",45,100,15,2100,1000,4),
       ("Morgath",95,90,29,500,900,5),
       ("Marius",90,10,31,800,1200,1),
       ("Amalia",85,25,15,900,800,3),
       ("Celestine",79,70,50,1100,800,5);
       
-- SELECTS (DQL)

SELECT * FROM tb_personagens WHERE poderAtaque > 2000; -- Poder de ataque maior que 2000
SELECT * FROM tb_personagens WHERE poderDefesa BETWEEN 1000 AND 2000; -- Poder de defesa entre 1000 e 2000
SELECT * FROM tb_personagens WHERE poderDefesa >= 1000 AND poderDefesa <= 2000;
SELECT * FROM tb_personagens WHERE nomePersonagem LIKE '%c%'; -- Procura nomes que possuam C em qualquer posição

SELECT nomePersonagem, QtdVida, QtdMana, nivel, poderAtaque, poderDefesa, descricaoClasse, poderClasse from tb_personagens 
INNER JOIN tb_classes ON tb_classes.idClasse = tb_personagens.idClasse; -- Mostra todos os atributos


SELECT nomePersonagem, QtdVida, QtdMana, nivel, poderAtaque, poderDefesa, descricaoClasse, poderClasse from tb_personagens 
INNER JOIN tb_classes ON tb_classes.idClasse = tb_personagens.idClasse WHERE descricaoClasse = 'Arqueiro'; -- Mostra todos os atributos dos arqueiros



       


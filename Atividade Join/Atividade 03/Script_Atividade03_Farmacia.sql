CREATE DATABASE db_farmacia_bem_estar;
USE db_farmacia_bem_estar;

-- CRIACOES (DDL)

CREATE TABLE tb_produtos(
   idProduto INT auto_increment PRIMARY KEY,
   nomeProduto varchar(255) not null,
   dataValidade date not null,
   marca varchar(255) not null,
   preco decimal not null,
   idCategoria int, 
   FOREIGN KEY (idCategoria) REFERENCES tb_categorias(idCategoria)
);

CREATE TABLE tb_categorias(
    idCategoria int auto_increment PRIMARY KEY,
    descricaoCategoria varchar(255) NOT NULL,
    composicao varchar(255) NOT NULL
);

-- REGISTROS (DML)

INSERT INTO tb_categorias (descricaoCategoria, composicao) 
values ("Anti-Hipertensivos","Inibidores de ECA, Bloqueadores de receptores da angiotensina II"),
       ("Antidiabéticos","Metformina, Sulfonilureias, inibidores de DPP-4"),
       ("Dor e Febre","Analgésico e antipirético paracetamol/acetaminofeno"),
       ("Antialérgicos","Corticosteroides,Anti-histamínicos, Descongestionantes"),
       ("Medicamentos Especiais","Quimioterapia,Radioterapia, Terapia alvo");
       
INSERT INTO tb_produtos (nomeProduto, dataValidade, marca, preco, idCategoria)
values ("Benicar Anlo", '2025-01-23', "Daiichi Sankyo", 65.99, 1),
       ("Xigduo XR", '2024-04-19', "AstraZeneca", 183.69, 2),
       ("Dorflex Sanofi", '2023-12-18', "Dorflex", 24.60, 3),
       ("Dipirona Sódica 1g", '2023-06-02', "neo quimica", 13.99, 3),
       ("Glimatin 100mg", '2024-05-20', "Ems", 10329.02, 5),
       ("Loratamed", '2024-05-14', "CIMED", 11.19, 4),
       ("Vesanoid Melora", '2025-09-01', "FQM", 1689.00, 5),
       ("Succinato de Metroprolol", '2024-03-03', "Medley", 14.49, 1);
       
-- SELECTS (DQL)

SELECT * FROM tb_produtos WHERE preco > 50; -- preço maior que R$50,00
SELECT * FROM tb_produtos WHERE preco BETWEEN 5 AND 60; -- preço entre 5 e 60
SELECT * FROM tb_produtos WHERE nomeProduto LIKE '%c%'; -- nome do produto que possua C no nome em qualquer posição

SELECT nomeProduto, dataValidade, marca, preco, descricaoCategoria, composicao from tb_produtos 
INNER JOIN tb_categorias ON tb_categorias.idCategoria = tb_produtos.idCategoria; -- Mostra todos os atributos


SELECT nomeProduto, dataValidade, marca, preco, descricaoCategoria, composicao from tb_produtos 
INNER JOIN tb_categorias ON tb_categorias.idCategoria = tb_produtos.idCategoria WHERE descricaoCategoria = 'Dor e Febre'; -- Mostra todos os atributos dos remédios para dor e febre



       
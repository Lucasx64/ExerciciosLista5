-- Exercicios - Lista 5

--Exercício 1 — Qual comando DDL usar? Para cada situação, diga qual comando resolve (CREATE, ALTER ou DROP) e com qual complemento:

--Criar o banco Loja.
CREATE DATABASE Loja;
----Criar a tabela PRODUTO.
CREATE TABLE PRODUTO
----Guardar o estoque do produto, que ninguém lembrou de colocar.
ALTER TABLE PRODUTO ADD ESTOQUE INT
----O nome do produto não cabe em VARCHAR(50); precisa de VARCHAR(100).
ALTER TABLE PRODUTO ADD 
----Impedir preço negativo numa tabela que já existe.
ALTER TABLE PRODUTO ADD CONSTRAINT chk_preco_negativo CHECK (preco <= 0)
----A coluna observacao não é mais usada.
ALTER TABLE PRODUTO DROP COLUMN Observacao
----A tabela PRODUTO inteira não é mais necessária.
--DROP TABLE PRODUTO


--Exercício 2 — Encontre os erros. O script abaixo tem 5 erros. Encontre e corrija:

CREATE TABLE PRODUTO (
    codigo INT NULL,  -- <- Primeiro erro - deve ser NOT NULL
    descricao VARCHAR(100) NOT NULL, -- <- adicionar a virgula no final do NOT NULL
    preco DECIMAL(10,2) NOT NULL,
    CONSTRAINT PK_PRODUTO PRIMARY KEY (codigo),
);

CREATE TABLE VENDA (
    numero INT NOT NULL PRIMARY KEY,
    codigo_produto VARCHAR(10) NOT NULL, -- <- Segundo erro - deve ser INT ao inves de VARCHAR
    CONSTRAINT FK_VENDA_PRODUTO FOREIGN KEY (codigo_produto) REFERENCES PRODUTOS (codigo) -- <-PRODUTO deve ser no singular
);


--**Exercício 3 — ALTER TABLE.** No banco Escola, escreva os comandos para:

Use Escola;

--1. Adicionar a coluna **cpf** CHAR(11) NULL em ALUNO.
ALTER TABLE ALUNO ADD cpf CHAR(11) NULL;
--2. Garantir que o cpf do aluno não se repita.
ALTER TABLE ALUNO ADD CONSTRAINT UQ_ALUNO_CPF UNIQUE (cpf);
--3. Aumentar o nome do curso para VARCHAR(120).
ALTER TABLE CURSO ALTER COLUMN nome VARCHAR(120) NOT NULL;
--4. Garantir que a data_nascimento do aluno seja menor que a data de hoje.
ALTER TABLE ALUNO ADD CONSTRAINT CK_data_nascimento CHECK (data_nascimento < GETDATE());
--5. Remover a coluna cpf.
ALTER TABLE ALUNO DROP CONSTRAINT UQ_ALUNO_CPF;
ALTER TABLE ALUNO DROP COLUMN cpf;







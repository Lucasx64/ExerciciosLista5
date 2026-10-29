-- criar o banco
create database Escola;
-- acessar o banco
use Escola;

--Criar tabelas

create table ALUNO(
	matricula int primary key,
	nome varchar(50) not null,
	data_nascimento date not null,
	email varchar(100) not null,
	Constraint UQ_Aluno_Email unique (email) -- n�o permite emails duplicados
	-- UQ_Aluno_Email nome da restri��o
	-- UNIQUE - Unico
	--(email) coluna que recebe a restri��o
);

create table PROFESSOR(
registro_professor int primary key,
nome varchar(50) not null,
email varchar(100) not null unique, -- nao permite emails duplicados FORMA 1
--constraint UQ_Professor_Aluno unique (email) -- n�o permite emails duplicados FORMA 2

);

CREATE TABLE CURSO(
	codigo_curso int primary key,
	nome varchar(50) not null unique,
	carga_horaria smallint not null,
	registro_professor int not null,
	constraint fk_curso_aluno foreign key (registro_professor)
	references ALUNO(matricula),

	-- aceita o registro somente se carga horaria for maior que zero
	constraint ck_curso_carga CHECK (carga_horaria > 0)
);


---COMANDO PARA CONFERIR A ESTRUTURA
--EXEC sp_help 'CURSO';

CREATE TABLE MATRICULA(
	matricula_aluno int primary key,
	codigo_curso int not null,
	data_matricula datetime DEFAULT GETDATE(),

	CONSTRAINT fk_matricula_codigo_curso FOREIGN KEY (codigo_curso)
	REFERENCES CURSO (codigo_curso)

);

CREATE TABLE ESPECIALIDADE_PROFESSOR(
	registro_professor int not null,
	especialidade varchar(50) not null,

	constraint pk_especialidade_professor
	primary key (registro_professor, especialidade),
	
	constraint fk_especialidade_professor
	foreign key (registro_professor)
	references PROFESSOR(registro_professor)

);

Use Escola;
GO

-- Aula DDL ( CREATE, ALTER, DROP )
-- Aula DML ( INSERT, UPDATE, DELETE )


INSERT INTO PROFESSOR (registro_professor, nome, email)
VALUES ( 1030, 'Lucas', 'lucas@gmail.com'),
       ( 1040, 'Vinio', 'vinio@gmail.com'),
	   ( 1050, 'Guilherme', 'guilherme@gmail.com')


-- Exibir dados da tabela
-- select * from professor
-- * = todas as colunas

select * from PROFESSOR

INSERT INTO ESPECIALIDADE_PROFESSOR (registro_professor, especialidade)  -- <-- Não é permitido que se repita uma PK.
VALUES (1040, 'C#')

SELECT * FROM ESPECIALIDADE_PROFESSOR


-- Apagar dados

DELETE FROM PROFESSOR WHERE registro_professor = 1030 -- <- vai dar erro pois não é permitido apagar coluna pai sem antes excluir as filhas.

-- Atualizar dados

UPDATE PROFESSOR SET nome = 'Lucas Aragão' -- <- Está errado, pois irá alterar o nome de todas as colunas. Necessário utilizar WHERE.


SELECT * FROM PROFESSOR

ROLLBACK -- <- Para desfazer codigos inseridos de forma erronea.

COMMIT -- <- Para fechar o banco.


UPDATE PROFESSOR SET nome = 'Guilherme da Silva' WHERE registro_professor = 1050 -- <- Corrigindo
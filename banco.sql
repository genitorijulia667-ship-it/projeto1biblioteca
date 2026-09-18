CREATE DATABASE biblioteca_1ano;
USE biblioteca_1ano;
CREATE TABLE aluno (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    serie VARCHAR(20) NOT NULL,
    turma VARCHAR(20) NOT NULL,
    telefone VARCHAR(20)
);
CREATE TABLE livro (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    categoria VARCHAR(50),
    status VARCHAR(20) NOT NULL DEFAULT 'Disponível'
);
CREATE TABLE professor (
    id_professor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL);
    CREATE TABLE bibliotecario (
    id_bibliotecario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL
);
CREATE TABLE emprestimo (
    id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT,
    id_livro INT,
    id_bibliotecario INT,
    data_emprestimo DATE NOT NULL,
    data_prevista_devolucao DATE NOT NULL,
    data_devolucao DATE,
    status VARCHAR(20) NOT NULL DEFAULT 'Emprestado',


    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
    FOREIGN KEY (id_livro) REFERENCES livro(id_livro),
    FOREIGN KEY (id_bibliotecario) REFERENCES bibliotecario(id_bibliotecario)
);
CREATE TABLE usuario (


    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(100) NOT NULL,
    perfil VARCHAR(30) NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'Ativo',
    id_aluno INT NOT NULL,
    id_professor INT NOT NULL,
    id_bibliotecario INT NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
    FOREIGN KEY (id_professor ) REFERENCES professor(id_professor ),
    FOREIGN KEY (id_bibliotecario) REFERENCES bibliotecario(id_bibliotecario)


);
INSERT INTO aluno(nome, serie, turma, telefone) 
VALUES("Murilo", "1 ANO", '1B', '4002-8922'),
('Sâmela', '1 ANO', '1B', '9293-9900'),
('Lucas', '1 ANO', '1B', '8880-4499'),
('Júlia', '1 ANO', '1B', '9939-4000'),
('Beatriz', '1 ANO', '1B', 9915-6110);

INSERT INTO bibliotecario(nome, email)
VALUES('Cláudia','ClaudiaCEMAP@escola.pr.gov.br'),
('Jéssica','Jessicabiblioteca@escola.pr.gov.br'),
('Ruan','RuanFazTudo@escola.pr.gov.br'),
('Lígia','Lígia@escola.pr.gov.br'),
('Cleres','Cleres_Mansano@escola.pr.gov.br');


INSERT INTO livro(titulo, autor, categoria, status)
VALUES('Percy Jackson E O Ladrão de Raios','Rick Riordan','fantasia juvenil','Dísponivel'),
('Percy Jackson E O Mar de Monstros', 'Rick Riordan', 'fantasia juvenil', 'Emprestado'),
('Percy Jackson A Maldição do Titã','Rick Riordan','fantasia juvenil','Em Atraso'),
('Pavores da Fazbear Mergulho na escuridão','Scott Cawthon','terror','Dísponivel'),
('Pavores da Fazbear 4:35AM', 'Scott Cawthon', 'terror', 'Emprestado');

INSERT INTO professor(nome, telefone, email)
VALUES('Cláudia','9924-5464','ClaudiaCEMAP@escola.pr.gov.br'),
('Rodrigo', '7754-6575', 'Rodrigo.Dias@escola.pr.gov.br'),
('Nayara','9430-6423','Nay.Oliveira@gmail.com'),
('Ronaldo','4325-4323','Ronaldo@escola.pr.gov.br'),
('Tyago', '4354-5464', 'Tyago@escola.pr.gov.br');

SELECT * FROM professor;


INSERT INTO usuario (nome, email, senha, perfil, status, id_aluno, id_professor, id_bibliotecario)
VALUES 
('Cláudia', 'ClaudiaCEMAP@escola.pr.gov.br', 'senha123', 'Professor', 'Ativo', 1, 1, 1),
('Rodrigo', 'Rodrigo.Dias@escola.pr.gov.br', 'senha123', 'Professor', 'Ativo', 1, 2, 1),
('Nayara', 'Nay.Oliveira@gmail.com', 'senha123', 'Professor', 'Ativo', 1, 3, 1),
('Ronaldo', 'Ronaldo@escola.pr.gov.br', 'senha123', 'Professor', 'Ativo', 1, 4, 1),
('Tyago', 'Tyago@escola.pr.gov.br', 'senha123', 'Professor', 'Ativo', 1, 5, 1);

INSERT INTO emprestimo (id_aluno, id_livro, id_bibliotecario, data_emprestimo, data_prevista_devolucao, data_devolucao, status)
VALUES ('1','2', '3', '2026-07-09', '2026-08-09', '2026-08-09', 'devolvido'),
('2','1','3', '2026-08-07', '2026-09-07', '2026-09-03', 'devolvido'),
('3','4', '3', '2026-07-09', '2026-08-09', '2026-08-09', 'devolvido'),
('4','5', '2', '2026-07-07', '2026-08-07', '2026-08-09', 'devolvido atrasado'),
('1','2', '3', '2026-07-07', '2026-08-08', '2026-08-08', 'devolvido');

CREATE USER 'biblioteca_user1'@'localhost' IDENTIFIED BY 'projeto1';
GRANT ALL PRIVILEGES
ON biblioteca_1ano.*
TO 'biblioteca_user1'@'localhost';
FLUSH PRIVILEGES;
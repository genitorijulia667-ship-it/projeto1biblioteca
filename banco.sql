CREATE DATABASE IF NOT EXISTS biblioteca_1ano;

USE biblioteca_1ano;

CREATE TABLE IF NOT EXISTS aluno (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    serie VARCHAR(20) NOT NULL,
    turma VARCHAR(20) NOT NULL,
    telefone VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS bibliotecario (
    id_bibliotecario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS professor (
    id_professor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS livro (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    categoria VARCHAR(80) NOT NULL,
    status VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS emprestimo (
    id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT NOT NULL,
    id_livro INT NOT NULL,
    id_bibliotecario INT NOT NULL,
    data_emprestimo DATE NOT NULL,
    data_prevista DATE NOT NULL,
    data_devolucao DATE,
    status VARCHAR(30) NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
    FOREIGN KEY (id_livro) REFERENCES livro(id_livro),
    FOREIGN KEY (id_bibliotecario) REFERENCES bibliotecario(id_bibliotecario)
);

CREATE TABLE IF NOT EXISTS usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    senha VARCHAR(100) NOT NULL,
    perfil VARCHAR(30) NOT NULL,
    status VARCHAR(30) NOT NULL,
    id_aluno INT,
    id_professor INT,
    id_bibliotecario INT,
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
    FOREIGN KEY (id_professor) REFERENCES professor(id_professor),
    FOREIGN KEY (id_bibliotecario) REFERENCES bibliotecario(id_bibliotecario)
);

INSERT INTO aluno (nome, serie, turma, telefone) VALUES
('Ana Souza', '1º Ano', 'A', '41999990001'),
('Bruno Lima', '1º Ano', 'B', '41999990002'),
('Carlos Oliveira', '1º Ano', 'A', '41999990003'),
('Daniela Santos', '1º Ano', 'C', '41999990004'),
('Eduardo Costa', '1º Ano', 'B', '41999990005');

INSERT INTO bibliotecario (nome, email) VALUES
('Mariana Silva', 'mariana@escola.com'),
('João Pereira', 'joao@escola.com'),
('Fernanda Alves', 'fernanda@escola.com'),
('Ricardo Martins', 'ricardo@escola.com'),
('Patricia Gomes', 'patricia@escola.com');

INSERT INTO professor (nome, telefone, email) VALUES
('Carlos Mendes', '41988880001', 'carlos@escola.com'),
('Juliana Rocha', '41988880002', 'juliana@escola.com'),
('Marcos Ferreira', '41988880003', 'marcos@escola.com'),
('Renata Alves', '41988880004', 'renata@escola.com'),
('Paulo Souza', '41988880005', 'paulo@escola.com');

INSERT INTO livro (titulo, autor, categoria, status) VALUES
('Dom Casmurro', 'Machado de Assis', 'Literatura', 'Disponível'),
('O Pequeno Príncipe', 'Antoine de Saint-Exupéry', 'Literatura', 'Emprestado'),
('Harry Potter e a Pedra Filosofal', 'J.K. Rowling', 'Fantasia', 'Disponível'),
('O Cortiço', 'Aluísio Azevedo', 'Literatura', 'Emprestado'),
('Aventuras de Sherlock Holmes', 'Arthur Conan Doyle', 'Mistério', 'Disponível');

INSERT INTO emprestimo (id_aluno, id_livro, id_bibliotecario, data_emprestimo, data_prevista, data_devolucao, status) VALUES
(1, 2, 1, '2026-08-01', '2026-08-15', NULL, 'Em andamento'),
(2, 4, 2, '2026-08-03', '2026-08-17', NULL, 'Em andamento'),
(3, 1, 3, '2026-07-20', '2026-08-03', '2026-08-02', 'Devolvido'),
(4, 3, 4, '2026-07-25', '2026-08-08', '2026-08-07', 'Devolvido'),
(5, 5, 5, '2026-08-05', '2026-08-19', NULL, 'Em andamento');

INSERT INTO usuario (nome, email, senha, perfil, status, id_aluno, id_professor, id_bibliotecario) VALUES
('Ana Souza', 'ana@escola.com', '123456', 'aluno', 'Ativo', 1, NULL, NULL),
('Bruno Lima', 'bruno@escola.com', '123456', 'aluno', 'Ativo', 2, NULL, NULL),
('Carlos Mendes', 'carlos@escola.com', '123456', 'professor', 'Ativo', NULL, 1, NULL),
('Juliana Rocha', 'juliana@escola.com', '123456', 'professor', 'Ativo', NULL, 2, NULL),
('Mariana Silva', 'mariana@escola.com', '123456', 'bibliotecario', 'Ativo', NULL, NULL, 1);

SELECT * FROM aluno;

SELECT * FROM bibliotecario;

SELECT * FROM professor;

SELECT * FROM livro;

SELECT * FROM emprestimo;

SELECT * FROM usuario;



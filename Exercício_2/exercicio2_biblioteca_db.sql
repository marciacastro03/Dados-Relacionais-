-- Limpar se já existir algo
DROP TABLE IF EXISTS emprestimos;
DROP TABLE IF EXISTS livros;

-- Criar tabelas
CREATE TABLE livros (
    id_livro       SERIAL PRIMARY KEY,
    titulo         VARCHAR(150) NOT NULL,
    autor          VARCHAR(100),
    categoria      VARCHAR(50),
    ano_publicacao INT
);

CREATE TABLE emprestimos (
    id_emprestimo   SERIAL PRIMARY KEY,
    nome_aluno      VARCHAR(100),
    id_livro        INT REFERENCES livros(id_livro),
    data_emprestimo DATE
);

-- 6 livros
INSERT INTO livros (titulo, autor, categoria, ano_publicacao) VALUES
('Banco de Dados Relacionais', 'Aldo Lima',     'Tecnologia', 2021),
('Dados e Decisões',           'Ana Carvalho',  'Negócios',   2019),
('Python para Dados',          'Andre Müller',  'Tecnologia', 2022),
('Machine Learning Essencial', 'Beatriz Costa', 'Tecnologia', 2023),
('Análise Estatística',        'Carlos Mendes', 'Ciências',   2020),
('Introdução à IA',            'Artur Neves',   'Tecnologia', 2024);

-- 5 empréstimos
INSERT INTO emprestimos (nome_aluno, id_livro, data_emprestimo) VALUES
('Ana Lima',    1, '2025-03-01'),
('Bruno Melo',  2, '2025-03-05'),
('Carla Souza', 3, '2025-03-10'),
('Diego Rocha', 4, '2025-03-15'),
('Elisa Nunes', 5, '2025-03-20');

-- 5a: livros com "dados" no título
SELECT * FROM livros
WHERE titulo ILIKE '%dados%';

-- 5b: livros cujo autor começa com A
SELECT * FROM livros
WHERE autor LIKE 'A%';

-- 5c e 5d: codigo_livro + ordenado alfabeticamente
SELECT
    titulo,
    autor,
    ano_publicacao,
    UPPER(SUBSTRING(titulo FROM 1 FOR 3)) || '_' || ano_publicacao AS codigo_livro
FROM livros
ORDER BY titulo;
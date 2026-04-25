-- =============================================
-- ETAPA 1 e 2 — LIMPEZA, CRIAÇÃO DO AMBIENTE e INSERÇÃO DE DADOS (DML)
-- Antes de qualquer coisa, garantimos que o
-- ambiente está limpo. O DROP ele remove tabelas
-- anteriores para evitar conflitos.
-- Com a estrutura criada, populamos as tabelas.
-- A ordem importa: categorias e produtos antes
-- de pedidos, pois pedidos referencia ambos.
-- =============================================

-- Limpeza do ambiente
DROP TABLE IF EXISTS itens_pedido, pedidos, vendedores, produtos, categorias, clientes;

-- Tabelas Iniciais
CREATE TABLE categorias (
    id_categoria SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE produtos (
    id_produto SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2),
    id_categoria INTEGER,
    estoque INTEGER DEFAULT 0
);

CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    cidade VARCHAR(50)
);

CREATE TABLE vendedores (
    id_vendedor SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    setor VARCHAR(50)
);

CREATE TABLE pedidos (
    id_pedido SERIAL PRIMARY KEY,
    id_cliente INTEGER,
    id_vendedor INTEGER,
    id_produto INTEGER,
    data_pedido DATE DEFAULT CURRENT_DATE,
    valor_total DECIMAL(10, 2)
);

-- Inserção de Dados
INSERT INTO categorias (nome) VALUES ('Hardware'), ('Periféricos'), ('Software'), ('Móveis Office');

INSERT INTO produtos (nome, preco, id_categoria, estoque) VALUES 
('Processador i9', 3200.00, 1, 12), ('Placa de Vídeo RTX', 4500.00, 1, 5),
('Monitor 27', 1500.00, 2, 20), ('Teclado Mecânico', 450.00, 2, 0),
('Windows 11 Pro', 800.00, 3, 100), ('Office 365', 350.00, 3, 50),
('Mesa Gamer', 1200.00, 4, 8), ('Cadeira Ergonômica', 1800.00, 4, 3);

INSERT INTO clientes (nome, email, cidade) VALUES 
('Ana Silva', 'ana.silva@email.com', 'São Paulo'),
('Bruno Oliveira', 'bruno.o@outlook.com', 'Curitiba'),
('Carla Dias', 'carla.dias@gmail.com', 'Fortaleza'),
('Diego Souza', 'diego.vendas@empresa.com', 'São Paulo'), -- Cliente que também é vendedor
('Elena Ferrante', 'elena.f@gmail.com', 'Belo Horizonte');

INSERT INTO vendedores (nome, email, setor) VALUES 
('Diego Souza', 'diego.vendas@empresa.com', 'Hardware'),
('Fabio Santos', 'fabio.s@empresa.com', 'Periféricos'),
('Gisele Bündchen', 'gisele.b@empresa.com', 'Móveis');

INSERT INTO pedidos (id_cliente, id_vendedor, id_produto,data_pedido, valor_total) VALUES 
(1, 1, 3,'2024-03-01', 7700.00), (1, 2,1, '2024-03-05', 450.00),
(2, 1, 3,'2024-03-10', 3200.00), (3, 3,2, '2024-03-12', 1200.00),
(3, 2, 3,'2024-03-15', 1500.00);

-- =============================================
-- ETAPA 3 — QUESTÃO 5: RESTRIÇÕES (DDL)
-- As restrições são aplicadas ANTES dos testes
-- da questão 6. Sem essa etapa, o banco aceitaria
-- dados inválidos e o CASCADE não funcionaria.
-- =============================================

-- E-mail de clientes não pode ser nulo
ALTER TABLE clientes 
    ALTER COLUMN email SET NOT NULL;

-- Preço de produtos nunca negativo
ALTER TABLE produtos 
    ADD CONSTRAINT chk_preco_positivo 
    CHECK (preco >= 0);

-- Foreign Key em pedidos → clientes com ON DELETE CASCADE
ALTER TABLE pedidos 
    ADD CONSTRAINT fk_pedidos_clientes 
    FOREIGN KEY (id_cliente) 
    REFERENCES clientes(id_cliente) 
    ON DELETE CASCADE;

-- =============================================
-- ETAPA 4 — QUESTÃO 2: RELACIONAMENTO E AGREGAÇÃO
-- JOIN liga pedidos → produtos → categorias.
-- COUNT DISTINCT conta produtos únicos por categoria.
-- HAVING filtra grupos com receita acima de R$ 2.000.
-- =============================================

SELECT 
    c.nome                        AS categoria,
    COUNT(DISTINCT p.id_produto)  AS qtd_produtos_vendidos,
    SUM(pe.valor_total)           AS receita_total
FROM pedidos pe
JOIN produtos p    ON p.id_produto   = pe.id_produto
JOIN categorias c  ON c.id_categoria = p.id_categoria
GROUP BY c.nome
HAVING SUM(pe.valor_total) > 2000
ORDER BY receita_total DESC;

-- =============================================
-- ETAPA 5 — QUESTÃO 3: SUBCONSULTA
-- A subconsulta interna calcula a média de preços.
-- A consulta externa retorna apenas os produtos
-- cujo preço está acima dessa média.
-- =============================================

	SELECT nome, preco
FROM produtos
WHERE preco > (
    SELECT AVG(preco) FROM produtos
);

-- =============================================
-- ETAPA 6 — QUESTÃO 4: OPERAÇÕES DE CONJUNTOS
-- UNION: une os dois resultados sem duplicatas.
-- INTERSECT: retorna apenas o que existe nos dois.
-- EXCEPT: retorna o que existe no primeiro
--         mas não no segundo.
-- =============================================

-- Todos os e-mails sem duplicatas
SELECT email FROM clientes
UNION
SELECT email FROM vendedores;

-- E-mails que são clientes E vendedores ao mesmo tempo
SELECT email FROM clientes
INTERSECT
SELECT email FROM vendedores;

-- Clientes que nunca compraram
SELECT id_cliente FROM clientes
EXCEPT
SELECT id_cliente FROM pedidos;

-- =============================================
-- ETAPA 7 — QUESTÃO 6: VALIDAÇÃO DAS RESTRIÇÕES
-- Cada bloco deve ser executado separadamente.
-- O erro de um bloco interrompe os seguintes
-- se executados juntos — isso é comportamento
-- esperado e comprova que as restrições funcionam.
-- =============================================

-- Preço negativo (deve dar erro de CHECK)
INSERT INTO produtos (nome, preco, id_categoria)
VALUES ('Produto Teste', -10.00, 1);

-- Cliente sem e-mail (deve dar erro de NOT NULL)
INSERT INTO clientes (nome, email, cidade)
VALUES ('Teste Sem Email', NULL, 'Fortaleza');

-- Deletar cliente e verificar CASCADE
-- Passo 1: confirme que existem pedidos do cliente 1
SELECT * FROM pedidos WHERE id_cliente = 1;

-- Passo 2: delete o cliente
DELETE FROM clientes WHERE id_cliente = 1;

-- Passo 3: confirme que os pedidos sumiram automaticamente
SELECT * FROM pedidos WHERE id_cliente = 1;
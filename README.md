# 🐘 Dados Relacionais

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-18-336791?style=for-the-badge&logo=postgresql&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-DDL%20%7C%20DML%20%7C%20DQL-blue?style=for-the-badge&logo=databricks&logoColor=white)
![Status](https://img.shields.io/badge/Status-Em%20andamento-yellow?style=for-the-badge)
![Instituição](https://img.shields.io/badge/Pós--UNIFOR-MBA%20em%20Data%20Science-red?style=for-the-badge)

> Repositório da disciplina de **Banco de Dados Relacionais** do MBA em Ciência de Dados — Pós-UNIFOR.  
> Desenvolvido com PostgreSQL 18 e pgAdmin 4.

---

## 📚 Sobre o Repositório

Este repositório reúne os exercícios práticos desenvolvidos ao longo da disciplina, com foco na aplicação dos principais conceitos de bancos de dados relacionais: modelagem, linguagem SQL, integridade referencial e boas práticas de projeto.

---

## 🗂️ Estrutura do Repositório

```
Dados-Relacionais/
├── Exercício_1/        # DDL e DML básico
├── Exercício_2/        # Agregações e GROUP BY
├── Exercício_3/        # Consultas avançadas, restrições e validações
└── README.md
```

---

## 📝 Exercícios

### 📁 Exercício 1 — DDL e DML Básico

Introdução prática à linguagem SQL com foco na criação e manipulação de estruturas de banco de dados.

**Conteúdos abordados:**
- `CREATE TABLE` — criação de tabelas com tipos de dados e constraints básicas
- `INSERT INTO` — inserção de registros
- `UPDATE` — atualização de dados existentes
- `DELETE` — remoção de registros
- Diferença entre **DDL** (Data Definition Language) e **DML** (Data Manipulation Language)
- Ordem de criação de objetos e dependências entre tabelas

**Ferramentas:** PostgreSQL 18 · pgAdmin 4

---

### 📁 Exercício 2 — Agregações e GROUP BY

Exploração das funções de agregação do SQL para geração de relatórios e análises consolidadas.

**Conteúdos abordados:**
- `COUNT`, `SUM`, `AVG`, `MAX`, `MIN` — funções de agregação
- `GROUP BY` — agrupamento de resultados por categoria
- `HAVING` — filtragem de grupos agregados (diferença com `WHERE`)
- `ORDER BY` — ordenação de resultados
- Combinação de agregações com `JOIN` entre múltiplas tabelas

**Ferramentas:** PostgreSQL 18 · pgAdmin 4

---

### 📁 Exercício 3 — Consultas Avançadas, Restrições e Validações

Exercício completo cobrindo desde relacionamentos complexos até implementação e validação de integridade referencial.

**Conteúdos abordados:**

| Questão | Tema | Conceitos |
|---|---|---|
| Q2 | Relacionamento e Agregação | `JOIN` em cadeia, `COUNT DISTINCT`, `SUM`, `HAVING` |
| Q3 | Subconsultas | Subquery com `AVG` na cláusula `WHERE` |
| Q4 | Operações de Conjuntos | `UNION`, `INTERSECT`, `EXCEPT` |
| Q5 | Implementação de Restrições | `NOT NULL`, `CHECK`, `FOREIGN KEY`, `ON DELETE CASCADE` |
| Q6 | Validação das Restrições | Testes de integridade e comportamento do CASCADE |

**Modelo de dados:**
```
categorias ──< produtos ──< pedidos >── clientes
                                  └──> vendedores
```

**Ferramentas:** PostgreSQL 18 · pgAdmin 4

---

## 🛠️ Tecnologias Utilizadas

| Tecnologia | Versão | Uso |
|---|---|---|
| PostgreSQL | 18 | SGBD principal |
| pgAdmin | 4 | Interface de gerenciamento |
| Git | — | Versionamento do código |
| GitHub | — | Hospedagem do repositório |

---

## 🚀 Como Executar

1. Instale o [PostgreSQL](https://www.postgresql.org/download/)
2. Abra o **pgAdmin 4** e conecte ao servidor local
3. Crie um banco de dados (ex: `exercicios_sql`)
4. Abra o **Query Tool**
5. Cole e execute os scripts `.sql` de cada exercício na ordem indicada

> ⚠️ **Atenção:** sempre execute o script inicial antes das questões, e as restrições (Questão 5) antes dos testes de validação (Questão 6).

---

## 👩‍🎓 Autora

**Marcia Castro**  
MBA em Ciência de Dados · Pós-UNIFOR  
[![GitHub](https://img.shields.io/badge/GitHub-marciacastro03-181717?style=flat&logo=github)](https://github.com/marciacastro03)

---

## 📄 Licença

Este repositório é de uso acadêmico, desenvolvido para fins educacionais no âmbito do MBA em Ciência de Dados da Pós-UNIFOR.

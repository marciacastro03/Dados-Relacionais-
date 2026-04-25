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
├── Exercício_1/        # JOINs, GROUP BY e CASE — Sistema Escolar
├── Exercício_2/        # Funções de String, LIKE e Agregações — Biblioteca
├── Exercício_3/        # Consultas avançadas, restrições e validações
└── README.md
```

---

## 📝 Exercícios

### 📁 Exercício 1 — JOINs, GROUP BY e CASE | Sistema Escolar

Exercício prático com um sistema de matrículas escolares, explorando a junção de tabelas e análise de desempenho por disciplina.

**Modelo de dados:**
```
alunos ──< matriculas >── disciplinas
```

**Conteúdos abordados:**

| Parte | Tema | Descrição |
|---|---|---|
| Parte 1 | INNER JOIN | Relaciona alunos, matrículas e disciplinas em uma única consulta ordenada por nota |
| Parte 2 | GROUP BY + CASE | Agrupa por disciplina calculando média, maior e menor nota, classificando o desempenho da turma |

**Destaques do script:**
- `INNER JOIN` em cadeia: `matriculas → alunos` e `matriculas → disciplinas`
- `COUNT`, `AVG`, `MAX`, `MIN` combinados com `GROUP BY`
- `CASE WHEN` para classificação automática: `EXCELENTE`, `BOM` ou `ATENÇÃO`
- `ROUND` para arredondar médias com 2 casas decimais

**Ferramentas:** PostgreSQL 18 · pgAdmin 4

---

### 📁 Exercício 2 — Funções de String, LIKE e Agregações | Biblioteca

Exercício com sistema de biblioteca e empréstimos, explorando busca textual e manipulação de strings.

**Modelo de dados:**
```
livros ──< emprestimos
```

**Conteúdos abordados:**

| Questão | Tema | Descrição |
|---|---|---|
| 5a | ILIKE | Busca livros com "dados" no título, sem distinção de maiúsculas/minúsculas |
| 5b | LIKE | Filtra autores cujo nome começa com a letra "A" |
| 5c/5d | Funções de String | Gera código do livro combinando `UPPER`, `SUBSTRING` e concatenação com `\|\|` |

**Exemplo do código gerado:**
```sql
UPPER(SUBSTRING(titulo FROM 1 FOR 3)) || '_' || ano_publicacao AS codigo_livro
-- Resultado: 'BAN_2021', 'DAD_2019', 'PYT_2022'...
```

**Destaques do script:**
- `ILIKE` para busca case-insensitive (diferencial do PostgreSQL)
- `LIKE` com padrão `'A%'` para filtro por inicial
- Concatenação de strings com `||`
- `SUBSTRING` para extrair os 3 primeiros caracteres do título
- `ORDER BY` alfabético para organização do resultado

**Ferramentas:** PostgreSQL 18 · pgAdmin 4

---

### 📁 Exercício 3 — Consultas Avançadas, Restrições e Validações | Sistema de Vendas

Exercício completo cobrindo desde relacionamentos complexos até implementação e validação de integridade referencial em um sistema de vendas de produtos de tecnologia.

**Modelo de dados:**
```
categorias ──< produtos ──< pedidos >── clientes
                                  └──> vendedores
```

**Conteúdos abordados:**

| Questão | Tema | Conceitos |
|---|---|---|
| Q2 | Relacionamento e Agregação | `JOIN` em cadeia, `COUNT DISTINCT`, `SUM`, `HAVING` |
| Q3 | Subconsultas | Subquery com `AVG` na cláusula `WHERE` |
| Q4 | Operações de Conjuntos | `UNION`, `INTERSECT`, `EXCEPT` |
| Q5 | Implementação de Restrições | `NOT NULL`, `CHECK`, `FOREIGN KEY`, `ON DELETE CASCADE` |
| Q6 | Validação das Restrições | Testes de integridade e comportamento do CASCADE |

**Destaques do script:**
- `HAVING` para filtrar categorias com receita acima de R$ 2.000,00
- Subconsulta aninhada para comparar preço com a média geral
- `INTERSECT` para identificar pessoas que são clientes e vendedores simultaneamente
- `ON DELETE CASCADE` removendo pedidos automaticamente ao deletar um cliente

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
5. Cole e execute os scripts `.sql` de cada exercício

> ⚠️ **Atenção para o Exercício 3:** execute sempre o script inicial primeiro, depois as restrições (Questão 5) e por último os testes de validação (Questão 6).

---

## 📊 Conceitos Consolidados

```
Exercício 1 → JOIN + GROUP BY + CASE WHEN
Exercício 2 → LIKE + ILIKE + Funções de String
Exercício 3 → Subconsultas + Conjuntos + Restrições + CASCADE
```

---

## 👩‍🎓 Autora

**Marcia Castro**  
MBA em Ciência de Dados · Pós-UNIFOR  
[![GitHub](https://img.shields.io/badge/GitHub-marciacastro03-181717?style=flat&logo=github)](https://github.com/marciacastro03)

---

## 📄 Licença

Este repositório é de uso acadêmico, desenvolvido para fins educacionais no âmbito do MBA em Ciência de Dados da Pós-UNIFOR.

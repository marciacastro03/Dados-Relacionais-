-- PARTE 1: JOIN
SELECT
    a.nome,
    a.curso,
    d.nome_disciplina AS disciplina,
    m.nota,
    m.situacao
FROM matriculas m
INNER JOIN alunos      a ON a.id_aluno      = m.id_aluno
INNER JOIN disciplinas d ON d.id_disciplina = m.id_disciplina
ORDER BY m.nota DESC;

-- PARTE 2: GROUP BY + CASE
SELECT
    d.nome_disciplina,
    COUNT(m.id_aluno)      AS qtd_alunos,
    ROUND(AVG(m.nota), 2)  AS media_notas,
    MAX(m.nota)            AS maior_nota,
    MIN(m.nota)            AS menor_nota,
    CASE
        WHEN AVG(m.nota) >= 8 THEN 'EXCELENTE'
        WHEN AVG(m.nota) >= 6 THEN 'BOM'
        ELSE 'ATENÇÃO'
    END AS desempenho_turma
FROM matriculas m
INNER JOIN disciplinas d ON d.id_disciplina = m.id_disciplina
GROUP BY d.nome_disciplina
ORDER BY media_notas DESC;
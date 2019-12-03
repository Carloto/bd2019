-- Aluno: Vinicius Carloto Carnelocce --
-- Exercicio 1 --

SELECT
    MAX(peso_peca) AS maior_peso
FROM
    peca;

-- Exercicio 2 --
SELECT
    COUNT(DISTINCT cod_fornec) AS fornec_embarq
FROM
    embarque;

-- Exercico 3 --
SELECT
    nome_peca
FROM
    peca
WHERE (peso_peca = (
        SELECT
            MAX(peso_peca) AS maior_peso
        FROM
            peca));

-- Exercicio 4 --
SELECT
    COUNT(*) AS fornec_porto
FROM
    fornecedor
    JOIN embarque USING (cod_fornec)
WHERE (cidade_fornec = "Porto Alegre");

-- Exericio 5 --
SELECT
    MIN(qtde_embarq) AS menor_embarq
FROM
    embarque
GROUP BY
    cod_fornec;

-- Exercicio 6 --
SELECT
    cidade_peca,
    AVG(peso_peca)
FROM
    peca
WHERE
    cidade_peca IS NOT NULL
GROUP BY
    cidade_peca;

-- Exercicio 7 --
SELECT
    cor_peca,
    COUNT(DISTINCT cidade_peca) AS cidade_cor
FROM
    embarque
WHERE
    cidade_peca IS NOT NULL
GROUP BY
    cidade_peca;

-- Exercicio 8 --
WITH fornecedor_min AS (
    SELECT
        MIN(qtde_embarq) AS min_fornec
    FROM
        embarque
    GROUP BY
        cod_fornec
)
SELECT
    AVG(min_fornec)
FROM
    fornecedor_min;

-- Exercicio 9 --
WITH fornecedor_all AS (
    SELECT
        cod_fornec,
        COUNT(*) AS embarq_all
    FROM
        embarque
    GROUP BY
        cod_fornec
)
SELECT
    cod_fornec
FROM
    embarque
WHERE (cod_fornec = (
        SELECT
            MAX(embarq_all)
        FROM
            fornecedor_all));

-- Exercicio 10 --
SELECT
    cod_depto,
    num_disc,
    nome_disc,
    COUNT(DISTINCT num_disc_prereq)
FROM
    disciplina
    LEFT JOIN prereq ON disciplina.num_disc = prereq.num_disc
GROUP BY
    num_disc;

-- Exercicio 11 --
SELECT
    ano_sem,
    cod_depto,
    num_disc,
    sigla_ofer,
    creditos_disc,
    sum(num_horas)
FROM
    oferta
    NATURAL
    LEFT JOIN periodo
    NATURAL JOIN disciplina
GROUP BY
    cod_depto,
    cod_disc;

-- Exercicio 12 --
SELECT
    ano_sem
FROM
    prof_oferta
    JOIN departamento ON (departamento.nome_depto = "Informática")
WHERE (COUNT(DISTINCT cod_prof) =
    SELECT
        COUNT(DISTINCT cod_prof)
    FROM
        professor
    WHERE
        nome_depto = "Informática")
GROUP BY
    cod_prof;

-- Exercicio 13 --
WITH (
    SELECT
        COUNT(
            DISTINCT cod_prof
)
    FROM
        professor
    WHERE
        nome_depto = "Informática" AS get_prof_infor_amount
)
SELECT
    ano_sem
FROM
    prof_oferta
    JOIN departamento ON (departamento.nome_depto = "Informática")
WHERE (COUNT(DISTINCT cod_prof) = get_prof_infor_amount)
GROUP BY
    cod_prof;

-- Exercicio 14 --
WITH get_recurs AS (
    SELECT
        num_disc,
        num_disc_prereq
    FROM
        prereq
    NATURAL
    LEFT JOIN disciplina
UNION
SELECT
    num_disc,
    num_disc_prereq
FROM
    prereq
    JOIN get_recurs ON prereq.num_disc_prereq = get_recurs.num_disc
)
SELECT
    num_disc,
    num_disc_prereq
FROM
    get_recurs;

-- Exercicio 15 --
SELECT
    num_disc,
    creditos_disc,
    nome_disc
FROM
    disicplina
    JOIN departamento USING (cod_depto)
WHERE (nome_depto = "Informática")
ORDER BY
    creditos_disc DESC num_disc ASC;


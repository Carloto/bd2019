-- Aluno: Vinicius Carloto Carnelocce
-- Exercicio 1 --

SELECT
    peca.cod_peca,
    nome_peca,
    peso_peca
FROM
    fornecedor,
    embarque,
    peca
WHERE (fornecedor.cod_fornec = embarque.cod_fornec
    AND nome_fornec = 'Silva'
    AND embarque.cod_peca = peca.cod_peca);

-- Exercicio 2 --
SELECT
    sala.cod_pred,
    num_sala,
    descricao_sala,
    capacidade_sala
FROM
    sala,
    predio
WHERE (nome_pred = 'Informática - aulas'
    AND sala.cod_pred = predio.cod_pred);

-- Exercicio 3 --
SELECT
    cod_depto,
    num_disc,
    nome_disc
FROM
    disciplina
WHERE
    UPPER(nome_disc)
    LIKE '%AÇÃO%';

-- Exercicio 4 --
SELECT
    cod_peca,
    data_embarq,
    qtde_embarq
FROM
    embarque
WHERE
    cod_fornec = 'F1';

-- Exercicio 5 --
SELECT
    data_embarq
FROM
    embarque
WHERE
    cod_fornec = 'F1';

-- Exercicio 6 --
SELECT DISTINCT
    nome_depto
FROM
    depto,
    disciplina
WHERE
    depto.cod_depto = disciplina.cod_depto;

-- Exercicio 7 --
SELECT DISTINCT
    nome_disc
FROM
    disciplina
WHERE
    creditos_disc > 4;

-- Exercicio 8 --
SELECT DISTINCT
    nome_fornec
FROM
    fornecedor,
    embarque
WHERE (fornecedor.cod_fornec = embarque.cod_fornec
    AND cod_peca = 'P1')
INTERSECT
SELECT DISTINCT
    nome_fornec
FROM
    fornecedor,
    peca
WHERE (fornecedor.cidade_fornec = peca.cidade_peca
    AND peso_peca > 4);

-- Exercicio 9  --
SELECT
    cod_prof,
    nome_prof
FROM
    professor
WHERE
    cod_tit IS NULL;

-- Exercicio 10 --
SELECT
    professor.cod_prof,
    nome_prof
FROM
    professor,
    prof_oferta
WHERE (professor.cod_prof = prof_oferta.cod_prof
    AND prof_oferta.cod_depto = 'INF01');

-- Exericio 11 --
SELECT
    professor.cod_prof,
    nome_prof
FROM
    professor,
    (
        SELECT
            prof_ofeta.cod_prof
        FROM
            depto,
            prof_oferta
        WHERE (nome_depto = 'Informática'
            AND depto.cod_depto = prof_oferta.cod_depto)) AS prof_info
WHERE
    professor.cod_prof = prof_info.cod_prof;

-- Exercicio 12 --
SELECT DISTINCT
    nome_depto
FROM
    depto
INTERSECT
SELECT DISTINCT
    nome_disc
FROM
    disciplina;

-- Exercicio 13 --
SELECT
    ano_sem,
    cod_depto,
    num_disc,
    oferta.sigla_ofer
FROM
    oferta,
    (
        SELECT
            sigla_ofer
        FROM
            oferta
        EXCEPT
        SELECT
            sigla_ofer
        FROM
            periodo) AS ofer_out_per
WHERE
    oferta.sigla_ofer = ofer_out_per.sigla_ofer;

-- Exercico 14 --
SELECT
    depto.cod_depto
FROM
    depto,
    (
        SELECT
            cod_depto
        FROM
            depto
        EXCEPT
        SELECT
            cod_depto
        FROM
            periodo) AS depto_out_per
WHERE (depto.cod_depto = depto_out_per.cod_depto
    AND nome_depto LIKE 'M%';

-- Exercicio 15 --
SELECT
    CONCAT(LOWER(nome_disc), ' (', LOWER(nome_depto), ')') AS nome_disc_depto
FROM
    disciplina,
    depto
WHERE
    disciplina.cod_depto = depto.cod_depto;

-- Exercicio 16 --

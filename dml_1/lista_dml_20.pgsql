-- Aluno: Vinicius Carloto Carnelocce --
-- Exercicio 1 --

SELECT
    *
FROM
    peca,
    (
        SELECT
            *
        FROM
            embarque,
            (
                SELECT
                    *
                FROM
                    fornecedor
                WHERE (cidade_fornec = 'Porto Alegre')) AS fornec_porto
        WHERE (fornec_porto.cod_fornec = embarque.cod_fornec)) AS peca_fornec_porto
WHERE (peca.cod_peca = peca_fornec_porto.cod_peca);

-- Exercicio 2 --
SELECT
    ano_sem
FROM
    oferta
WHERE (EXISTS (
        SELECT
            *
        FROM
            disciplina
        WHERE (nome_disc = 'Programação FORTRAN'
            AND oferta.num_disc = disciplina.num_disc)));

-- Exercicio 3 --
SELECT
    nome_prof
FROM
    professor
WHERE (EXISTS (
        SELECT
            *
        FROM
            depto
        WHERE (professor.cod_depto = depto.cod_depto
            AND nome_depto = 'Informática'))
    AND EXISTS (
        SELECT
            *
        FROM
            titulacao
        WHERE (professor.cod_tit = titulacao.cod_tit
            AND nome_tit = 'Doutor')));

-- Exercicio 4 --
SELECT
    nome_prof
FROM
    professor
WHERE (NOT EXISTS (
        SELECT
            *
        FROM
            depto
        WHERE (professor.cod_depto = depto.cod_depto
            AND nome_depto = 'Informática'))
    AND EXISTS (
        SELECT
            *
        FROM
            prof_oferta
        WHERE (professor.cod_prof = prof_oferta.cod_prof
            AND ano_sem = '20021'
            AND EXISTS (
                SELECT
                    *
                FROM
                    disciplina
                WHERE (disciplina.num_disc = prof_oferta.num_disc
                    AND creditos_disc > 3
                    AND EXISTS (
                        SELECT
                            *
                        FROM
                            depto
                        WHERE (disciplina.cod_depto = depto.cod_depto
                            AND nome_depto = 'Informática'))))));

-- Exercicio 5 --
SELECT
    ano_sem
FROM
    prof_oferta
WHERE (NOT EXISTS (
        SELECT
            *
        FROM
            professor
        WHERE (NOT EXISTS (
                SELECT
                    *
                FROM
                    depto
                WHERE (prof_oferta.cod_prof = professor.cod_prof
                    AND depto.cod_depto = professor.cod_depto
                    AND nome_depto = 'Informática')))));

-- Exercicio 6 --
SELECT
    cod_depto
FROM
    depto
WHERE (NOT EXISTS (
        SELECT
            *
        FROM
            professor
        WHERE (NOT EXISTS (
                SELECT
                    *
                FROM
                    titulacao
                WHERE (depto.cod_depto = professor.cod_depto
                    AND titulacao.cod_tit = professor.cod_tit)))));


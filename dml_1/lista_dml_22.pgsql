-- Aluno: Vinicius Carloto Carnelocce --
-- Exercicio 1 --

INSERT INTO oferta (ano_sem, cod_depto, num_disc, sigla_ofer, capacidade_ofer)
    VALUES ('20031', 'Informática',
        SELECT
            num_disc
        FROM
            disciplina
        WHERE (EXISTS (
                SELECT
                    *
                FROM
                    depto
                WHERE
                    disciplina.cod_depto = depto.cod_depto
                    AND nome_depto = 'Informática')), 'U', 0);

--
-- Exercicio 2 --
-- 1 - Verificar a existência da tabela oferta --
-- 2 - Verificar a presença das colunas --
-- 3 - Verificar se os valores sendo inseridos respeitam o domínio de determinada coluna --
--
-- Exercício 3 --

DELETE FROM oferta
WHERE cod_depto = 'MAT01';

--
-- Exercício 4 --

DELETE FROM oferta
WHERE cod_depto IN (
        SELECT
            cod_depto
        FROM
            depto
        WHERE
            nome_depto = 'Matemática');

--
-- Exercicio 5 --

DELETE FROM disciplina
WHERE cod_depto IN (
        SELECT
            cod_depto
        FROM
            depto
        WHERE
            nome_depto = 'Matemática';

--
-- Exercicio 6 --

UPDATE
    fornecedor
SET
    status_fornec = status_fornec - 5
WHERE (status_fornec >= 5
    AND cod_fornec IN (
        SELECT
            cod_fornec
        FROM
            embarque
        WHERE
            qtde_embarq < 4));

--
-- Exercicio 7 --

DELETE FROM professor
WHERE cod_prof IN (
        SELECT
            cod_depto
        FROM
            prof_oferta
        WHERE (ano_sem = '20021'
            AND cod_depto = 'MAT01'
            AND num_disc = '101'
            AND sigla_ofer = 'C'));

INSERT INTO professor (cod_prof, nome_prof, cod_depto, cod_tit)
SELECT
    *
FROM
    professor
WHERE (cod_prof = '7');

INSERT INTO professor (cod_prof, nome_prof, cod_depto, cod_tit)
SELECT
    *
FROM
    professor
WHERE (cod_prof = '9');


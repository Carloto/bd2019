-- Aluno: Vinicius Carloto Carnelocce --
-- Exercicio 1 --

SELECT DISTINCT
    depto.cod_depto,
    nome_depto
FROM
    depto
    JOIN professor ON depto.cod_depto = professor = cod_depto
    JOIN titulacao ON professor.cod_tit = titulacao.cod_tit
WHERE
    nome_tit = 'Mestre';

-- Exercicio 2 --
SELECT DISTINCT
    nome_depto
FROM
    depto
    JOIN professor ON depto.cod_depto = professor.cod_depto
    JOIN prof_oferta ON professor.cod_prof = prof_oferta.cod_prof
    JOIN oferta ON prof_oferta.sigla_ofer = oferta.sigla_ofer
    JOIN periodo ON oferta.sigla_ofer = periodo.sigla_ofer
    JOIN sala ON periodo.num_sala = sala.num_sala
    JOIN predio ON sala.cod_pred = predio.cod_pred
WHERE
    nome_pred = 'Informática - labolatórios';

-- Exercicio 3 --
SELECT DISTINCT
    nome_depto
FROM
    depto
    JOIN professor ON depto.id_depto = professor.id_depto
    JOIN prof_oferta ON professor.id_prof = prof_oferta.id_prof
    JOIN oferta ON prof_oferta.id_oferta = oferta.id_oferta
    JOIN periodo ON oferta.id_oferta = periodo.id_oferta
    JOIN sala ON periodo.id_sala = sala.id_sala
    JOIN predio ON sala.id_pred = predio.id_pred
WHERE
    nome_pred = 'Informática - labolatórios';

-- Exercicio 4 --
SELECT
    fornecedor.cod_fornec,
    nome_fornec,
    peca.cod_peca,
    nome_peca
FROM
    embarque
    JOIN fornecedor ON embarque.cod_fornec = fornecedor.cod_fornec
    JOIN peca ON embarque.cod_peca = peca.cod_peca
WHERE
    fornecedor.cidade_fornec <> peca.cidade_peca;

-- Exercicio 5 --
SELECT DISTINCT
    cod_depto,
    nome_depto
FROM
    depto
    JOIN professor USING (cod_depto)
    JOIN titulacao USING (cod_tit)
WHERE
    nome_tit = 'Mestre';

-- Exercicio 6 --
SELECT DISTINCT
    nome_depto
FROM
    depto
    JOIN professor USING (cod_depto)
    JOIN prof_oferta USING (cod_prof)
    JOIN oferta USING (sigla_ofer)
    JOIN periodo USING (sigla_ofer)
    JOIN sala USING (num_sala)
    JOIN predio USING (cod_pred)
WHERE
    nome_pred = 'Informática - labolatórios';

-- Exercicio 7 --
SELECT
    fornecedor.cod_fornec,
    nome_fornec,
    peca.cod_peca,
    nome_peca
FROM
    embarque
    JOIN fornecedor USING (cod_fornec)
    JOIN peca USING (cod_peca)
WHERE
    fornecedor.cidade_fornec <> peca.cidade_peca;

-- Exercicio 8 --
SELECT DISTINCT
    cod_depto,
    nome_depto
FROM
    depto
    NATURAL JOIN professor
    NATURAL JOIN titulacao
WHERE
    nome_tit = 'Mestre';

-- Exercicio 9 --
SELECT DISTINCT
    nome_prof
FROM
    professor
    JOIN prof_oferta USING (cod_prof)
    JOIN oferta USING (sigla_ofer)
WHERE
    ano_sem = '20022';

-- Exercicio 10 --
SELECT DISTINCT
    depto.cod_depto,
    nome_depto,
    num_disc,
    nome_disc
FROM
    depto
    LEFT JOIN disciplina ON depto.cod_depto = disciplina.cod_depto;

-- Exercicio 11 --
SELECT
    depto.cod_depto,
    nome_depto,
    disciplina.num_disc,
    nome_disc,
    ano_sem,
    sigla_ofer
FROM
    depto
    LEFT JOIN disciplina ON (depto.cod_depto = disciplina.cod_depto)
    LEFT JOIN oferta ON depto.cod_depto = oferta.cod_depto;

-- Exercicio 12 --
SELECT
    disciplina.num_disc,
    disciplina.cod_depto,
    prereq.cod_depto_prereq,
    prereq.num_disc_prereq
FROM
    disciplina
    LEFT JOIN prereq ON disciplina.num_disc = prereq.num_disc;

-- Exercicio 13 --
SELECT
    depto.cod_depto,
    depto.nome_depto,
    disciplina.num_disc,
    disciplina.cod_depto
FROM
    depto
    LEFT JOIN disciplina ON depto.cod_depto = disciplina.cod_depto
WHERE
    creditos_disc = 6;

-- Exercicio 14 --
SELECT
    disciplina.nome_disc,
    disc_prereq.nome_disc
FROM
    disciplina
    LEFT JOIN prereq ON disciplina.num_disc = prereq.num_disc
    LEFT JOIN disciplina AS disc_prereq ON prereq.num_disc_prereq = disc_prereq.num_disc;


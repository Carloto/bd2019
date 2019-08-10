CREATE TABLE pessoa (
    cod_pessoa INT NOT NULL,
	prenome VARCHAR(40) NULL,
    nome VARCHAR(40) NULL,
	sobrenome VARCHAR(40) NULL,
	sexo VARCHAR(10) NULL,
    CONSTRAINT pk_pessoa PRIMARY KEY (cod_pessoa)
);

CREATE TABLE uniao (
	cod_uniao INT NOT NULL,
	pessoa_a INT NOT NULL,
	pessoa_b INT NOT NULL,
	CONSTRAINT pk_uniao PRIMARY KEY (cod_uniao),
	CONSTRAINT fk_pessoa_a FOREIGN KEY (pessoa_a) REFERENCES pessoa,
	CONSTRAINT fk_pessoa_b FOREIGN KEY (pessoa_b) REFERENCES pessoa
);

CREATE TABLE filho (
	cod_uniao INT NOT NULL,
	cod_pessoa INT NOT NULL,
	CONSTRAINT fk_uniao FOREIGN KEY (cod_uniao) REFERENCES uniao,
	CONSTRAINT fk_pessoa FOREIGN KEY (cod_pessoa) REFERENCES pessoa,
	CONSTRAINT pk_filho PRIMARY KEY (cod_uniao, cod_pessoa)
);

CREATE TABLE lugar (
	cod_lugar INT NOT NULL,
	nome_lugar VARCHAR(40) NULL,
	CONSTRAINT pk_lugar PRIMARY KEY (cod_lugar)
);

CREATE TABLE lugar_uniao (
	cod_uniao INT NOT NULL,
	cod_lugar INT NOT NULL,
	data_uniao DATE NULL,
	horario_uniao TIME NULL,
	CONSTRAINT fk_uniao FOREIGN KEY (cod_uniao) REFERENCES uniao,
	CONSTRAINT fk_lugar FOREIGN KEY (cod_lugar) REFERENCES lugar,
	CONSTRAINT pk_lugar_uniao PRIMARY KEY (cod_uniao, cod_lugar)
);

CREATE TABLE nascimento (
	cod_pessoa INT NOT NULL,
	cod_lugar INT NOT NULL,
	data_nascimento DATE NULL,
	horario_nascimento TIME NULL,
	CONSTRAINT fk_pessoa FOREIGN KEY (cod_pessoa) REFERENCES pessoa,
	CONSTRAINT fk_lugar FOREIGN KEY (cod_lugar) REFERENCES lugar,
	CONSTRAINT pk_nascimento PRIMARY KEY (cod_pessoa, cod_lugar)
);

CREATE TABLE falecimento (
	cod_pessoa INT NOT NULL,
	cod_lugar INT NOT NULL,
	data_falecimento DATE NULL,
	horario_falecimento TIME NULL,
	CONSTRAINT fk_pessoa FOREIGN KEY (cod_pessoa) REFERENCES pessoa,
	CONSTRAINT fk_lugar FOREIGN KEY (cod_lugar) REFERENCES lugar,
	CONSTRAINT pk_falecimento PRIMARY KEY (cod_pessoa, cod_lugar)
);


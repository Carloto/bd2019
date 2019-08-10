CREATE TABLE reserva (
    cod_reserva VARCHAR(40) NOT NULL,
    nome_passageiro VARCHAR(40) NOT NULL,
    CONSTRAINT pk_reserva PRIMARY KEY (cod_reserva)
);

CREATE TABLE cidade (
    nome_cidade VARCHAR(40) NOT NULL,
    CONSTRAINT pk_cidade PRIMARY KEY (nome_cidade)
);

CREATE TABLE voo (
    cod_voo INTEGER NOT NULL,
    CONSTRAINT pk_voo PRIMARY KEY (cod_voo)
);

CREATE TABLE assento (
    cod_assento VARCHAR(40) NOT NULL,
    CONSTRAINT pk_assento PRIMARY KEY (cod_assento)
);

CREATE TABLE tipo_aeronave (
    tipo VARCHAR(40) NOT NULL,
    CONSTRAINT pk_tipo_aeronave PRIMARY KEY (tipo)
);

CREATE TABLE assento_tipo (
    at_tipo VARCHAR(40) NOT NULL,
    at_assento VARCHAR(40) NOT NULL,
    CONSTRAINT fk_tipo FOREIGN KEY (at_tipo) REFERENCES tipo_aeronave ON UPDATE NO ACTION,
    CONSTRAINT fk_assento FOREIGN KEY (at_assento) REFERENCES assento,
    CONSTRAINT pk_assento_tipo PRIMARY KEY (at_tipo, at_assento)
);

CREATE TABLE aeroporto (
    cod_aeroporto VARCHAR(40) NOT NULL,
    cod_cid_aeroporto VARCHAR(40) NULL,
    CONSTRAINT fk_cidade FOREIGN KEY (cod_cid_aeroporto) REFERENCES cidade,
    CONSTRAINT pk_aeroporto PRIMARY KEY (cod_aeroporto)
);

CREATE TABLE trecho (
    cod_trecho VARCHAR(40) NOT NULL,
    cod_voo_trecho INTEGER NOT NULL,
    cod_aero_origem VARCHAR(40) NOT NULL,
    cod_aero_destino VARCHAR(40) NOT NULL,
    tipo_aero VARCHAR(40) NULL,
    CONSTRAINT fk_voo FOREIGN KEY (cod_voo_trecho) REFERENCES voo ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_aero_origem FOREIGN KEY (cod_aero_origem) REFERENCES aeroporto,
    CONSTRAINT fk_aero_destino FOREIGN KEY (cod_aero_destino) REFERENCES aeroporto,
    CONSTRAINT fk_tipo_aero FOREIGN KEY (tipo_aero) REFERENCES tipo_aeronave ON UPDATE NO ACTION,
    CONSTRAINT unique_trecho UNIQUE (cod_trecho),
    CONSTRAINT pk_trecho PRIMARY KEY (cod_trecho, cod_voo_trecho, cod_aero_origem, cod_aero_destino)
);

CREATE TABLE reserva_trecho (
    cod_res VARCHAR(40) NOT NULL,
    cod_tre VARCHAR(40) NOT NULL,
    cod_ass VARCHAR(40) NOT NULL,
    classe VARCHAR(40) DEFAULT 'economica' NOT NULL,
    CONSTRAINT fk_res FOREIGN KEY (cod_res) REFERENCES reserva,
    CONSTRAINT fk_tre FOREIGN KEY (cod_tre) REFERENCES trecho (cod_trecho),
    CONSTRAINT fk_ass FOREIGN KEY (cod_ass) REFERENCES assento,
    CONSTRAINT pk_res_trecho PRIMARY KEY (cod_res, cod_tre, cod_ass)
);

CREATE TABLE horario (
    cod_horario VARCHAR(40) NOT NULL,
    cod_trec_horario VARCHAR(40) NOT NULL,
    data_trecho DATE NOT NULL,
    hora_trecho TIME NOT NULL,
    CONSTRAINT fk_trecho FOREIGN KEY (cod_trec_horario) REFERENCES trecho (cod_trecho),
    CONSTRAINT pk_horario PRIMARY KEY (cod_horario)
);


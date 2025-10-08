CREATE TABLE public.consumidores (
	nome_consumidor varchar NOT NULL,
	matricula varchar NULL,
	senha varchar NOT NULL,
	cpf_consumidor char NULL,
	dias_padrao json NOT NULL,
	CONSTRAINT consumidores_pk PRIMARY KEY (matricula),
	CONSTRAINT consumidores_unique UNIQUE (cpf_consumidor)
);

CREATE TABLE public.cozinheiros (
	nome_cozinheiro varchar NOT NULL,
	cpf_cozinheiro char(11) NOT NULL,
	senha varchar NOT NULL,
	CONSTRAINT cozinheiros_pk PRIMARY KEY (cpf_cozinheiro)
);

CREATE TABLE public.cardapios (
	dia date NOT NULL,
	cardapio json NOT NULL,
	CONSTRAINT cardapios_pk PRIMARY KEY ("data")
);

CREATE TABLE public.reservas (
	id_reserva serial NOT NULL,
	hora_reserva timestamp NOT NULL,
	identificacao varchar NOT NULL,
	CONSTRAINT reservas_pk PRIMARY KEY (id_reserva),
	CONSTRAINT reservas_unique UNIQUE (matricula)
);
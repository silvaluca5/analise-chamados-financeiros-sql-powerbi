CREATE DATABASE ProjetoSuporteFinanceiro;
GO

USE ProjetoSuporteFinanceiro;
GO

CREATE TABLE clientes (
    id_cliente VARCHAR(15) PRIMARY KEY,
    nome_cliente VARCHAR(100),
    tipo_conta VARCHAR(30),
    cidade VARCHAR(80),
    estado VARCHAR(5)
);

CREATE TABLE chamados_financeiros (
    id_chamado VARCHAR(15) PRIMARY KEY,
    id_cliente VARCHAR(15),
    data_abertura DATE,
    data_fechamento DATE,
    canal_atendimento VARCHAR(30),
    motivo_chamado VARCHAR(80),
    valor_envolvido DECIMAL(12,2),
    status_chamado VARCHAR(30),
    CONSTRAINT FK_chamados_cliente
        FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);
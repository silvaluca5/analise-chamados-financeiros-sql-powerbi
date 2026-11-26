USE ProjetoSuporteFinanceiro;
GO

SELECT
    id_chamado,
    id_cliente,
    data_abertura,
    motivo_chamado,
    valor_envolvido,
    status_chamado
FROM chamados_financeiros
WHERE status_chamado <> 'Resolvido'
ORDER BY valor_envolvido DESC;

SELECT
    ch.id_chamado,
    cl.nome_cliente,
    cl.tipo_conta,
    ch.canal_atendimento,
    ch.motivo_chamado,
    ch.valor_envolvido,
    ch.status_chamado
FROM chamados_financeiros ch
INNER JOIN clientes cl
    ON ch.id_cliente = cl.id_cliente;

SELECT
    motivo_chamado,
    COUNT(id_chamado) AS total_chamados,
    SUM(valor_envolvido) AS valor_total
FROM chamados_financeiros
GROUP BY motivo_chamado
ORDER BY total_chamados DESC;

SELECT
    id_chamado,
    motivo_chamado,
    valor_envolvido,
    CASE
        WHEN data_fechamento IS NULL THEN 'Pendente'
        ELSE 'Encerrado'
    END AS situacao_atendimento
FROM chamados_financeiros;
USE ProjetoSuporteFinanceiro;
GO

INSERT INTO clientes (id_cliente, nome_cliente, tipo_conta, cidade, estado)
VALUES
('CL01', 'Ana Souza', 'Pessoa Física', 'Santo André', 'SP'),
('CL02', 'Mercado Horizonte Ltda', 'Pessoa Jurídica', 'São Paulo', 'SP'),
('CL03', 'Carlos Mendes', 'Pessoa Física', 'Curitiba', 'PR'),
('CL04', 'Padaria Estrela ME', 'Pessoa Jurídica', 'Belo Horizonte', 'MG'),
('CL05', 'Fernanda Lima', 'Pessoa Física', 'Campinas', 'SP');

INSERT INTO chamados_financeiros (
    id_chamado, id_cliente, data_abertura, data_fechamento,
    canal_atendimento, motivo_chamado, valor_envolvido, status_chamado
)
VALUES
('CH001', 'CL01', '2026-11-02', '2026-11-03', 'Chat', 'Cobrança duplicada', 189.90, 'Resolvido'),
('CH002', 'CL02', '2026-11-04', NULL, 'Telefone', 'Divergência de boleto', 2450.00, 'Em aberto'),
('CH003', 'CL03', '2026-11-05', '2026-11-05', 'WhatsApp', 'Estorno de pagamento', 95.00, 'Resolvido'),
('CH004', 'CL04', '2026-11-08', NULL, 'E-mail', 'Atualização de limite', 8000.00, 'Em andamento'),
('CH005', 'CL05', '2026-11-10', '2026-11-12', 'Chat', 'Segunda via de fatura', 340.50, 'Resolvido'),
('CH006', 'CL02', '2026-11-14', NULL, 'WhatsApp', 'Estorno de pagamento', 1200.00, 'Em aberto'),
('CH007', 'CL01', '2026-11-18', '2026-11-19', 'E-mail', 'Segunda via de fatura', 150.00, 'Resolvido');
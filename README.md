# Análise de Chamados Financeiros (SQL Server + Power BI)

Projeto de análise de dados voltado para o monitoramento de chamados de suporte financeiro, cobrindo modelagem relacional no SQL Server, carga de dados fictícios, consultas analíticas e visualização interativa em dashboard no Power BI.

## Estrutura do Projeto

- `01_criar_tabelas.sql` (DDL): criação do banco `ProjetoSuporteFinanceiro` e das tabelas `clientes` e `chamados_financeiros` com chave estrangeira (`FK_chamados_cliente`).
- `02_inserir_dados.sql` (DML): inserção de 5 clientes (`Pessoa Física` e `Pessoa Jurídica`) e 7 chamados registrados entre `02/11/2026` e `19/11/2026`.
- `03_consultas_analiticas.sql` (Consultas Analíticas): consultas `SELECT` com filtros (`WHERE`), junção (`INNER JOIN`), agregações (`GROUP BY`, `COUNT`, `SUM`) e classificação condicional (`CASE`).
- `arq_dashboard.pbix`: painel visual no Power BI com KPIs, segmentação por status e gráficos de distribuição por cidade, status, motivo e tipo de conta.

## Modelo de Dados

### `clientes`
| Coluna | Tipo | Descrição |
| :--- | :--- | :--- |
| `id_cliente` | `VARCHAR(15)` | Chave primária do cliente (ex.: `CL01`) |
| `nome_cliente` | `VARCHAR(100)` | Nome ou razão social |
| `tipo_conta` | `VARCHAR(30)` | `Pessoa Física` ou `Pessoa Jurídica` |
| `cidade` | `VARCHAR(80)` | Cidade do cliente |
| `estado` | `VARCHAR(5)` | UF do cliente |

### `chamados_financeiros`
| Coluna | Tipo | Descrição |
| :--- | :--- | :--- |
| `id_chamado` | `VARCHAR(15)` | Chave primária do chamado (ex.: `CH001`) |
| `id_cliente` | `VARCHAR(15)` | Chave estrangeira referenciando `clientes(id_cliente)` |
| `data_abertura` | `DATE` | Data de abertura do chamado |
| `data_fechamento` | `DATE` | Data de encerramento (`NULL` quando ainda não concluído) |
| `canal_atendimento` | `VARCHAR(30)` | `Chat`, `Telefone`, `WhatsApp` ou `E-mail` |
| `motivo_chamado` | `VARCHAR(80)` | Motivo financeiro da solicitação |
| `valor_envolvido` | `DECIMAL(12,2)` | Valor financeiro associado ao chamado |
| `status_chamado` | `VARCHAR(30)` | `Resolvido`, `Em aberto` ou `Em andamento` |

## Principais Análises e Consultas SQL

1. **Chamados não resolvidos ordenados por impacto financeiro:** filtra registros com `status_chamado <> 'Resolvido'` e ordena por `valor_envolvido DESC` para priorizar atendimento.
2. **Visão consolidada por cliente e canal:** une `chamados_financeiros` e `clientes` via `INNER JOIN` para cruzar `nome_cliente`, `tipo_conta` e `canal_atendimento`.
3. **Volume e valor por motivo:** agrupa por `motivo_chamado` calculando `COUNT(id_chamado)` e `SUM(valor_envolvido)`.
4. **Situação de encerramento:** utiliza `CASE WHEN data_fechamento IS NULL THEN 'Pendente' ELSE 'Encerrado' END` para acompanhar o andamento.

## Destaques da Base Analisada

- **Total de chamados:** 7 chamados, somando **R$ 12.425,40** (`12,43 mil`) em valor total envolvido.
- **Distribuição por status:** 4 resolvidos (`57,14%`), 2 em aberto (`28,57%`) e 1 em andamento (`14,29%`).
- **Concentração por tipo de conta:** clientes `Pessoa Jurídica` concentram **R$ 11.650,00** (`11,7 mil`), enquanto `Pessoa Física` soma **R$ 775,40** (`0,8 mil`).
- **Distribuição geográfica e motivos:** Santo André e São Paulo lideram com 2 chamados cada; *Estorno de pagamento* e *Segunda via de fatura* são os motivos mais recorrentes (2 chamados cada).

## Dashboard (Power BI)

O relatório apresenta:
- Cartões de KPI (*Total de Chamados* e *Valor Total Envolvido*) e segmentação interativa por *Status do Chamado*.
- *Contagem de Chamados por Cidade* e *Chamados por Motivo*.
- *Chamados por Status* (gráfico de rosca) e *Valor por Tipo de Conta*.

## Tecnologias Utilizadas

- **SQL Server** (T-SQL: DDL, DML, `JOIN`, `GROUP BY`, `CASE`)
- **Power BI** (modelagem visual, filtros interativos e gráficos)

![alt text](image.png)

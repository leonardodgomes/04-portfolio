-- 1. Garante que a tabela destino existe com a estrutura correta
CREATE TABLE IF NOT EXISTS seguros_auto.`01_bronze`.bronze_sinistros (
    id_sinistro INT,
    id_apolice INT,
    data_sinistro DATE,
    valor_sinistro DOUBLE,
    tipo_incidente STRING,
    suspeito_fraude INT,
    data_ingestao_bronze TIMESTAMP
) USING DELTA;

-- 2. Ingestão explícita mapeando coluna por coluna
INSERT INTO seguros_auto.`01_bronze`.bronze_sinistros
SELECT 
    id_sinistro,
    id_apolice,
    data_sinistro,
    valor_sinistro,
    tipo_incidente,
    suspeito_fraude,
    CURRENT_TIMESTAMP() AS data_ingestao_bronze -- Aqui gera a data controlada pela Bronze
FROM seguros_auto.`00_landing`.landing_sinistros;

import pandas as pd
import matplotlib.pyplot as plt
import mysql.connector

# -- CONFIGURAÇÕES --

db_config = {
    'host': 'localhost',
    'user': 'root',
    'password': 'senaisp', #trocar por sua senha do mysql
    'database': 'logi_fast_db'
}



# -- FASE1: ENGENHARIA DE DADOS --
# 
print("1. A extrair dados do MySQL")

query = """
    SELECT
        c.nome,
        c.zona_atuacao,
        d.status_entrega,
        d.distancia_km,
        d.valor_frete,
        d.data_pedido
    FROM
        entregas d
    INNER JOIN
        entregadores c ON d.id_entregador = c.id_entregador
    ORDER BY
        d.data_pedido;
"""

try:
        conexao = mysql.connector.connect(**db_config)
        print("Conexão bem sucedida")
        df = pd.read_sql_query(query, conexao)
        print(f"Dados extraidos com sucesso. {len(df)} linhas recebidas")
finally:
        if 'conexao' in locals() and conexao.is_connected():
            conexao.close()
            print("Conexão com o MySQL foi fechada")



# # -- FASE2: ANALISE DE DADOS --
print("2. A calcular indicadores")

# faturamento por zona
fat_zona = df.groupby('zona_atuacao')['valor_frete'].sum().reset_index()
print("\nFaturamento por Zona:")
print(fat_zona)

# Contagem de status (Sucesso x Falha)
status_counts = df['status_entrega'].value_counts().reset_index()
status_counts.columns = ['status_entrega', 'count']
print("\nContagem de Status de Entrega:")
print(status_counts)



# # -- FASE3: VISUALIZAÇÃO DE DADOS --
print("3. a gerar gráficos")

#     #Grafico 1 - Faturamento por Zona (barra)
plt.figure(figsize=(8, 5))
plt.bar(fat_zona['zona_atuacao'], fat_zona['valor_frete'], color=['blue', 'orange', 'green'])
plt.title('Faturamento por Zona de Atuação')
plt.xlabel('Zona de Atuação')
plt.ylabel('Faturamento Total (R$)')
plt.xticks(rotation=45)


#     #Gráfico 2 -  Pizza de Status
plt.figure(figsize=(6, 6))
plt.pie(status_counts['count'], labels=status_counts['status_entrega'], autopct='%1.1f%%', colors=['green', 'yellow', 'red'])
plt.title('Distribuição de Status de Entrega')
plt.show()


#     Storytelling

story = """

Storytelling — Análise Operacional LogiFast
Contexto
A LogiFast opera com uma equipe de 15 entregadores distribuídos em 5 zonas (Norte, Sul, Centro, Leste e Oeste), utilizando três tipos de veículos: Motos, Vans e Bicicletas. A análise cobre o período de 20 a 25 de novembro de 2024, com foco em faturamento por zona e eficiência das entregas.

1. Faturamento por Zona — Onde o dinheiro está?
A Zona Leste se destaca como a região de maior faturamento total, impulsionada principalmente pela dupla de alto desempenho formada por Aline Rocha (Van) e Fernanda Lima (Moto) — a Van da Zona Leste acumula fretes individuais superiores a R$190, sendo um dos maiores ticket médios da operação. Na sequência, as zonas Norte e Oeste também apresentam volumes relevantes, puxados pelo uso de Vans em rotas longas.
💡 Recomendação 1: Ampliar a frota de Vans na Zona Leste e Norte, onde rotas mais longas geram fretes mais altos, maximizando o faturamento por entrega.

2. Distribuição de Status — Onde estamos perdendo receita?
A maioria das entregas está com status "Entregue", o que é positivo. Porém, aproximadamente 1 em cada 4 entregas ainda termina como "Pendente" ou "Devolvida" — e esse dado merece atenção redobrada: entregas devolvidas registram valor_frete = 0, ou seja, geram custo operacional sem nenhuma receita.
As zonas com maior concentração de devoluções e pendências incluem Norte e Oeste, onde entregadores de Bicicleta operam rotas relativamente longas para o veículo — um desalinhamento claro entre meio de transporte e demanda da região.
💡 Recomendação 2: Revisar a alocação de Bicicletas em zonas com rotas longas. Redirecionar esses entregadores para o Centro ou Sul, onde as distâncias são compatíveis com o veículo, reduzindo devoluções e aumentando a taxa de sucesso.

3. Performance por Veículo — Quem entrega mais e melhor?
As Vans dominam em distância percorrida e faturamento bruto (rotas acima de 40 a 95 km com fretes entre R$120 e R$220), enquanto as Motos equilibram volume e agilidade em distâncias médias. As Bicicletas, por sua vez, são eficientes em curtas distâncias (até ~5 km), mas apresentam as maiores taxas de pendência e devolução quando alocadas em rotas inadequadas.
💡 Recomendação 3: Estruturar uma política de alocação por veículo baseada em faixa de distância — Bicicleta (0 a 5 km), Moto (5 a 20 km) e Van (20+ km) — para reduzir falhas e aumentar o lucro líquido por entrega.

Conclusão
A LogiFast tem uma base operacional sólida, mas ainda deixa receita na mesa. Investir na Zona Leste com mais Vans, corrigir o desalinhamento veículo a rota e trabalhar para reduzir o índice de devoluções são os três movimentos estratégicos com maior potencial de impacto no lucro da operação.


"""

print(f'\n{story}')
# 📦 LogiFast - Análise de Dados Logísticos

## 📌 Sobre o Projeto

Estre projeto realiza uma análise de dados de uma empresa fictícia de logística chamada LogiFast, com foco em desempenho operacional, faturamento e eficiência das entregas

Os dados são armazenados em um banco de dados MySQL e processados com Python, permitindo a geração de indicadores estratégicos e visualizações para apoio à tomada de decisão

## 🛠️ Tecnologias Utilizadas
  - Python
  - Pandas -> manipulação e análise de dados
  - Matplotlib -> criação de gráficos
  - MySQL -> armazenamento dos dados
  - mysql-connector-python -> conexão com o banco

## 📊 Objetivos da Análise
  - Avaliar o faturamento por região
  - Monitorar a contagem de status (% de Entregues, Devolvidos, Pendentes)

## 🗄️ Fonte de Dados
Os dados são extraídos diretamente de um banco MySQL, a partir de um JOIN entre as tabelas
  - entregas
  - entregadores

### **Principais Campos Analisados**
  - Zona de atuação
  - Status da entrega
  - distância (km)
  - valor do frete
  - data do pedido

## 🔎 Etapas do Projeto

1. Engenharia de Dados
  - Conexão com o banco de dados MySQL
  - Execução de query SQL com JOIN
  - Importação dos dados para um DataFrame (Pandas)
    
2. Análise de dados
  Foram calculados os seguintes indicadores:
  - 💰 Faturamento por zona
    ``` 
      df.groupby('zona_atuacao')['valor_frete'].sum()
    ```
  - 📦 Distribuição de status das entregas
    ```
      df['status_entrega'].value_counts()
    ``` 
3. Visualização de Dados

  📊 Gráfico de Barras
  - Faturamento total por zona de atuação

  🥧 Gráfico de Pizza
  - Distribuição percentual dos status das entregas

## 📈 Principais Insights
  - A Zona Leste apresenta o maior faturamento, impulsionada por entregas de maior valor.
  - As Vans são responsáveis pelos maiores tickets médios devido às longas distâncias.
  - Cerca de 25% das entregas não são concluídas com sucesso (pendentes ou devolvidas).
  - Entregas devolvidas geram custo sem receita, impactando diretamente o lucro.
  - Uso inadequado de bicicletas em rotas longas contribui para falhas operacionais.

## 💡 Recomendações Estratégicas
  - 🚚 Expandir o uso de Vans em regiões de alta demanda e longas distâncias
  - 📍 Reorganizar a alocação de veículos conforme distância:
     - Bicicleta → até 5 km
     - Moto → 5 a 20 km
     - Van → acima de 20 km
  - ⚠️ Reduzir entregas devolvidas com melhor planejamento logístico
  - 📊 Monitorar continuamente indicadores de performance

## 📖 Storytelling da Análise
A análise revelou que a LogiFast possui uma operação funcional, porém com oportunidades claras de otimização.

O faturamento está concentrado em regiões específicas, enquanto falhas operacionais — principalmente devoluções — reduzem o potencial de lucro.

A principal causa identificada foi o desalinhamento entre tipo de veículo e distância percorrida, indicando a necessidade de uma estratégia mais orientada por dados.

## ▶️ Como Executar o Projeto

1. Instale as dependências:
```
  pip install pandas matplotlib seaborn mysql-connector-python
```
3. Configure o acesso ao banco no código:
```
  db_config = {
    'host': 'localhost',
    'user': 'root',
    'password': 'SUA_SENHA',
    'database': 'logi_fast_db'
  }
```
3. Execute o Script:
```
  python logi_fast.py
```

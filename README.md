# Crypto Analytics Pipeline

Real-time cryptocurrency analytics pipeline fetching live market data from CoinGecko API, transforming with DBT, orchestrating with Airflow, and storing on AWS RDS.

## Business Questions Answered
1. **Volume Analysis** — Which coins have the highest 24h trading volume?
2. **Volatility Analysis** — Which coins have the biggest price swings?
3. **Market Dominance** — What is Bitcoin's market share vs other coins?
4. **Price Trends** — How do coin prices change over time?

## Architecture

CoinGecko API (daily)
│
▼ Python ingestion script
AWS RDS PostgreSQL - crypto_raw schema
│
▼ DBT transformation
AWS RDS PostgreSQL - crypto_dev schema
│
├── Staging Layer (1 view)
│   stg_coin_prices (with deduplication)
│
├── Dimension Layer (1 table)
│   dim_coins
│
└── Marts Layer (3 tables)
fct_daily_prices (central fact table)
fct_volume_analysis
fct_market_dominance
│
▼
Airflow DAG (daily 8am)

## Tech Stack
- **CoinGecko API** — free real time crypto market data
- **Python** — data ingestion and API calls
- **Apache Airflow 2.9** — pipeline orchestration, daily scheduling
- **DBT Core 1.11** — data transformation, testing, documentation
- **AWS RDS PostgreSQL** — cloud data warehouse (us-east-1)

## Key Features
- Live API data fetched daily from CoinGecko
- Incremental DBT models — only new data processed each run
- Deduplication logic — one row per coin per day guaranteed
- Star schema design — fact + dimension tables
- 20 automated data quality tests
- Full pipeline orchestration via Airflow DAG with retry logic
- Hosted entirely on AWS cloud

## Pipeline Models
| Model | Layer | Type | Purpose |
|---|---|---|---|
| stg_coin_prices | Staging | View | Clean raw API data, deduplicate |
| dim_coins | Dimensions | Table | Coin descriptive attributes |
| fct_daily_prices | Marts | Incremental | Daily price metrics per coin |
| fct_volume_analysis | Marts | Incremental | Volume rankings per day |
| fct_market_dominance | Marts | Incremental | Market cap dominance per day |

## Key Insights
- **Tether** consistently has highest 24h volume — stablecoin dominates trading
- **Bitcoin** has highest absolute price volatility — $1,981 daily swing
- **Bitcoin** holds ~40% market dominance vs all other coins combined
- Incremental models ensure pipeline scales efficiently as historical data grows

## How to Run

**1. Fetch data from API:**
```bash
python3 ingest_crypto.py
```

**2. Transform with DBT:**
```bash
cd crypto_pipeline_dbt
dbt run
dbt test
```

**3. Automated via Airflow:**
DAG: crypto_pipeline
Schedule: 0 8 * * * (daily at 8am)
Task 1: data_ingestion → runs ingest_crypto.py
Task 2: run_dbt → runs dbt run

## Pipeline Lineage
![Pipeline Lineage](screenshots/Screenshot (2).png)


## Airflow Operation
![Airflow Operation](operation1/.png)
![Airflow Operation](operation2/.png)
![Airflow Operation](operation3/.png)
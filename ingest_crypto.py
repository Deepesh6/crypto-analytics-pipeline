import requests
import pandas as pd
from sqlalchemy import create_engine
from datetime import datetime, timezone



url = "https://api.coingecko.com/api/v3/coins/markets"

params = {  
    'vs_currency': 'usd',
    'order': 'market_cap_desc',
    'per_page': 50,
    'page': 1,
    'sparkline': False
}

response = requests.get(url, params=params)
data = response.json()

# Extract required fields
filtered_data = []
for coin in data:
    filtered_coin = {
        "id": coin["id"],
        "symbol": coin["symbol"],
        "name": coin["name"],
        "current_price": coin["current_price"],
        "market_cap": coin["market_cap"],
        "market_cap_rank": coin["market_cap_rank"],
        "total_volume": coin["total_volume"],
        "high_24h": coin["high_24h"],
        "low_24h": coin["low_24h"],
        "price_change_24h": coin["price_change_24h"],
        "price_change_percentage_24h": coin["price_change_percentage_24h"],
        "circulating_supply": coin["circulating_supply"],
        "last_updated": coin["last_updated"],
        "fetched_at": datetime.now(timezone.utc)
    }
    filtered_data.append(filtered_coin)

# Convert to DataFrame
df = pd.DataFrame(filtered_data)
print(f"Fetched {len(df)} coins")
print(df.head(3))

# Load to AWS RDS
engine = create_engine('postgresql://postgres:Admin1234!@olist-pipeline.cg1gusiqwbyb.us-east-1.rds.amazonaws.com:5432/postgres')

df.to_sql(
    'daily_prices',     # table name to create/write to
    engine,              # database connection
    schema='crypto_raw',   # which schema to put table in
    if_exists='append',    # append not replace — we want history!   # what to do if table already exists
    index=False            # don't write DataFrame index as a column
)

print(f"✅ Loaded {len(df)} rows to crypto_raw.daily_prices")
import requests
import json

url = "https://api.coingecko.com/api/v3/coins/markets"

params = {
    'vs_currency': 'usd',
    'order': 'market_cap_desc',
    'per_page': 10,
    'page': 1,
    'sparkline': False
}

response = requests.get(url, params=params)
data = response.json()

for coin in data:
    print(f"{coin['name']}: ${coin['current_price']} | Volume: {coin['total_volume']}")

# Add this line outside the loop
print(json.dumps(data[0], indent=2))



# python Operator - Run python functions
# Bash Operator - Run Shell/Linux Commands

# Python Operator -> Executes python codes/functions
# Bash Operator -> Running shell/terminal commands


#in WSL D:\ = /mnt/d/

# there is no such conflist between the windows and ubuntu in Real companies. As there everything runs in Linux Servers.
# for example : Linux server 1: Airflow
# Linux Server 2 : DBT
# Linux Server 3: POstgres (cloud RDS)

# copying files to ubuntu is a workaround specific to your local setup.




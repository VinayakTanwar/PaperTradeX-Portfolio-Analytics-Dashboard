from sqlalchemy import create_engine
import pandas as pd 
import json 

with open("portfolio.json", "r") as f :
    data = json.load(f)

balance_data = pd.DataFrame({
    "balance" : [data["balance"]]
})


holding_items = []
for ticker,info in data["holdings"].items():
    holding_items.append({
        "Ticker": ticker,
        "quantity" : info["quantity"],
        "Buy_Price" : info["buy_price"],
        "date" : info["date"]
    })

holding_data = pd.DataFrame(holding_items)


tradehistory_data = pd.DataFrame(data["trade_history"])
print(tradehistory_data)




engine = create_engine(
    "mysql+pymysql://{db_user}:{db_password}@{db_host}/{db_name}"
)

balance_data.to_sql(
    "account",
    con=engine,
    if_exists="replace",
    index=False
)

holding_data.to_sql(
    "holdings",
    con=engine,
    if_exists="replace",
    index=False
)

tradehistory_data.to_sql(
    "trade_history",
    con=engine,
    if_exists="replace",
    index=False
)

print("All Data Imported Successfully!")
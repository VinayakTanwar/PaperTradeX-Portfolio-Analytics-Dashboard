import yfinance as yk
import pandas as pd
from sqlalchemy import create_engine


stocks = ['GOOGL','AAPL','NVDA','TSLA']

# # df = yk.download(stocks, period="3y")

# # df.reset_index(inplace=True)
all_data = []

for stock in stocks:
    df = yk.download(stock, period="3y")

    df.columns = df.columns.droplevel(1)

    df.reset_index(inplace= True)
    

    df["Ticker"] = stock

    all_data.append(df)

final_data = pd.concat(all_data, ignore_index=True)

# print(final_data.head())
# print(final_data.shape)


engine = create_engine(
    "mysql+pymysql://{db_user}:{db_password}@{db_host}/{db_name}"
)

final_data.to_sql(
    "stock_prices",
    con=engine,
    if_exists="replace",
    index=False
)

df.to_csv("API_DATA.csv")

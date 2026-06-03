# 📈 PaperTradeX Portfolio Analytics Dashboard

## Overview

PaperTradeX is a personal stock portfolio simulation project that I built to learn financial analytics, business intelligence, and dashboard development.

This repository contains the analytics dashboard module of the main PaperTradeX project. The dashboard was created using SQL, Power BI, and DAX to transform portfolio data into meaningful insights about portfolio performance, risk, volatility, and market trends.

Instead of simply tracking stock holdings, this dashboard helps analyze how the portfolio is performing and which investments contribute the most to returns and risk.

---

## About PaperTradeX

PaperTradeX is a stock portfolio simulation project designed to mimic real-world investing without using real money.

The main project focuses on:

* Portfolio Holdings Management
* Trade Tracking
* Profit & Loss Monitoring
* Portfolio Valuation
* Stock Performance Analysis

This dashboard represents the analytics layer of the project and focuses on reporting, visualization, and investment insights.

---

## Dashboard Preview

### Main Dashboard

<img width="1126" height="675" alt="dashboard" src="https://github.com/user-attachments/assets/8043dd3a-b344-47ba-9dc3-bdf3cd9d45e1" />


---

## Business Questions Answered

This dashboard helps answer questions such as:

* What is the current value of the portfolio?
* How much capital has been invested?
* What is the overall portfolio return?
* Which stock is the most volatile?
* Which holdings contribute the most value?
* How do stock prices compare against moving averages?
* What is the current market sentiment?
* Which stocks have the highest trading volume?

---

## Tools & Technologies

### Programming

* Python
* Pandas
* NumPy

### Database

* MySQL
* SQL

### Business Intelligence

* Power BI
* DAX

### Version Control

* Git
* GitHub

---

## Project Structure

```text
PaperTradeX-Portfolio-Analytics-Dashboard
│
├── Dashboard
│   ├── portfolio dashboard.pbix
│   └── portfolio dashboard pdf.pdf
│
├── Dataset
│   ├── API_DATA.csv
│   └── holding Data.json
│
├── Scripts
│   ├── apitosql.py
│   ├── holdingstosql.py
│   └── sqlanalysisquery.sql
│
└── README.md
```

---

## Data Pipeline

One of the goals of this project was to build a complete analytics workflow instead of only creating a dashboard.

### Data Collection

Stock market data was collected using the **YFinance API**.

The API provided:

* Daily stock prices
* Open, High, Low, Close values
* Trading Volume
* Historical market data

Portfolio holding data was stored separately and combined with market data to calculate portfolio performance metrics.

### Data Processing Workflow

```text
YFinance API
      ↓
Python Scripts
      ↓
CSV / JSON Files
      ↓
MySQL Database
      ↓
SQL Analysis
      ↓
Power BI Dashboard
```

### Python Scripts

#### apitosql.py

Used to:

* Extract stock market data from YFinance API
* Transform raw API responses
* Load stock data into MySQL

#### holdingstosql.py

Used to:

* Process portfolio holding information
* Load holdings into MySQL
* Connect portfolio data with market data

#### sqlanalysisquery.sql

Contains SQL queries used for:

* Portfolio valuation
* Volatility analysis
* Moving averages
* Profit calculations
* Market sentiment analysis

---

## How Portfolio Value Is Calculated

The dashboard combines holdings data with the latest stock prices collected from YFinance.

```text
Current Portfolio Value =
Quantity Owned × Current Market Price
```

This allows the dashboard to measure:

* Current Portfolio Value
* Net Portfolio Profit
* Portfolio Return %
* Stock Volatility
* Risk Analysis
* Market Performance

using real market data retrieved through the API.

---

## SQL Analysis

Several SQL queries were used to analyze portfolio and stock performance.

### Analysis Performed

* Average Closing Price by Stock
* Highest Closing Price
* Total Trading Volume
* Latest Market Price
* Portfolio Valuation
* Moving Average Analysis
* Day-over-Day Returns
* Profit Percentage Calculation
* Stock Volatility Analysis
* Bullish vs Bearish Signal Analysis

### SQL Concepts Used

* Aggregations
* Window Functions
* CTEs
* CASE Statements
* Joins
* Ranking Functions
* Subqueries

---

## Dashboard Features

### KPI Cards

* Current Portfolio Value
* Total Capital Invested
* Portfolio Return (%)
* Net Portfolio Profit
* Active Holdings
* Most Volatile Stock

### Visualizations

#### Stock Price Trend vs Moving Average

Tracks stock price movement against a 10-Day Moving Average to identify trends.

#### Trading Volume Analysis

Compares trading activity across different stocks.

#### Bullish vs Bearish Market Signals

Shows the proportion of bullish and bearish trading signals.

#### Risk & Volatility Analysis

Ranks stocks based on standard deviation and volatility.

#### Portfolio Holdings Summary

Displays current holdings, quantity, market value, and returns.

### Interactive Filters

* Stock Ticker
* Year Selection

---

## Key Insights

### Portfolio Performance

* Current Portfolio Value: 6.39K
* Total Capital Invested: 3.76K
* Net Portfolio Profit: 2.63K
* Portfolio Return: 69.95%

### Risk Analysis

* TSLA was identified as the most volatile stock.
* Higher volatility stocks contributed more risk to the portfolio.

### Market Analysis

* Trading volume varied significantly between holdings.
* Moving averages helped identify trend reversals and momentum.

---

## What I Learned

Through this project I gained practical experience in:

* SQL Query Writing
* Window Functions
* Data Analysis
* Portfolio Analytics
* DAX Measures
* Power BI Dashboard Design
* Data Storytelling
* Business Intelligence Reporting

---

## Future Improvements

Planned future enhancements include:

* Real-Time Stock Data Integration
* Portfolio Optimization Analysis
* Sharpe Ratio Calculation
* Risk-Adjusted Return Metrics
* Stock Price Prediction Models
* Machine Learning-Based Trend Analysis

---

## Why I Built This Project

I built this project to improve my skills in data analytics and business intelligence while working on a real-world financial use case.

The project helped me understand how raw financial data can be transformed into meaningful insights using SQL, Python, and Power BI.

---

## Author

### Vinayak Tanwar

Aspiring Data Analyst

Skills:

* SQL
* Python
* Pandas
* Power BI
* DAX
* Data Analytics

Currently building real-world analytics projects to strengthen my skills in business intelligence, dashboard development, and data-driven decision making.


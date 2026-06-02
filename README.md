# Amazon_Sales_Analysis_SQL
SQL Data Analysis Project on Amazon Sales Data using MySQL. This project involves data cleaning, feature engineering, exploratory data analysis, and solving 28 real-world business problems using SQL queries, window functions, CTEs, aggregations, and business insights visualization.
# 🛒 Amazon Sales Analysis using SQL

<p align="center">
  <b>End-to-End SQL Data Analytics Project using MySQL</b>
</p>

---

# 📌 Project Overview

This project analyzes Amazon sales transaction data using **MySQL** to uncover valuable business insights related to:

✔️ Product performance
✔️ Sales trends
✔️ Customer behavior
✔️ Revenue generation
✔️ Customer satisfaction

The project demonstrates practical SQL skills including:

* Data Cleaning
* Feature Engineering
* Exploratory Data Analysis (EDA)
* SQL Aggregations
* Window Functions
* Common Table Expressions (CTEs)
* Business Insight Generation

---

# 📂 Dataset Information

The dataset contains sales transactions from Amazon branches located in:

📍 Yangon
📍 Mandalay
📍 Naypyitaw

---

## 📊 Dataset Summary

| Feature                | Details |
| ---------------------- | ------- |
| 📑 Total Records       | 1,000   |
| 📊 Total Columns       | 17      |
| 🏬 Branches            | 3       |
| 🛍️ Product Categories | 6       |
| 💳 Payment Methods     | 3       |

---

# 🧾 Dataset Columns

* Invoice ID
* Branch
* City
* Customer Type
* Gender
* Product Line
* Unit Price
* Quantity
* VAT
* Total
* Date
* Time
* Payment Method
* Gross Income
* Rating

---

# 🛠️ Tools & Technologies

## 💻 Database

* 🐬 MySQL

## 📌 Concepts Used

* SQL Queries
* GROUP BY & HAVING
* Aggregate Functions
* CASE Statements
* Window Functions
* RANK()
* Common Table Expressions (CTEs)
* Subqueries
* Feature Engineering

## 🧰 Development Environment

* MySQL Workbench

---

# ⚙️ Project Workflow

## 1️⃣ Data Wrangling

* Created database and sales table
* Applied `NOT NULL` constraints
* Imported and validated dataset
* Verified data consistency

---

## 2️⃣ Feature Engineering

Created additional analytical columns:

| New Column    | Purpose                                 |
| ------------- | --------------------------------------- |
| `time_of_day` | Analyze Morning/Afternoon/Evening sales |
| `day_name`    | Identify busiest weekdays               |
| `month_name`  | Monthly revenue analysis                |

---

## 3️⃣ Exploratory Data Analysis (EDA)

Performed analysis to answer real-world business questions involving:

✅ Sales Performance
✅ Customer Trends
✅ Product Analysis
✅ Revenue Insights
✅ Tax Analysis
✅ Ratings & Customer Satisfaction

---

# 🧠 Business Questions Solved

This project answers **28 business problems** using SQL, including:

* Most preferred payment method
* Highest revenue-generating product line
* City with highest revenue
* Best-performing customer type
* Product line with highest VAT
* Revenue by month
* Customer purchase behavior
* Gender distribution across branches
* Peak sales periods
* Highest-rated product categories

---

# 📊 SQL Concepts Demonstrated

| SQL Skill           | Usage                                |
| ------------------- | ------------------------------------ |
| GROUP BY            | Revenue & sales aggregation          |
| CASE WHEN           | Product performance classification   |
| Window Functions    | Ranking product/category performance |
| CTEs                | Advanced analytical queries          |
| Aggregate Functions | Revenue, ratings, VAT analysis       |
| Subqueries          | Comparison against averages          |

---

# 📈 Key Business Insights

## 💰 Sales & Revenue Insights

* 🏆 Food & Beverages generated the highest revenue
* 🌆 Naypyitaw recorded the highest total sales
* 💳 E-wallet was the most used payment method
* 🕒 Afternoon sales dominated across weekdays

---

## 👥 Customer Insights

* 👤 Member customers contributed the highest revenue
* 👩 Female customers slightly outnumbered male customers
* 🔁 Repeat buyers showed strong purchasing behavior
* ⭐ Member customers contributed higher VAT payments

---

## 🛍️ Product Insights

* 📦 Electronic Accessories recorded the highest sales quantity
* ⭐ Food & Beverages received the highest customer ratings
* 🎯 Product preferences varied across genders
* 💸 Certain product lines showed heavy discount dependency

---

## 📅 Operational Insights

* 📌 Monday and Friday received the highest average ratings
* 🚚 Afternoon was the busiest transaction period
* 📊 Customer ratings varied by branch and time of day.

-- Create and select the working database
CREATE DATABASE IF NOT EXISTS amazon;
USE amazon;
SELECT * FROM sales;

-- Add 3 new columns Time_of_day,Day_name,Month_name
ALTER TABLE sales
MODIFY COLUMN time TIME;

ALTER TABLE sales
ADD COLUMN time_of_day VARCHAR(20);

UPDATE sales
SET time_of_day = (
    CASE
        WHEN time BETWEEN '00:00:00' AND '11:59:59' THEN 'Morning'
        WHEN time BETWEEN '12:00:00' AND '17:59:59' THEN 'Afternoon'
        ELSE 'Evening'
    END
);

 -- ADD NEW COLUMN dayname

ALTER TABLE sales
ADD COLUMN dayname VARCHAR(10) NOT NULL;

UPDATE sales
SET dayname = DAYNAME(date);
SELECT date, dayname FROM sales LIMIT 5;

-- ADD NEW COLUMN monthname
ALTER TABLE sales
ADD COLUMN monthname VARCHAR(20) NOT NULL;

UPDATE sales
SET monthname= MONTHNAME(date);
select date,monthname from sales limit 5;

### 1.	What is the count of distinct cities in the dataset?

select count(distinct city) as count_of_distinct_cities
from sales;

--  3 distinct cities 

### 2.	For each branch, what is the corresponding city?

SELECT distinct branch, city
from sales
order by branch;


### 3.	What is the count of distinct product lines in the dataset?

SELECT count(distinct `product line`) as Distinct_product_lines
FROM sales;

### 4.	Which payment method occurs most frequently?

SELECT payment,count(*) as frequency
from sales
group by payment
order by frequency desc
limit 1;
# Ewallet- 345 transactions is the most frequently used payment method 

## 5.	Which product line has the highest sales?

SELECT `product line`,SUM(quantity) AS total_units_sold
FROM sales
GROUP BY `product line`
ORDER BY total_units_sold DESC
limit 1;
## Electronic accessories has the highest sales with 971 units sold.

###6.	How much revenue is generated each month?

SELECT monthname,ROUND(SUM(total), 2) as revenue
from sales
group by monthname
order by FIELD(monthname, 'January','February','March');

## January = $116,291.87,February = $97,219.37 ,March = $109,455.51 are the revenue generated for the respective months.

## 7.In which month did the cost of goods sold reach its peak?

SELECT monthname, Round(SUM(cogs),2) AS total_cogs
FROM sales
GROUP BY monthname
ORDER BY total_cogs DESC
LIMIT 1;
## Cost of goods(cogs) reach its peak in the month od January=$110754.16

## 8.Which product line generated the highest revenue?

Select `product line`,round(sum(total),2) as Total_Revenue
from sales 
group by `product line`
order by Total_Revenue DESC
limit 1;
## Food and beverages generated the highest revenue of $56144.84.

## 9.In which city was the highest revenue recorded?

Select city,round(sum(total),2) as Total_Revenue
from sales
group by city
order by Total_Revenue DESC
limit 1;
## Naypyitaw generated the highest revenue of $110568.71

## 10. Which product line incurred the highest Value Added Tax?

SELECT `product line`, ROUND(SUM(`tax 5%`), 2) AS total_vat
FROM sales
GROUP BY `product line`
ORDER BY total_vat DESC
limit 1;
## Food and beverage incurred the highest Vat of $2673.56.

## 11.	For each product line, add a column indicating "Good" if its sales are above average, otherwise "Bad."

SELECT `product line`,
       ROUND(AVG(total), 2) AS avg_sales,
       CASE
           WHEN AVG(total) > (SELECT AVG(total) FROM sales)
           THEN 'Good'
           ELSE 'Bad'
       END AS performance
FROM sales
GROUP BY `product line`
ORDER BY avg_sales DESC;
## Good: Health and beauty, Home and lifestyle, Sports and travel

## 12. Identify the branch that exceeded the average number of products sold.

SELECT branch, ROUND(AVG(quantity), 2) AS avg_qty_sold
FROM sales
GROUP BY branch
HAVING AVG(quantity) > (SELECT AVG(quantity) FROM sales)
ORDER BY avg_qty_sold DESC;
## Branch C (Naypyitaw) — avg 5.58 items/transaction, exceeds overall avg of 5.51.

## 13.	Which product line is most frequently associated with each gender?

SELECT gender, `product line`, cnt AS purchase_count
FROM (
    SELECT gender,
           `product line`,
           COUNT(*) AS cnt,
           RANK() OVER (PARTITION BY gender ORDER BY COUNT(*) DESC) AS rnk
    FROM sales
    GROUP BY gender, `product line`
) ranked
WHERE rnk = 1;
## Female - Fashion accessories, Male - Health and beauty are the product line associated with each gender.

## 14. Calculate the average rating for each product line.

Select `product line`, Round(Avg(rating),2) as Average_rating
from sales
group by `product line`;
## Food and beverages tops with 7.11 avg rating.

## 15.Count the sales occurrences for each time of day on every weekday

SELECT dayname,
       time_of_day,
       COUNT(*) AS num_sales
FROM sales
GROUP BY dayname, time_of_day
ORDER BY FIELD(dayname,'Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'),
         FIELD(time_of_day,'Morning','Afternoon','Evening');
##  Afternoon is the busiest period every day. Saturday & Wednesday peak at 81 afternoon sales

## 16. Identify the customer type contributing the highest revenue 

Select `customer type`,round(sum(total),2) as Highest_revenue
from sales
group by `customer type`
order by Highest_revenue DESC
limit 1;      
## Member customers contribute the highest with $164,223.44 in total revenue  

## 17.	Determine the city with the highest VAT percentage

Select city, round(avg(`Tax 5%`),2) as Highest_vat_percentage
from sales
group by city
order by Highest_vat_percentage DESC
limit 1;
## Naypyitaw — highest VAT at 16.05%

## 18.Identify the customer type with the highest VAT payments.

Select `Customer type`,round(sum(`tax 5%`)) as total_vat
from sales
group by `customer type`
order by total_vat DESC
limit 1;
## Member — $7,820.16 in total VAT payments

## 19.What is the count of distinct customer types in the dataset?

Select count(distinct(`customer type`)) as distinct_customer_types
from sales;
## two distinct customer types-Normal,Memeber

## 20. What is the count of distinct payment methods in the dataset?

Select count(distinct payment) as distinct_payment_methods
from sales;
 ## 3 distinct payment methods — Ewallet, Cash, Credit card.
 
 ## 21.	Which customer type occurs most frequently?
 
 Select `customer type`,count(*) as frequency
 from sales
 group by `customer type`
 order by frequency DESC
 limit 1;
 ## Member — 501 occurrences (most frequent customer type).
 
 ## 22.	Identify the customer type with the highest purchase frequency.

 Select `customer type`,count(*) as purchase_count
 from sales
 group by `customer type`
 order by purchase_count DESC
 limit 1;
 
 ## 23. Determine the predominant gender among customers.
 
 select gender,count(*) as gender_count
 from sales
 group by gender
 order by gender_count DESC;
 ## Female — 501 customers is the predominant gender.
 
 ## 24.	Examine the distribution of genders within each branch
 
 Select branch,gender,count(*) as count
 from sales
 group by branch,gender
 order by gender,branch;
 ## Branch A & B: Male-majority. Branch C: Female-majority 
 
 ## 25.	Identify the time of day when customers provide the most ratings
 
 Select time_of_day, count(rating) as rating_count
 from sales
 group by time_of_day
 order by rating_count DESC;
 ## Afternoon-528 is when customers provide most ratings
 
 ## 26.	Determine the time of day with the highest customer ratings for each branch.

SELECT branch,
       time_of_day,
       avg_rating
FROM (
    SELECT branch,
           time_of_day,
           ROUND(avg(rating), 2) AS avg_rating,
           RANK() OVER (
               PARTITION BY branch
               ORDER BY AVG(rating) DESC
           ) AS rnk
    FROM sales
    GROUP BY branch, time_of_day
) ranked
WHERE rnk = 1;

## Branch A: Afternoon (7.06) | Branch B: Morning (6.89) | Branch C: Afternoon (7.10)

## 27.	Identify the day of the week with the highest average ratings

Select dayname, round(avg(rating),2) as avg_rating
from Sales
group by dayname
order by avg_rating DESC
limit 1;
## Monday has the highest avg rating of 7.15 / 10

## 28. Determine the day of the week with the highest average ratings for each branch

WITH cte AS (
    SELECT dayname,
           branch,
           round(AVG(rating),2) AS avg_rating,
           RANK() OVER (
               PARTITION BY branch
               ORDER BY AVG(rating) DESC
           ) AS rnk
    FROM sales
    GROUP BY dayname, branch
)
SELECT dayname,
       branch,
       avg_rating
FROM cte
WHERE rnk = 1;
## Branch A: Friday (7.31) | Branch B: Monday (7.34) | Branch C: Friday (7.28)
         

 
 
 


         
         







 







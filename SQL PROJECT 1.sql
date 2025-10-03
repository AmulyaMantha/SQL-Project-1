---CREATE TABLE----
CREATE TABLE RETAIL_SALES (
transactions_id INT PRIMARY KEY,	
sale_date DATE,
sale_time TIME,
customer_id	INT,
gender VARCHAR(15),
age	INT,
category VARCHAR(15),
quantiy	INT,
price_per_unit FLOAT,
cogs FLOAT,
total_sale FLOAT);

SELECT*FROM RETAIL_SALES
DROP TABLE RETAIL_SALES
SELECT * FROM [dbo].[SQL - Retail Sales Analysis_utf ]
EXEC SP_RENAME "[dbo].[SQL - Retail Sales Analysis_utf ]","RETAIL_SALES"

--TO SEE HOW MANY RECORDS---
SELECT COUNT(*) FROM RETAIL_SALES

---TO FIND IF WE HAVE ANY NULLS----
SELECT*FROM RETAIL_SALES WHERE AGE IS NULL 
OR GENDER IS NULL
OR CATEGORY IS NULL
OR QUANTIY IS NULL
OR PRICE_PER_UNIT IS NULL 
OR COGS IS NULL OR TOTAL_SALE IS NULL

----DELETING NULL VALUES---
DELETE FROM RETAIL_SALES WHERE GENDER IS NULL
OR CATEGORY IS NULL
OR QUANTIY IS NULL
OR PRICE_PER_UNIT IS NULL 
OR COGS IS NULL OR TOTAL_SALE IS NULL

-----DATA EXPLORATION----

---HOW MANY SALES WE HAVE----


---HOW MANY CUSTOMERS WE HAVE---
SELECT COUNT(DISTINCT CUSTOMER_ID) FROM RETAIL_SALES

--HOW MANY UNIQUE CATEGORY---
SELECT COUNT(DISTINCT CATEGORY) FROM RETAIL_SALES

Q1) --WRITE SQL QUERY TO RETREIVE ALL THE COLUMNS FOR SALE MADE ON 2022-11-05---

SELECT * FROM RETAIL_SALES WHERE SALE_date = '2022-11-05'

q2) -- write a sql query to retreive all the transactions where category is 'clothing'
and the qt sold is more than 10 in month of nov 22

SELECT * FROM RETAIL_SALES WHERE CATEGORY = 'CLOTHING'
AND MONTH(SALE_DATE) = 11 
AND YEAR(SALE_DATE) = 2022 AND QUANTIY>=4

Q30 ---WRITE A querry to calculate total sales and qty for each category---

select category,
sum(total_sale) as net_sales, count(quantiy) as net_qty from retail_sales group by category

q4) ---avg age from each category---
select category, avg(age) as avg_age from retail_sales group by category

q5) ---- where total sale is greater that 1000

select * from retail_sales where total_sale > 1000

q6) ---write query to find out the total number of transactions made by each gender in each category

select category, gender, count(quantiy) as net_qty from retail_sales group by category, gender

q7) ---- write a sql query to calculate average sale for each month in each year---

SELECT
    YEAR(sale_date) AS sales_year,
    MONTH(sale_date) AS sales_month,
    AVG(total_sale) AS average_monthly_sale
FROM
    retail_sales
GROUP BY
    YEAR(sale_date),
    MONTH(sale_date)
    order by sales_year, average_monthly_sale desc

    q8) -----top 5 customers based on total sales---

    select customer_id, sum(total_sale) as net_sale from retail_sales group by customer_id
    order by net_sale desc 

    q9)---write a query to find out the number of unique customers from each category---
    
    select category,count (customer_id)from retail_sales group by category

    q10)---write query to create each shift and number of orders----
    select sale_time,datepart (hour, sale_time) as sale_hour, sum(total_sale) as net_sale
  from retail_sales group by sale_time order by sale_time
    

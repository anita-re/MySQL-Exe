SELECT SUM(total_price) AS Total_Revenue from pizza_sales
SELECT * from pizza_sales

SELECT SUM(total_price)/COUNT(DISTINCT order_id) AS AOV from pizza_sales
SELECT SUM(quantity) AS Total_Pizzas_Sold from pizza_sales
SELECT COUNT(DISTINCT order_id) AS Total_Order from pizza_sales
SELECT SUM(quantity) / COUNT(DISTINCT order_id) AS APO from pizza_sales
SELECT CAST(SUM(quantity) AS decimal(10,2) / COUNT(DISTINCT order_id) AS APO from pizza_sales

SELECT * from [Pizza DB].dbo.pizza_sales
SELECT CAST(SUM(quantity) AS decimal(10,2)) / CAST(COUNT(DISTINCT order_id) AS decimal(10,2)) AS APO FROM [Pizza DB].dbo.pizza_sales
--- Daily Trend
SELECT DATENAME(DW, order_date) as order_day, COUNT(Distinct order_id) AS Total_orders from [Pizza DB].dbo.pizza_sales
GROUP BY DATENAME(DW, order_date)
--- Hourly Trend
SELECT DATEPART(HOUR, order_time) as order_hours, COUNT(Distinct order_id) AS Total_orders from [Pizza DB].dbo.pizza_sales
GROUP BY DATEPART(HOUR, order_time)
ORDER BY DATEPART(HOUR, order_time)
--- Percentage Pizza Sales
SELECT pizza_category, SUM(total_price)*100 / (SELECT SUM(total_price) from [Pizza DB].dbo.pizza_sales) AS Total_Sales from [Pizza DB].dbo.pizza_sales
GROUP BY pizza_category

SELECT pizza_category, SUM(total_price)*100 / (SELECT SUM(total_price) from [Pizza DB].dbo.pizza_sales) AS Total_Sales from [Pizza DB].dbo.pizza_sales
WHERE MONTH(order_date) = 1
GROUP BY pizza_category

SELECT pizza_category, sum(total_price) AS Total_Sales, SUM(total_price)*100 / (SELECT SUM(total_price) from [Pizza DB].dbo.pizza_sales WHERE MONTH(order_date) = 1) AS PCT from [Pizza DB].dbo.pizza_sales
WHERE MONTH(order_date) = 1
GROUP BY pizza_category

SELECT pizza_size, SUM(total_price) AS Total_Sales, SUM(total_price)*100 / (SELECT SUM(total_price) from [Pizza DB].dbo.pizza_sales) AS PCT from [Pizza DB].dbo.pizza_sales
GROUP BY pizza_size

SELECT pizza_size, SUM(total_price) AS Total_Sales, SUM(total_price)*100 / (SELECT SUM(total_price) from [Pizza DB].dbo.pizza_sales) AS PCT from [Pizza DB].dbo.pizza_sales
GROUP BY pizza_size
ORDER BY PCT DESC

SELECT pizza_size, SUM(total_price) AS Total_Sales, CAST(SUM(total_price)*100 / (SELECT SUM(total_price) from [Pizza DB].dbo.pizza_sales) AS decimal(10,2)) AS PCT from [Pizza DB].dbo.pizza_sales
GROUP BY pizza_size
ORDER BY PCT DESC

SELECT pizza_size, CAST(SUM(total_price) AS decimal(10,2)) AS Total_Sales, CAST(SUM(total_price)*100 / (SELECT SUM(total_price) 
from [Pizza DB].dbo.pizza_sales) AS decimal(10,2)) AS PCT 
from [Pizza DB].dbo.pizza_sales
GROUP BY pizza_size
ORDER BY PCT DESC

SELECT pizza_category, SUM(quantity) As Total_Pizzas_Sold from [Pizza DB].dbo.pizza_sales 
GROUP BY pizza_category

SELECT TOP 5 pizza_name, SUM(quantity)AS Total_Pizzas_Sold
from [Pizza DB].dbo.pizza_sales
GROUP BY pizza_name
ORDER BY SUM(quantity) DESC

SELECT TOP 5 pizza_name, SUM(quantity)AS Total_Pizzas_Sold
from [Pizza DB].dbo.pizza_sales
GROUP BY pizza_name
ORDER BY SUM(quantity) ASC
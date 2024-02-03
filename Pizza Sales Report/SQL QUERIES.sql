
--KPI's

--1. Total revenue
SELECT SUM(total_price) as Total_revenue
FROM pizza_sales

--2. Average Order Value
SELECT SUM(total_price)/COUNT(DISTINCT(order_id)) as avg_order_value
FROM pizza_sales

--3. Total Pizzas Sold
SELECT SUM(quantity) as total_sold
FROM pizza_sales

--4. Total Orders
SELECT COUNT(DISTINCT(order_id)) as order_count
FROM pizza_sales

--5. Average Pizzas Per Order
SELECT CAST(CAST(SUM(quantity)AS DECIMAL (10,2)) / CAST(COUNT(DISTINCT(order_id))AS DECIMAL (10,2))  AS DECIMAL(10,2)) as avg_pizza_per_order
FROM pizza_sales



--CHARTS

--1. Daily Trend For Total Orders
SELECT DATENAME(DW,order_date) as Day_of_week , COUNT(DISTINCT(order_id)) as no_of_orders
FROM pizza_sales
GROUP BY DATENAME(DW,order_date)

--2. Monthly Trend For Total Orders
SELECT DATENAME(MONTH,order_date) as name_of_month , COUNT(DISTINCT(order_id)) as no_of_orders
FROM pizza_sales
GROUP BY DATENAME(MONTH,order_date)

--3. % Sales By Pizza Category
SELECT pizza_category, CAST(SUM(total_price) as DECIMAL(10,2)) as total_revenue , 
		CAST((SUM(total_price) / (SELECT SUM(total_price) FROM pizza_sales)) * 100 AS DECIMAL (10,2)) as Percent_of_sales
FROM pizza_sales
GROUP BY pizza_category

--4. % Sales By Pizza Size
SELECT pizza_size, CAST(SUM(total_price) as DECIMAL(10,2)) as total_revenue , 
		CAST((SUM(total_price) / (SELECT SUM(total_price) FROM pizza_sales)) * 100 AS DECIMAL (10,2)) as Percent_of_sales
FROM pizza_sales
GROUP BY pizza_size
ORDER BY Percent_of_sales DESC

--5. Total Pizza sold by pizza category
SELECT pizza_category,SUM(quantity) as Total_pizzas_sold
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Total_pizzas_sold DESC

--6. Top 5 best pizzas by revenue
SELECT TOP 5 pizza_name,SUM(total_price) as revenue_generated
FROM pizza_sales
GROUP BY pizza_name
ORDER BY revenue_generated DESC 

--7. Bottom 5 best pizzas by revenue
SELECT TOP 5 pizza_name,SUM(total_price) as revenue_generated
FROM pizza_sales
GROUP BY pizza_name
ORDER BY revenue_generated ASC

--8. Top 5 best pizzas by quantity
SELECT TOP 5 pizza_name,SUM(quantity) as quantity_ordered
FROM pizza_sales
GROUP BY pizza_name
ORDER BY quantity_ordered DESC 

--9. Bottom 5 best pizzas by quantity
SELECT TOP 5 pizza_name,SUM(quantity) as quantity_ordered
FROM pizza_sales
GROUP BY pizza_name
ORDER BY quantity_ordered ASC

--10. Top 5 best pizzas by total orders
SELECT TOP 5 pizza_name,COUNT(DISTINCT order_id) as Total_orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_orders DESC 

--11. Bottom 5 best pizzas by total orders
SELECT TOP 5 pizza_name,COUNT(DISTINCT order_id) as Total_orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_orders ASC

SELECT TOP 5 pizza_name,COUNT(DISTINCT order_id) as Total_orders,pizza_category
FROM pizza_sales
WHERE pizza_category = 'Classic'
GROUP BY pizza_name,pizza_category
ORDER BY Total_orders ASC

SELECT * FROM pizza_sales
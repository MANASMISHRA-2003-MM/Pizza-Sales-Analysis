use pizza_projects;

use pizza_projects;

SELECT * FROM pizzasales;
use pizza_projects;

-- 1. Total Revenue of pizza
SELECT SUM(total_price) AS total_revenue
FROM pizzasales;


 -- 2. Total Orders of pizza
 SELECT Count(distinct order_id) 
 from pizzasales;
 

-- 3. Total Pizza Sold
select sum(quantity) from pizzasales;

-- 4. Average Order Value
select avg(total_price)/count(distinct order_id) from pizzasales;


-- 5. Average Pizza Price
select avg(unit_price) from pizzasales;

-- 6. Top 10 Selling Pizza
select pizza_name, sum(quantity) from pizzasales
group by pizza_name
order by sum(quantity) DESC
limit 10;


-- 7  top 6 highest revenue pizza
select  pizza_name ,sum(total_price) from pizzasales
group by pizza_name
order by sum(total_price) DESC
LIMIT 10;

-- 8. Category Revenue
select pizza_category, sum(total_price) from pizzasales
group by pizza_category
order by sum(total_price) DESC;


-- 9. Size Revenue
SELECT pizza_size , sum(total_price) from pizzasales
group by pizza_size
order by sum(total_price) DESC;

-- 10.  Highest Sales Month
SELECT month, sum(total_price) from pizzasales
group by month;


-- 11 Which Pizza Generated the Highest Margin?
SELECT pizza_name, sum(margin) as margin from pizzasales
group by pizza_name
order by sum(margin) DESC;


-- 12. During Which Hour were Maximum Sales Generated?
SELECT 
HOUR(order_time) AS sales_hour,
SUM(total_price) AS revenue
FROM pizzasales
GROUP BY HOUR(order_time)
ORDER BY revenue DESC;

-- 13.  Which Day Received Maximum Orders?
SELECT day, max(distinct order_id) as max_order from  pizzasales
group by day
order by max(distinct order_id) DESC;

--  Which Month Recorded Highest Sales?
select month, sum(total_price) from pizzasales
group by month
order by sum(total_price) DESC;

-- 14. Which Pizzas had Lowest Sales?
SELECT pizza_name,
SUM(quantity) AS total_quantity
FROM pizzasales
GROUP BY pizza_name
ORDER BY total_quantity ASC
LIMIT 10;

use pizza_projects;

-- 15. Show Revenue Trend Month Wise.
SELECT month,
SUM(total_price) AS revenue
FROM pizzasales
GROUP BY month
ORDER BY MIN(order_date);
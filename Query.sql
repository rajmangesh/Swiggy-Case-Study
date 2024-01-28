use swiggy_case_study;

-- 1. Find customers who have never ordered
SELECT name FROM users
WHERE user_id NOT IN (SELECT user_id FROM orders);

-- 2. Average Price/dish
SELECT m.f_id, f.f_name , round(AVG(m.price),2) as Avg_Price FROM menu as m JOIN food AS f
ON m.f_id = f.f_id
GROUP BY m.f_id;

-- 3. Find the top restaurant in terms of the number of orders for a given month.
SELECT  o.r_id, count(*) as Total_Orders ,r.r_name , monthname(o.date) AS 'Month' 
FROM orders as o join restaurants as r ON o.r_id = r.r_id
WHERE MONTHNAME(date) LIKE 'July'
GROUP BY o.r_id
ORDER BY Total_Orders desc
limit 1;


-- 4. Restaurants with monthly sales greater than x for 
SELECT o.r_id,r.r_name ,MONTHNAME(date) as 'Month', sum(o.amount) as Total_Revenue 
FROM orders as o JOIN restaurants as r ON o.r_id = r.r_id
WHERE MONTHNAME(date) LIKE 'June' 
GROUP BY r_id
HAVING Total_Revenue > 400;

-- 5. Show all orders with order details for a particular customer in a particular date range
SELECT o.order_id, r.r_name,od.f_id,f.f_name
FROM orders as o 
JOIN restaurants as r ON o.r_id = r.r_id
JOIN order_details as od ON o.order_id = od.order_id
JOIN food as f ON f.f_id = od.f_id
WHERE o.user_id = (SELECT user_id FROM users WHERE name LIKE 'Ankit') AND
(date >'2022-06-10' AND date < '2022-07-10');


-- 6. Find restaurants with max repeated customers 
SELECT r.r_name, t.r_id, COUNT(*) as visit
FROM(SELECT  user_id , r_id, count(*) as total_Visits
	FROM orders 
	GROUP BY user_id, r_id
	HAVING total_Visits > 1) as t
    JOIN restaurants as r ON r.r_id = t.r_id
GROUP BY r.r_id
ORDER BY visit DESC;

-- 7. Month over month revenue growth of swiggy
SELECT MONTHNAME(date) as month, sum(amount)as revenue
FROM orders
GROUP BY month
ORDER BY month(date);

-- 8. Customer - favorite food
SELECT u.name, f.f_id, f.f_name, COUNT(o.user_id) as Total_orders
FROM users as u
JOIN orders as o ON u.user_id = o.user_id
JOIN order_details as od ON od.order_id = o.order_id
JOIN food as f ON f.f_id = od.f_id
GROUP BY o.user_id



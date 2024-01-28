# Swiggy Case Study


## Overview
This case study analyzes mock data for the food delivery company Swiggy. The goals of the analysis are to:

- Demonstrate MySQL skills
- Provide insights into customers, restaurants, orders, and revenue

## Data
The data includes mock information on customers, restaurants, orders, and order details. Key fields include:

1. Food - f_id, f_name, type
2. menu - menu_id, r_id, f_id, price
3. order_details - id, order_id, f_id
4. order - order_id, user_id, r_id, amount, date, partner_id, delivery_time, delivery_rating, restaurent_rating
5. restaurents - r_id, r_name, cuisine
6. users - user_id, name, email, password

## Analysis
The following analyses were performed on the data:
1. Find customers who have never ordered
2. Calculate the average price per dish
3. Identify the top restaurant in terms of number of orders for a given month.
4. Find restaurants with monthly sales greater than a threshold.
5. Show all orders for a customer in a date range.
6. Determine restaurants with the most repeat customers.
7. Calculate month-over-month revenue growth for Swiggy.
8. Find each customer's favorite food item.
   
The SQL code for each analysis is provided in the querie.sql file.

## MySQL Skills Demonstrated
This case study exemplifies MySQL skills including:
- JOINs to connect data from multiple tables
- Aggregate functions like COUNT, SUM, AVG
- DATE functions to analyze by time period
- Subqueries 
- Basic data cleaning and transformations

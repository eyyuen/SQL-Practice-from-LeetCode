-- Problem: Immediate Food Delivery II
-- Source: LeetCode
-- Difficulty: Medium

-- Description: 
-- Write a solution to find the percentage of immediate orders in the first orders of all customers, rounded to 2 decimal places.

select round(avg(order_date = customer_pref_delivery_date)*100, 2) as immediate_percentage
from delivery 
where (customer_id, order_date) in
(	select customer_id, min(order_Date)
	from delivery 
	group by customer_id 
)
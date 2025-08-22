-- Problem: Sales Person
-- Source: LeetCode
-- Difficulty: Easy

-- Description:
-- Write a solution to find the names of all the salespersons who did not have any orders related to the company with the name "RED".

select s.name
from salesperson s
where s.sales_id not in 
(
	select o.sales_id 
	from orders o join company c on o.com_id=c.com_id
	where c.name = 'Red'
    ) 
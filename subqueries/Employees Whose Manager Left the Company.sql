-- Problem: Employees Whose Manager Left the Company
-- Source: LeetCode
-- Difficulty: Easy

-- Description:
-- Find the IDs of the employees whose salary is strictly less than $30000 and whose manager left the company. When a manager leaves the company, their information is deleted from the Employees table, but the reports still have their manager_id set to the manager that left.


select employee_id
from employees
where salary < 30000 and manager_id is not null and employee_id not in  
	(
	select t2.employee_id
	from employees t1 join employees t2 on t1.employee_id=t2.manager_id 
	)
order by employee_id
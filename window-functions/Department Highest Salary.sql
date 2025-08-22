-- Problem: Department Highest Salary
-- Source: LeetCode
-- Difficulty: Medium

-- Description: 
-- Write a solution to find employees who have the highest salary in each of the departments.

select Department, Employee, Salary
from
    (select d.name as Department, e.name as Employee, e.salary as Salary,
    dense_rank() over (partition by e.departmentId order by e.salary desc) as rnk
    from employee e left join department d on e.departmentId=d.id) as table2
where rnk = 1
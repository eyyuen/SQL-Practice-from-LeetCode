-- Problem: Find Overbooked Employees
-- Source: LeetCode
-- Difficulty: Medium

-- Description:
-- Write a solution to find employees who are meeting-heavy - employees who spend more than 50% of their working time in meetings during any given week.
-- Topics: JOIN + Subquery (Derived Table)

select 
e.employee_id,
e.employee_name, 
e.department,
count(*) as meeting_heavy_weeks
from employees e 
join (
    select 
    employee_id, 
    year(meeting_date) as year,
    week(meeting_date, 1) as week,
    sum(duration_hours) as totalhours
    from meetings 
    group by employee_id, year(meeting_date), week(meeting_date,1)
    having sum(duration_hours) > 20 ) t
on e.employee_id=t.employee_id
group by e.employee_id, e.employee_name, e.department
having count(*) >= 2
order by meeting_heavy_weeks desc, e.employee_name
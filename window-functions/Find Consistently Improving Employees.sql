-- Problem: Find Consistently Improving Employees
-- Source: LeetCode
-- Difficulty: Medium

-- Description:
-- Write a solution to find employees who have consistently improved their performance over their last three reviews.

select 
distinct employee_id,
name,
rating-prevprev_rating  as improvement_score
from
    (select 
    pr.employee_id,
    e.name,
    pr.review_date,
    pr.rating,
    lag(pr.rating, 1) over (partition by pr.employee_id order by pr.review_date) as second_rating,
    lag(pr.rating, 2) over (partition by pr.employee_id order by pr.review_date) as third_rating,
    rank() over (partition by pr.employee_id order by pr.review_date desc) as daterank
    from performance_reviews pr join employees e on pr.employee_id=e.employee_id) t
where rating > second_rating and second_rating > third_rating and daterank = 1 
order by improvement_score desc, name asc

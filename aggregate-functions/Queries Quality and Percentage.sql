-- Problem: Queries Quality and Percentage
-- Source: LeetCode
-- Difficulty: Easy

-- Description:
-- Write a solution to find each query_name, the quality and poor_query_percentage.

select 
query_name,
round(avg(rating/position), 2) as quality, 
round(avg(rating<3)*100, 2) as poor_query_percentage
from queries
group by query_name
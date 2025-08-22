-- Problem: Monthly Transactions I
-- Source: LeetCode
-- Difficulty: Medium

-- Description: 
-- Write an SQL query to find for each month and country, the number of transactions and their total amount, the number of approved transactions and their total amount.

select 
DATE_FORMAT(trans_date, '%Y-%m') AS month,
country,
count(state) as trans_count,
sum(state = 'approved') as approved_count,
sum(amount) as trans_total_amount,
sum((state = 'approved')* amount) as approved_total_amount
from Transactions
group by month, country
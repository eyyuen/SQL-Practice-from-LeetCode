-- Problem: Percentage of Users Attended a Contest
-- Source: LeetCode
-- Difficulty: Easy

-- Description:
-- Write a solution to find the percentage of the users registered in each contest rounded to two decimals.

SELECT 
  r.contest_id,
  round((COUNT(DISTINCT r.user_id) / total.total_users) * 100, 2) AS percentage
FROM register r
JOIN (
    SELECT COUNT(*) AS total_users FROM users
) AS total
GROUP BY r.contest_id
order by percentage desc, contest_id
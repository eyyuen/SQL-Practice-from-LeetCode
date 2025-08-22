-- Problem: Swap Salary
-- Source: LeetCode
-- Difficulty: Easy

-- Description:
-- Write a solution to swap all 'f' and 'm' values (i.e., change all 'f' values to 'm' and vice versa) with a single update statement and no intermediate temporary tables.

update salary 
set sex =
case 
when sex = 'f' then 'm'
else 'f'
end 
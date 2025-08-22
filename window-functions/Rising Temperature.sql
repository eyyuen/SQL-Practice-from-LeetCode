-- Problem: Rising Temperature
-- Source: LeetCode
-- Difficulty: Easy

-- Description:
-- Write a solution to find all dates' id with higher temperatures compared to its previous dates (yesterday). 

select id
from
(select id, 
recorddate,
temperature,
lag(temperature) over (order by recorddate) as previoustemp,
lag(recorddate) over (order by recorddate) as previousdate
from weather) as table2
where temperature > previoustemp and
recorddate = date_add(previousdate, interval 1 day)
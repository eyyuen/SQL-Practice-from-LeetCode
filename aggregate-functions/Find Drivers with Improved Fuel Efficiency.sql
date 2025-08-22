-- Problem: Find Drivers with Improved Fuel Efficiency
-- Source: LeetCode
-- Difficulty: Medium

-- Description:
-- Write a solution to find drivers whose fuel efficiency has improved by comparing their average fuel efficiency in the first half of the year with the second half of the year.

with first_half as (
    select 
    driver_id, 
    avg(distance_km / fuel_consumed) as first_half_avg
    from trips
    where month(trip_date) between 1 and 6
    group by driver_id
),
second_half as (
    select 
    driver_id, 
    avg(distance_km / fuel_consumed) as second_half_avg
    from trips
    where month(trip_date) between 7 and 12
    group by driver_id
)
    select
    d.driver_id,
    d.driver_name,
    round(f.first_half_avg, 2) as first_half_avg,
    round(s.second_half_avg, 2)as second_half_avg,
    round(s.second_half_avg-f.first_half_avg, 2) as efficiency_improvement
    from first_half f join second_half s 
    on f.driver_id = s.driver_id
    join drivers d on d.driver_id = f.driver_id
    where s.s.second_half_avg > f.first_half_avg
    order by efficiency_improvement desc, d.driver_name

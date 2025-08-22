-- Problem: Seasonal Sales Analysis
-- Source: LeetCode
-- Difficulty: Medium

-- Description: Write a solution to find the most popular product category for each season. 

select season, 
category, 
total_quantity, 
total_revenue 
from 
    (select
    case 
    when month(sale_date) in (12, 01, 02) then 'Winter'
    when month(sale_date)  in (03, 04, 05) then 'Spring'
    when month(sale_date)  in (06, 07, 08) then 'Summer'
    when month(sale_date) in (09, 10, 11) then 'Fall'
    end as season,
    category, 
    sum(quantity) as total_quantity,
    round(sum(quantity*price),2) as total_revenue,
    dense_rank() over 
        (partition by 
        case 
        when month(sale_date) in (12, 01, 02) then 'Winter'
        when month(sale_date)  in (03, 04, 05) then 'Spring'
        when month(sale_date)  in (06, 07, 08) then 'Summer'
        when month(sale_date) in (09, 10, 11) then 'Fall'
        end
        order by sum(quantity) desc, sum(quantity*price) desc) as rnk
    from sales s
    join products p on s.product_id=p.product_id 
    group by season, category ) t
	where rnk = 1 
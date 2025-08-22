-- Problem: Find Product Recommendation Pairs
-- Source: LeetCode
-- Difficulty: Medium

-- Description: Amazon wants to implement the Customers who bought this also bought... feature based on co-purchase patterns.

select a.product_id as product1_id,
b.product_id as product2_id,
p1.category as product1_category,
p2.category as product2_category,
count(a.user_id) as customer_count 
from ProductPurchases a
cross join ProductPurchases b
on a.product_id < b.product_id and a.user_id=b.user_id
join ProductInfo p1 on a.product_id=p1.product_id
join ProductInfo p2 on b.product_id=p2.product_id
group by product1_id, product2_id
having count(a.user_id) >=3
order by customer_count desc, product1_id asc, product2_id asc
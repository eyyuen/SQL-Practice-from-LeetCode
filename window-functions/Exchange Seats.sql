-- Problem: Exchange Seats
-- Source: LeetCode
-- Difficulty: Medium

-- Description: 
-- Write a solution to swap the seat id of every two consecutive students. If the number of students is odd, the id of the last student is not swapped.

    select id,
    case 
    when id % 2 = 1 then lead(student, 1, student) over (order by id asc)
    else lag(student, 1) over (order by id asc)
    end as student
    from seat
	order by id asc 
 Day 4 of SQL/
 
 Question:
 
 
Rank guests based on their ages.
Output the guest id along with the corresponding rank.
Order records by the age in descending order
 
 Solutuion:
 
select guest_id, rank()
over(order by age desc)
from airbnb_guests;

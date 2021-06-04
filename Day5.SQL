Day 5 of 30 days of sql/

Question:


Find the number of apartments per nationality that are owned by people under 30 years old.
Output the nationality along with the number of apartments.
Sort records by the apartments count in descending order.

Solution:

select ah.nationality, count(au.unit_type) 
from airbnb_hosts ah
join airbnb_units au
using(host_id)
where ah.age<30 and lower(au.unit_type) like 'apartment%'
group by 1
order by 2 desc;

Day 3 of SQL/

Question:

Find the number of businesses that are open on Sundays. Output the slot of operating hours along with the corresponding number of businesses open during those time slots. Order records by total number of businesses opened during those hours in descending order.

Solution:

select count(ybh.business_id), ybh.sunday
from yelp_business_hours as ybh
join yelp_business as yb on
ybh.business_id=yb.business_id
where ybh.sunday is not null and yb.is_open=1
group by ybh.sunday
order by 1 desc

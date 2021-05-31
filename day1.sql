

Day 1:

Find the number of inspections for each street name where a risk category value is assigned. Output the result along with the street name. Order the results based on the number of inspections in descending order.

It's hard to catch every variation of how street names are written but your code should skip street names that include only 1 letter like the street named 'b' in 295 B Orizaba Ave. The letter 'b' is an element of the "house number" and not the street name. Rather than extracting 'b', Orizaba should be returned.

table:

Solution:

select  count(inspection_id),
CASE
WHEN left(business_address, 1) ~ '[0-9]' THEN 
case when length(lower(split_part(business_address,' ',2)))=1 is TRUE then lower(split_part(business_address, ' ', 3))
else lower(split_part(business_address, ' ',2))
end
ELSE lower(split_part(business_address, ' ',1))
END AS number_of_risky_restaurants
from sf_restaurant_health_violations
where risk_category is  not null
group by 2
order by 1 desc, 2
;


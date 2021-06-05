Day 6 of 3o days of SQL/


Question:
Find the top 10 cities with the most 5 star businesses.
Output the city name along with the number of 5-star businesses.
Order records by the number of 5-star businesses in descending order.

Table:
business_id. varchar
name.      varchar
neighborhood.  varchar
address.  varchar
city.   varchar
state.  varchar
postal_code.  varchar
latitude.    float
longitude.  float
stars.   float
review_count. int
is_open. int
categories.  varchar

Solution:
select city, count(stars)
from yelp_business
where stars=5
group by 1
order by 2 desc;

Approach:
I did group by cities as I had to find multiple businesses in one city
and count on stars because I had to display stars of the business.
in Where clause, I used 5 because I had to find only 5 star businesses
and then order by 2 desc as I wanted to see the city with the most stars at the top

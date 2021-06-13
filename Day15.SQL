


Day 15 of #30daysofSQL//

Question:

Find the number of wines with and without designations per country.
Output the country along with the total without designations, total with designations, and the final total of both.


Table:

winemag_p2

id	int
country	varchar
description	varchar
designation		varchar
points			int
price		float
province		varchar
region_1		varchar
region_2			varchar
taster_name			varchar
taster_twitter_handle		varchar
title			varchar
variety			varchar
winery		varchar

Solution:
with cte as (select country,
sum(case 
when designation is null then 1 else 0 end )as total_without_designation,
sum(case 
when designation is not null then 1 else 0 end) as total_with_designation
from winemag_p2
group by 1)
select country,
total_without_designation, total_with_designation,
(total_with_designation+total_without_designation) as grand_total
from cte
;

Approach:

I used cte so that the code is cleaner and readable. 
Sum case is used as I have to output the new values in the new columns and grouped by the country because I have to find the winer per country

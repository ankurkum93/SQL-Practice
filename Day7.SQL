Day 7 of 30 days of SQL//

Question:
Find countries that are in winemag_p1 dataset but not in winemag_p2.
Output distinct country names.
Order records by the country in ascending order.

Table1: winemag_p1
Id. int
Country  varchar
Description. varchar
Designation. varchar
Points. int
Price. float
Province.  varchar
region_1. varchar
region_2. varchar
variety. varchar
winery. varchar

Table2 : winemag_p2
Id. int
Country  varchar
Description. varchar
Designation. varchar
Points. int
Price. float
Province.  varchar
region_1. varchar
region_2. Varchar
taster_name. varchar
taster_twitter_handle. varchar
title.  varchar
variety. varchar
winery. varchar

Solution:
select distinct wp1.country from winemag_p1 wp1
where wp1.country not in (select country from winemag_p2)
order by 1 ;

Approach:
I used distinct and order by as it is mentioned in the question
and not in because I wanted the countries which are only present in the first table.
Instead of using not in in where clause, I could have used except as well.



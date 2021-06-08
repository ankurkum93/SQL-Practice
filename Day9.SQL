Day 9 of #30daysofsql//



Question:

Find the number of speakers of each language by country. Output the country, language, and the corresponding number of speakers. Output the result based on the country in ascending order

Table:		playbook_events
user_id int
occurred_at datetime
event_type varchar
event_name varchar
location varchar
device varchar
Table:  	playbook_users
user_id int
created_at datetime
company_id int
language varchar
activated_at datetime
state varchar

Solution:
select location, language, count( distinct pe.user_id)
from playbook_events pe
join playbook_users pu using(user_id)
group by 1,2
order by 1;

Approach:

I used group by because we have to  output the speakers of each language by country.
Order by has been used because it is asked to sort the results based on country in asc order. I used distinct for user_id so that it counts unique users because of the join a few users were duplicated

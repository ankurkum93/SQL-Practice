Day 10 of #30daysofsql//



Question:

Write a query that'll identify returning active users. A returning active user is a user that has made a second purchase within 7 days of any other of their purchases. Output a list of user_ids of these returning active users.

amazon_transactions
id int
user_id int
item varchar
created_at datetime
revenue int

Solution:
with cte as(select user_id, created_at, lag(created_at,1) 
over(partition by user_id order by created_at) as som
from amazon_transactions
order by 1,2)
select distinct user_id from  cte
where created_at-som<=7
order by 1


Approach:
First, I visualized the table with user_id and created_at to see how it looks and then I used lag window function on created_at so that the data will be filled for particular partition of user_ids from the second line which will help me subtracting later. 
I then put it into cte as I only needed unique user_id to display and then I sorted by user_id as well

#sqlqueries #sql #dataanalytics #database #dailycoding #365daysofcode #databasedevelopment #datafam #sqlfamily #30daysofSQL #postgresql #sqlserver #dataanalysis #databasequeries #dailycoding #365daysofcode #66daysofdata #datasciences #365daysofsql #dailyposts #mysql #dataengineering

Day 23 of #30daysofSQL//

Question:
Find the 3-month rolling average of total revenue from purchases given a table with users, their purchase amount, and date purchased. Do not include returns which are represented by negative purchase values. Output the month and 3-month rolling average of revenue, sorted from earliest month to latest month.
A 3-month rolling average is defined by calculating the average total revenue from all user purchases for the current month and previous two months. The first two months will not be a true 3-month rolling average since we are not given data from last year.

amazon_purchases

user_id	int
created_at	datetime
purchase_amt	int


Solution:
with cte as (select to_char(created_at, 'YYYY-MM') as month, sum(purchase_amt) as su from amazon_purchases
where purchase_amt>0
group by 1
order by 1)

select month, avg(su) over(order by month ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)
from cte
;

approach:
I have used to_char to extract the month and the year and then summed up all the positive purchases 
I took average of all the summed up purchases and then did a rolling average of 3 months i.e., current month and 2 previous months.

#sqlqueries #sql #dataanalytics #database #dailycoding #365daysofcode #databasedevelopment #datafam #sqlfamily #30daysofSQL #postgresql #sqlserver #dataanalysis #databasequeries #dailycoding #365daysofcode #66daysofdata #datasciences #365daysofsql #dailyposts #mysql #dataengineering



	

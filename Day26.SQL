Day 26of #30daysofSQL//


Find the email activity rank for each user. Email activity rank is defined by the total number of emails sent. The user with the highest number of emails sent will have a rank of 1, and so on. Output the user, total emails, and their activity rank. Order records by the total emails in descending order. Sort users with the same rank score in alphabetical order.
In your rankings, return a unique value (i.e., a unique percentile) even if multiple users have the same number of emails.

google_gmail_emails

id	int
from_user	varchar
to_user	varchar
day	int


Solution:
with cte as (select from_user, count(from_user) as cn
from google_gmail_emails
group by 1
)select  from_user, cn, row_number() over (order by cn desc)
from cte
order by 2 desc
;




#sqlqueries #sql #dataanalytics #database #dailycoding #365daysofcode #databasedevelopment #datafam #sqlfamily #30daysofSQL #postgresql #sqlserver #dataanalysis #databasequeries #dailycoding #365daysofcode #66daysofdata #datasciences #365daysofsql #dailyposts #mysql #dataengineering

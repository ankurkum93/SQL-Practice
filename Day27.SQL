Day 27 of #30daysofSQL//

Question:

Find the best selling item for each month where the biggest total invoice was paid. The best selling item is calculated using the formula (unitprice * quantity). Output the description of the item along with the amount paid.


Table:

online_retail
invoiceno   varchar
stockcode   varchar
description varchar
quantity    int
invoicedate datetime
unitprice   float
customerid  float
country varchar


Solution:

with cte as (select to_char(invoicedate,'MM') as mon,description,sum(unitprice*quantity) as best, rank() over(partition by to_char(invoicedate,'MM') order by sum(unitprice*quantity)desc ) as rnk from online_retail
group by 1, description
order by 1 )

select mon, description, best
from cte
where rnk=1;

Approach:

I used to_char so as to only consider months from the entire date and rank window function so that I can rank the items by months.
I used a cte for clean code and then we wanted the bestselling item and hence I used rnk=1 to get the top item from every month.

#sqlqueries #sql #dataanalytics #database #dailycoding #365daysofcode #databasedevelopment #datafam #sqlfamily #30daysofSQL #postgresql #sqlserver #dataanalysis #databasequeries #dailycoding #365daysofcode #66daysofdata #datasciences #365daysofsql #dailyposts #mysql #dataengineering

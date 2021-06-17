Day 17 of #30daysofSQL//

Question:
Find "favorite" customers based on the order count and the total cost of orders.
A customer is considered as a favorite if he or she has placed more than 3 orders and with the total cost of orders more than $100. The `order_cost` column is the total cost of the order.
Output the customer's first name, city, number of orders, and total cost of orders.

Table:

customers
id 	int
first_name	varchar
last_name	varchar
city	varchar
address	varchar
phone_number	varchar
orders
id	int
cust_id	int
order_date	datetime
order_quantity	int
order_details	varchar
order_cost	int

Solution:
select first_name, city, count(order_quantity), sum(order_cost) from customers c
join orders o
on c.id=o.cust_id
group by 1,2
having sum(order_cost)>100 and count(order_quantity)>3 ;

Approach:

I have joined the table and then used aggregation & comparison in the having clause as it cannot be done with where 
as the field doesn't exist like that.
I use numeric notation in group by for legibility and clean code

#sqlqueries #sql #dataanalytics #database #dailycoding #365daysofcode #databasedevelopment #datafam #sqlfamily #30daysofSQL #postgresql #sqlserver #dataanalysis #databasequeries #dailycoding #365daysofcode #66daysofdata #datasciences #365daysofsql #dailyposts #mysql #dataengineering

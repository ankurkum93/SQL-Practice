/*What is the total amount each customer spent at the restaurant?*/
select customer_id, sum(price)
from menu m join
sales s using(product_id)
group by customer_id;

/*How many days has each customer visited the restaurant?*/

select customer_id, count(order_date) from sales s join menu m
using(product_id)
group by customer_id;

/*What was the first item from the menu purchased by each customer?*/
with cte as (select customer_id, product_name, order_date, dense_rank() over( partition by customer_id order by order_date) rankin
from sales s join menu m 
using(product_id)
group by 1,2,3)
select customer_id, product_name from cte 
where rankin=1;

/*What is the most purchased item on the menu and how many times was it purchased by all customers?*/
select product_name, count(order_date) from menu m join 
sales s using(product_id)
group by 1
order by 2 desc 
limit 1;

/*Which item was the most popular for each customer?*/
select customer_id,product_name , count(order_date)
from sales s join menu m 
using(product_id)
group by customer_id,2
order by 3 desc,1 desc
limit 3;
/*Which item was purchased first by the customer after they became a member?*/
with cte as (select s.customer_id, product_name, dense_rank() over(partition by customer_id order by order_date)  as rankig from  menu m
join sales s
on m.product_id=s.product_id
join members me on 
me.customer_id=s.customer_id
where order_date>join_date)
select customer_id, product_name from cte
where rankig=1;

/*Which item was purchased just before the customer became a member?*/
with cte as(select  s.customer_id,last_value(order_date) over(partition by customer_id order by order_date) as ranki, product_name from menu m 
join sales s
on m.product_id=s.product_id
join members me on 
me.customer_id=s.customer_id
where order_date<join_date)
select customer_id, product_name, max(ranki) from cte 
group by 1,2 ;

/*What is the total items and amount spent for each member before they became a member?*/
select count(product_name), sum(price), s.customer_id
from menu m 
join sales s
on m.product_id=s.product_id
join members me on 
me.customer_id=s.customer_id
where order_date<join_date
group by 3;

/*If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?*/
select distinct s.customer_id ,sum(
case when product_name like 'sushi' then 20*price 
else 10*price
end)as points 
 from menu m 
join sales s
on m.product_id=s.product_id
group by 1;

/*In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?*/

select s.customer_id, sum(
case when order_date=join_date  and order_date<=date_add(join_date, interval 7 day) then price*20
else price*10
end
) as points
from menu m join sales s on m.product_id=s.product_id
join members me on me.customer_id=s.customer_id
where order_date between '2021-01-01' and '2021-01-31'
group by 1

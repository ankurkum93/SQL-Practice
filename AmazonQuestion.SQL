Question:
1. two tables, orders and order_items.

Orders:
(PK: ORDER_ID)

ORDER_ID | ORDER_DATE | CUSTOMER_ID
xyz			1/1/2019	person_a
zzz			1/1/2019	person_b
...			...			...


Order_items: 
(PK: ORDER_ID, ITEM_ID)

ORDER_ID | ITEM_ID | QUANTITY
xyz			asin1		2
xyz			asin2		1
zzz			asin1		3
zzz			asin3		2
zzz			asin5		1
...			...			...



Write SQL which gives: 

a. date and order_Id for any orders with a quantity > 5

select O.order_date, oi.Order_id
from Orders o 
join Order_items oi
on O.Order_id=oi.Order_id
group by 2
having o.quantity>5
------------------------------------

SKU | Qty    |TOTAL
X      4      10000
a      21
b      20
c      34
d      5
e      18
------500k rows


Get the list of top selling SKUs that together make up 20% of total sold SK

Solution:

with cte as (Select Product_id, SKU, dense_rank() over( Order by SKU desc)
as new_Sku
from sales)

Select Product_id, SKU
from cte
where SKU>= (80/100)*new_sku
order by 2 desc

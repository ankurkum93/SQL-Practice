Question:

There is a table which contains Product_id and SKU and we need to give the top 20 % Product_id  based on the SKU.

Solution:

with cte as (Select Product_id, SKU, dense_rank() over( Order by SKU desc)
as new_Sku
from sales)

Select Product_id, SKU
from cte
where SKU>= (80/100)*new_sku
order by 2 desc

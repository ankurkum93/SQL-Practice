select OrderID, Sum(Quantity), Sum(price*Quantity) as Total
from TR_Products tp
join TR_OrderDetails td
on tp.ProductID = td.ProductID
group by 1
order by 1 desc
limit 5;


select ProductName, Sum(Quantity), Sum(price*Quantity) as Total
from TR_Products tp
join TR_OrderDetails td
on tp.ProductID = td.ProductID
group by 1
order by 1 desc
limit 5;



select ProductCategory, Sum(Quantity), Sum(price*Quantity) as Total
from TR_Products tp
join TR_OrderDetails td
on tp.ProductID = td.ProductID
group by 1
order by 1 desc
limit 5;

Select count(distinct PropertyCity), OrderID
from TR_PropertyInfo TI
join TR_OrderDetails TD
on TI.PropId=TD.PropertyID
group by 2


Select OrderID, PropertyID, ProductID, ProductCategory, 
Sum(Quantity) over (partition by OrderID), Sum(Quantity*Price) over(Partition b)

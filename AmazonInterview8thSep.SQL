//The below solutions seems to be correct as I have cleared this round of interview


----------------- TABLES ------------------------------------------

-- Table A: MERCHANTS (DIM), PRIMARY KEYS (MERCHANT_ID, MARKETPLACE_ID)

-- Fields :
-- MERCHANT_ID 				INTEGER
-- MARKETPLACE_ID 			INTEGER
-- LAUNCH_DATE 				TIMESTAMP
-- PRIMARY_PRODUCT_DESC 	VARCHAR(255)
-- COUNTRY_OF_ORIGIN 		VARCHAR(2)

-- Table B: SALES (FACT), PRIMARY KEYS (MERCHANT_ID, MARKETPLACE_ID, ORDER_ID)
-- Fields :
-- MERCHANT_ID 				INTEGER
-- MARKETPLACE_ID 			INTEGER
-- ORDER_ID 				VARCHAR(255)
-- SALES 					DECIMAL(38,10)
-- UNITS 					INTEGER
-- ORDER_DATE 				TIMESTAMP

----------------- TABLES ------------------------------------------

-- MERCHANT Sample Data
-- MERCHANT_ID	MARKETPLACE_ID	LAUNCH_DATE	PRIMARY_PRODUCT_DESC	COUNTRY_OF_ORIGIN
-- 12			DE				1/1/2016	BOOKS					DE
-- 12			FR				6/1/2016	BOOKS					DE
-- 34			FR				6/1/2016	ELECTRONICS				
-- 34			UK				3/1/2016	WIRELESS				FR
-- 56			DE				4/1/2015	BOOKS					UK
-- 56			IT				1/1/2015	SOFTLINES				
-- 56			UK				2/1/2015	SOFTLINES				UK
-- 78			ES				12/1/2019	ELECTRONICS				ES

-- SALES Sample Data
-- MERCHANT_ID 	MARKETPLACE_ID	ORDER_ID	SALES	units	ORDER_DATE 
-- 12			DE				BTHDOF		100		6		1/1/2017 00:45
-- 12			DE				BAFTHF		120		8		1/1/2017 07:12
-- 				FR				GTHDAE		18		1		1/1/2017 14:37
-- 12			DE				RTZHGD		80		3		1/2/2017 10:35
-- 56			IT				ASDQER		90		9		1/2/2017 22:01
-- 56			UK				YCCCOD		4000	400		1/3/2017 17:01


-- 	Q1: Please write a query to give the total count of orders and the total 
-- 	sum of sales split by COUNTRY_OF_ORIGIN in the month of December 2017.
--

select sum(units), sum(sales*units), COUNTRY_OF_ORIGIN
from merchant m join sales s 
on m.merchant_id=s.merchant_id and m.MARKETPLACE_ID=s.MARKETPLACE_ID
where ORDER_DATE::date between '1/12/2017' and '31/12/2017'
group by COUNTRY_OF_ORIGIN

select sum(units), sum(sales*units), COUNTRY_OF_ORIGIN
from merchant m join sales s 
on m.merchant_id=s.merchant_id and m.MARKETPLACE_ID=s.MARKETPLACE_ID
where ORDER_DATE::date between '1/12/2017' and '31/12/2017'
and COUNTRY_OF_ORIGIN ilike 'DE'
group by COUNTRY_OF_ORIGIN




-- Variation: What if I don't want to see the country of origin? Instead please show 
-- me  the country only if it is DE/UK/IT, otherwise return ROW (rest of world)

select sum(units), sum(sales*units),
case 
when 
COUNTRY_OF_ORIGIN in ('DE', 'UK', 'IT') then COUNTRY_OF_ORIGIN
else ' ROTW' end
from merchant m join sales s 
on m.merchant_id=s.merchant_id and m.MARKETPLACE_ID=s.MARKETPLACE_ID
where ORDER_DATE::date between '1/12/2017' and '31/12/2017'
group by COUNTRY_OF_ORIGIN

------------------------------------------------------------------------------
-- Q2. Please write a query to give MERCHANT_ID, ORDER_DAY, ORDER_ID showing only the first 
-- (earliest) ORDER_ID carried out from each merchant on each day.



with cte as (select merchant_id, extract(day from order_date) as day, order_id , order_date
from merchant m join sales s 
on m.merchant_id=s.merchant_id and m.MARKETPLACE_ID=s.MARKETPLACE_ID)
select merchant_id, day, order_id,
dense_rank() over(partiton by merchant_id, day order by ORDER_DATE ) as rn from cte 
having rn=1

-- Q3. Query to give MERCHANT_ID, ORDER_ID, and a new column showing the cumulative sum of orders by each merchant each day.


select merchant_id, order_id, sum(sales*units) over(partition by merchant_id, order_date::date order by order_date)
 from merchant m join sales s 
on m.merchant_id=s.merchant_id and m.MARKETPLACE_ID=s.MARKETPLACE_ID


select merchant_id, extract(day from order_date) as 'day', sum(sales*units) over(partition by merchant_id, order_date::date order by order_date)
 from merchant m join sales s 
on m.merchant_id=s.merchant_id and m.MARKETPLACE_ID=s.MARKETPLACE_ID


-- Q4. Query to give MERCHANT_ID, PRIMARY_PRODUCT_DESC, and a new column showing the number of orders placed for that merchant over the first 28 days from launch.

with cte as (select merchant_id, PRIMARY_PRODUCT_DESC, count(order_id) as ids, LAUNCH_DATE plus interval '28 days' as 'first_days', order_date
from merchant m join sales s 
on m.merchant_id=s.merchant_id and m.MARKETPLACE_ID=s.MARKETPLACE_ID
group by 1,2, 4
)
select merchant_id, PRIMARY_PRODUCT_DESC, ids
from cte 
where order_date::date<=first_days


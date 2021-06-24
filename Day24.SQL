Day 24 of #30daysofSQL//

Question:
Some forecasting methods are extremely simple and surprisingly effective. Naïve forecast is one of them; we simply set all forecasts to be the value of the last observation. Our goal is to develop a naïve forecast for a new metric called "distance per dollar" defined as the (distance_to_travel/monetary_cost) in our dataset and measure its accuracy.

To develop this forecast, aggregate 'distance per dollar' values at a monthly level. This value becomes your actual value for the current month. The next step is to populate the forecasted value for each month. This can be achieved simply by getting the previous month's value in a separate column. Now, we have actual and forecasted values. This is your naïve forecast. Let’s evaluate our model by calculating an error matrix called root mean squared error (RMSE). RMSE is defined as sqrt(mean(square(actual - forecast)). Report out the RMSE rounded to the 2nd decimal spot.

uber_request_logs

request_id	int
request_date	datetime
request_status	varchar
distance_to_travel	float
monetary_cost	float
driver_to_client_distance	float


Solution:
select round(sqrt(avg((costo-cost)^2))::numeric,2) as some from (select cost, lag(cost) over( order by date) as costo
from(select to_char(request_date, 'YYYY-MM') as date, sum(distance_to_travel)/sum(monetary_cost) as cost  from uber_request_logs
group by 1
order by 1 asc) as cte) as cte1

approach:

I have used multiple subqueries as in the innermost subquery I am calculating distance per dollar. AFter that I have used lag window function to make a column with the same values as cost but from the second row so that I can subtract later and take out RMSE. In the outermost query I have subtracted both the distances per dollar and then raised the power by 2 and then took the mean of it and then took the square root and then its getting converted to decimal data type and then I am rounding the result upto 2 decimal places

#sqlqueries #sql #dataanalytics #database #dailycoding #365daysofcode #databasedevelopment #datafam #sqlfamily #30daysofSQL #postgresql #sqlserver #dataanalysis #databasequeries #dailycoding #365daysofcode #66daysofdata #datasciences #365daysofsql #dailyposts #mysql #dataengineering




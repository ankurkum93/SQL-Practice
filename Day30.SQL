Day 30 of #30daysofSQL//

Question:

You’re given a table of Uber rides that contains the mileage and the purpose for the business expense.  You’re asked to find business purposes that generate the most miles driven for passengers that use Uber for their business transportation. Find the top 3 business purpose categories by total mileage.
los_angeles_restaurant_health_inspections

my_uber_drives

start_date	datetime
end_date	datetime
category	varchar
start	varchar
stop	varchar
miles	float
purpose	varchar


Solution:

select purpose ,sum(miles) from my_uber_drives
where category ilike 'business%'
and purpose is  not null
group by 1
order by 2 desc
limit 3;

Approach:

I used ilike because it is case insensitive and I had to filter out the null values from the purpose.
since we wanted top 3 results, I have used the limit


#sqlqueries #sql #dataanalytics #database #dailycoding #365daysofcode #databasedevelopment #datafam #sqlfamily #30daysofSQL #postgresql #sqlserver #dataanalysis #databasequeries #dailycoding #365daysofcode #66daysofdata #datasciences #365daysofsql #dailyposts #mysql #dataengineering



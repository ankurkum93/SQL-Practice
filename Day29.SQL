Day 29 of #30daysofSQL//

Find the average number of inspections per facility across all corporations. 
Output the result along with the corresponding owner_name, total number of inspections and the count of unique facility names.
Apply double sort to the result:
    - based on the owner_name in ascending order and 
    - based on the average inspections per facility in descending order.

los_angeles_restaurant_health_inspections

serial_number	varchar
activity_date	datetime
facility_name	varchar
score	int
grade	varchar
service_code	int
service_description	varchar
employee_id	varchar
facility_address	varchar
facility_city	varchar
facility_id	varchar
facility_state	varchar
facility_zip	varchar
owner_id	varchar
owner_name	varchar
pe_description	varchar
program_element_pe	int
program_name	varchar
program_status	varchar
record_id	varchar

Solution:

select owner_name, count(*), count(distinct facility_name ), count(*)/count(distinct facility_name )::float as aveins  from los_angeles_restaurant_health_inspections
group by 1
order by 1,2 desc;





#sqlqueries #sql #dataanalytics #database #dailycoding #365daysofcode #databasedevelopment #datafam #sqlfamily #30daysofSQL #postgresql #sqlserver #dataanalysis #databasequeries #dailycoding #365daysofcode #66daysofdata #datasciences #365daysofsql #dailyposts #mysql #dataengineering



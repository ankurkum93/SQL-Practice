Day 13 of #30daysofsql//


Question:
Identify projects that are at risk for going overbudget. A project is considered to be overbudget if the cost of all employees assigned to the project is greater than the budget of the project. 
You will need to prorate the cost of the employees to the duration of the project. For example, if the budget for a project that takes half a year to complete is $10K, then the total half-year salary of all employees assigned to the project should not exceed $10K.
Output a list of projects that are overbudget with their project name, project budget, and prorated total employee expense (rounded to the next dollar amount).

Table1:
linkedin_projects
id int
title varchar
budget int
start_date datetime
end_date datetime

Table2:
linkedin_emp_projects

emp_id int
project_id int

Table3:
linkedin_employees

id int
first_name varchar
last_name varchar
salary int


Solution:
with cte as (
select  title, budget, ceiling(sum(salary)*(end_date::date-start_date::date)/365) as prorated
 from linkedin_projects lp
join linkedin_emp_projects lep
on lep.project_id=lp.id
join linkedin_employees le 
on lep.emp_id=le.id 
group by  1,2,end_date, start_date)
select title,budget,prorated from cte
where budget<prorated
group by title,2,3
order by 1

Approach:
First I calculated prorated salary and I used 'ceiling' function to round it upto next dollar amount. if I would have used 'round' for .4 it will round to previous number.
I joined all the  tables despite not needing columns from the second table because the second table has the primary and foreign keys.


#sqlqueries #sql #dataanalytics #database #dailycoding #365daysofcode #databasedevelopment #datafam #sqlfamily #30daysofSQL #postgresql #sqlserver #dataanalysis #databasequeries #dailycoding #365daysofcode #66daysofdata #datasciences #365daysofsql #dailyposts #mysql #dataengineering

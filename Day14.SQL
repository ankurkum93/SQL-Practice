
Day 14 of #30daysofSQL//

Question:

A company's executives are interested in seeing who earns the most money in each of the company's departments. A high earner in a department is an employee who has a salary in the top three unique salaries for that department.
Write an SQL query to find the employees who are high earners in each of the departments.
Return the result table in any order.


Employee table:
+----+-------+--------+--------------+
| Id | Name  | Salary | DepartmentId |
+----+-------+--------+--------------+
| 1  | Joe   | 85000  | 1            |
| 2  | Henry | 80000  | 2            |
| 3  | Sam   | 60000  | 2            |
| 4  | Max   | 90000  | 1            |
| 5  | Janet | 69000  | 1            |
| 6  | Randy | 85000  | 1            |
| 7  | Will  | 70000  | 1            |
+----+-------+--------+--------------+

Department table:
+----+-------+
| Id | Name  |
+----+-------+
| 1  | IT    |
| 2  | Sales |
+----+-------+

Solution:

with cte as (select d.name as department, e.name as employee,e.salary,  dense_rank()
over(partition by d.name  order by e.salary desc) as deprank
from department d
join employee e
on d.id=e.departmentId
)
select department, employee, salary from cte
where deprank<=3

Approach:

I used dense_rank in order to rank the salaries differently as I knew there are duplicate salaries.
I used CTE instead of a subquery because the code becomes cleaner and readable 

#sqlqueries #sql #dataanalytics #database #dailycoding #365daysofcode #databasedevelopment #datafam #sqlfamily #30daysofSQL #postgresql #sqlserver #dataanalysis #databasequeries #dailycoding #365daysofcode #66daysofdata #datasciences #365daysofsql #dailyposts #mysql #dataengineering

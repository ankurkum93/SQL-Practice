
Day 11 of #30daysofSQL//



Question:



Find how many events happened on MacBook-Pro per company in Argentina from users that do not speak Spanish.
Output the company id, language of users, and the number of events performed by users.



Table1:
playbook_events



user_id int

occurred_at datetime

event_type varchar

event_name varchar

location varchar

device varchar



Table2:
playbook_users



user_id. int

created_at datetime

company_id int

language varchar

activated_at datetime

state varchar



Solution:



select company_id,

language, count(event_name)

from playbook_events pe

join playbook_users pu 

using(user_id)

where lower(device) like 'macbook pro%'

and lower(location) like 'argentina%'

group by 1,2

;


I read somewhere that using ‘%’ only in the end enhances the performance of the query and hence I used only in the end.
Since, question is explicitly asking for the events happening on macbook pro device and the company shall be in Argentina, I have used it in the where clause.
I need to group the companies where the language of users is same and count different types of events.


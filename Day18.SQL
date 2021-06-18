Day 18 of #30daysofSQL//

Question:
Facebook sends SMS texts when users attempt to 2FA (2-factor authenticate) into the platform to log in. In order to successfully 2FA they must confirm they received the SMS text message. Confirmation texts are only valid on the date they were sent. Unfortunately, there was an ETL problem with the database where friend requests and invalid confirmation records were inserted into the logs, which are stored in the 'fb_sms_sends' table. These message types should not be in the table. Fortunately, the 'fb_confirmers' table contains valid confirmation records so you can use this table to identify SMS text messages that were confirmed by the user.

Calculate the percentage of confirmed SMS texts for August 4, 2020.

fb_sms_sends

ds	datetime
country	varchar
carrier	varchar
phone_number	int
type	varchar

fb_confirmers


date	datetime
phone_number int

Solution:
select sum(
case when type like 'confirm%' then 1 else 0
end)/count(*):: float * 100
from fb_sms_sends fss join fb_confirmers fc
on fss.phone_number=fc.phone_number
where date='2020-08-04'



#sqlqueries #sql #dataanalytics #database #dailycoding #365daysofcode #databasedevelopment #datafam #sqlfamily #30daysofSQL #postgresql #sqlserver #dataanalysis #databasequeries #dailycoding #365daysofcode #66daysofdata #datasciences #365daysofsql #dailyposts #mysql #dataengineering

Day 2///

Q. Find the lowest score per each facility in Hollywood Boulevard.
Output the result along with the corresponding facility name.
Order the result based on the lowest score in descending order and the facility name in the ascending order.

Solution:-

select facility_name, min(score) from los_angeles_restaurant_health_inspections
where lower(facility_address) like '%hollywood blvd%'
group by 1
order by 2 desc
;

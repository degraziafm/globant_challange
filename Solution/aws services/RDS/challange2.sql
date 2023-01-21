--Challange #2
--Query #1

create or replace view hired_employee_quarter as
select 	department, job, 
		sum(q1) as q1, sum(q2) as q2, sum(q3) as q3, sum(q4) as q4
from (	
	select 	d.department, 
			j.job, 
			case when QUARTER(e.datetime) = 1 then 1 else 0 end q1,
			case when QUARTER(e.datetime) = 2 then 1 else 0 end q2,
			case when QUARTER(e.datetime) = 3 then 1 else 0 end q3,
			case when QUARTER(e.datetime) = 4 then 1 else 0 end q4
	from hired_employees as e
	inner join jobs as j on e.job_id = j.id
	inner join departments as d on e.job_id = d.id
	where year(e.datetime) = 2021) as a
group by department, job;


--Query #2
create or replace view avg_hired_employee as
select avg(num_hired_employee) as avg
from (
	select d.id, count(*) as num_hired_employee
	from hired_employees as e
	inner join departments as d on e.job_id = d.id
	where year(e.datetime) = 2021
	group by d.id) as a;


create or replace view departments_with_more_hired as
select id, department, num_hired_employee
from (
	select d.id, d.department, count(*) as num_hired_employee
	from hired_employees as e
	inner join departments as d on e.job_id = d.id
	group by d.id, d.department) as a
where num_hired_employee > (select avg from avg_hired_employee)
order by num_hired_employee desc;


--import data from stagging table

insert into Education_Lvl(Education_Lvl_nm)
select distinct Education_Lvl from proj_stg;

insert into Dept(dept_nm)
select distinct department_nm from proj_stg;

insert into Title(title_nm)
select distinct job_title from proj_stg;

Insert into Employee(Emp_ID, Emp_name,Emp_Email, Hire_DT, Education_Id)
Select distinct on(p.Emp_ID) p.Emp_ID,p.Emp_NM,p.Email, p.hire_dt, e.Education_lvl_Id 
from proj_stg as p
Join Education_Lvl as e
On e.Education_Lvl_NM= p. education_lvl;

insert into States(State_NM)
select distinct state from proj_stg;

insert into City(city_NM,state_id)
select distinct on (p.city)p.city, s.state_id 
from proj_stg as p
join states as s on s.state_nm = p.state;

insert into locations(location_nm,city_id)
select distinct on (p.location)p.location, c.city_id 
from proj_stg as p
join city as c on c.city_nm = p.city

insert into address(address_nm, location_id)
select distinct p.address, l.location_id
from proj_stg as p
join locations as l
on p.location = l.location_nm;

insert into Position_history(emp_id,title_id,dept_id,start_dt,end_dt,address_id,manager_id)
select  p.emp_id, t.title_id, d.dept_id ,p.start_dt, p.end_dt, a.address_id,
m.emp_id as manager
from proj_stg as p
join title as t 
on p.job_title = t.title_nm
join dept as d 
on p.department_nm = d.dept_nm
join address as a 
on p.address = a.address_nm
left join proj_stg as m 
on p.manager = m.emp_nm;

insert into Salary(emp_id, salary, start_dt)
select ph.emp_id, p.salary, ph.start_dt
from position_history as ph 
join proj_stg as p
on ph.emp_id = p.emp_id and ph.start_dt= p.start_dt;








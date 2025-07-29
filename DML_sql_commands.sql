
--import data from stagging table

insert into Education_Lvl(Level_NM)
select distinct education_lvl from proj_stg;

Insert into Employee(Employee_ID,Employee_NM,Email,Education_LVL_ID,Hire_DT,Exit_DT)
select distinct on (s.Emp_ID) s.Emp_ID,s.Emp_NM,s.Email,e.Education_LVL_ID,s.hire_dt,s.end_dt
from proj_stg as s join Education_Lvl as e on e.Level_NM = s.education_lvl;

Insert into Job_Title(Title_NM)
select distinct job_title from proj_stg;

Insert into Department(Department_NM)
select distinct department_nm from proj_stg;

Insert into Location(Location_NM,Address_LN,City,State)
select distinct location, address, city, state from proj_stg;

Insert into Position_Hist(Employee_ID, Title_ID,Department_ID, Location_ID,Start_DT,End_DT,Manager_ID)				   
select s.Emp_ID,j.Title_ID,d.Department_ID,l.Location_ID,s.start_dt,s.end_dt,m.Emp_ID as manager
from proj_stg as s join Job_Title as j on j.Title_NM = s.job_title
                   join Department as d on d.Department_NM = s.department_nm
				   join Location as l on l.Location_NM = s.location
				   left join proj_stg as m on s.manager = m.Emp_NM;

Insert into Salary(Employee_ID,Start_DT,Salary)
select p.Employee_ID,p.Start_DT,s.salary
from Position_Hist as p join proj_stg as s on p.Employee_ID = s.Emp_ID and p.Start_DT = s.start_dt;


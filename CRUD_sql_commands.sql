Question 1: Return a list of employees with Job Titles and Department Names

select e.Employee_NM,j.Title_NM,d.Department_NM
from Employee as e join Position_Hist as p on e.Employee_ID = p.Employee_ID
                   join Job_Title as j on j.Title_ID = p.Title_ID
				   join Department as d on d.Department_ID = p.Department_ID;

Question 2: Insert Web Programmer as a new job title

Insert into Job_Title(Title_NM) VALUES('Web Programmer');

Question 3: Correct the job title from web programmer to web developer

Update Job_Title
set Title_NM = 'Web Developer' where Title_NM = 'Web Programmer';

Question 4: Delete the job title Web Developer from the database

Delete from Job_Title where Title_NM = 'Web Developer';

Question 5: How many employees are in each department?

select count(*) as Number_of_Employee,d.Department_NM from Position_Hist as p 
join Department as d on d.Department_ID = p.Department_ID 
where p.End_DT > CURRENT_DATE group by d.Department_ID;

Question 6: Write a query that returns current and past jobs (include employee name, job title, department, manager name, start and end date for position) for employee Toni Lembeck.

select e.Employee_NM,j.Title_NM,d.Department_NM,m.Employee_NM as Manager,p.Start_DT,p.End_DT
from Position_Hist as p join Employee as e on e.Employee_ID = p.Employee_ID
                   join Job_Title as j on j.Title_ID = p.Title_ID
				   join Department as d on d.Department_ID = p.Department_ID
				   join Employee as m on m.Employee_ID = p.Manager_ID
where e.Employee_NM = 'Toni Lembeck';

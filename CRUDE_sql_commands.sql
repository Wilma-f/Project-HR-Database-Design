-- Question 1: Return a list of employees with Job Titles and Department Names
select e.emp_name, t.title_nm,d.dept_nm 
from position_history as p  join employee as e on p.emp_id=e.emp_id
							join title as t  on p.title_id = t.title_id
							join dept as d on p.dept_id = d.dept_id;



-- Question 2: Insert Web Programmer as a new job title

insert into title(title_nm)
values('web programming');


-- Question 3: Correct the job title from web programmer to web developer
UPDATE title
SET title_nm = 'web developer'
WHERE title_nm = 'web programming';


--Question 4: Delete the job title Web Developer from the database
deete from title where title_nm = 'web developer';


-- Question 5: How many employees are in each department?
select count(*) as number_of_employees,d.dept_nm as department from position_history as p
join dept as d on d.dept_id = p.dept_id
Where p.end_dt > CURRENT_DATE
group by(d.dept_id);


-- Question 6: Write a query that returns current and past jobs (include employee name, job title, department, manager name, start and end date for position) for employee Toni Lembeck.
Select e.emp_name , d.dept_nm, t.title_nm, m.emp_name as manager,p.start_dt ,p.end_dt 
from position_History as p
join employee as e
on e.emp_id = p.emp_id 
join dept as d
on d.dept_id = p.dept_id
join title as t 
on t.title_id = p.title_id
join employee as m
on m.emp_id = p.manager_id
where e.emp_name ='Toni Lembeck';

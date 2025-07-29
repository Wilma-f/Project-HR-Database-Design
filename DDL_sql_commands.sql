--create tables
CREATE TABLE Education_Lvl (
Education_LVL_ID SERIAL primary key,
Level_NM varchar(200));

CREATE TABLE Employee (
Employee_ID varchar(10),
Employee_NM varchar(200),
Email varchar(200),
Education_LVL_ID int REFERENCES Education_Lvl(Education_LVL_ID),
Hire_DT date,
Exit_DT date,
Primary key (Employee_ID));

CREATE TABLE Job_Title (
Title_ID SERIAL primary key,
Title_NM varchar(200));

CREATE TABLE Department (
Department_ID  SERIAL primary key,
Department_NM varchar(200));

CREATE TABLE Location (
Location_ID  SERIAL primary key,
Location_NM varchar(200),
Address_LN varchar(400),
City varchar(200),
State varchar(2)
);

CREATE TABLE Position_Hist (
Employee_ID varchar(10) REFERENCES Employee(Employee_ID),
Title_ID int REFERENCES Job_Title(Title_ID),
Department_ID int REFERENCES Department(Department_ID),
Location_ID int REFERENCES Location(Location_ID),
Start_DT DATE,
End_DT DATE,
Manager_ID varchar(10) REFERENCES Employee(Employee_ID),
Primary key (Employee_ID,Start_DT));

CREATE TABLE Salary(
Employee_ID VARCHAR(10),
Start_DT DATE,
Salary int,
Foreign Key (Employee_ID,Start_DT) REFERENCES Position_Hist(Employee_ID,Start_DT),
Primary Key(Employee_ID,Start_DT));

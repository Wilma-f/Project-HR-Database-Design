--create tables

CREATE TABLE Education_Lvl(
Education_Lvl_ID SERIAL primary Key,
Education_Lvl_NM varchar(60));

CREATE TABLE Dept(
Dept_ID SERIAL primary Key,
Dept_NM varchar(30));

CREATE TABLE Title(
Title_ID SERIAL primary Key,
Title_NM varchar(30));

CREATE TABLE Employee(
Emp_ID Varchar(60) primary Key,
Emp_name varchar(60),
Emp_Email varchar(60),
Hire_DT date,
Education_Id int REFERENCES Education_Lvl(Education_Lvl_ID));

create table States(
State_ID SERIAL primary key,
State_NM Varchar(30));

create table City(
City_ID SERIAL primary key,
City_NM Varchar(30),
State_ID int REFERENCES States(State_ID));

create table Locations(
Location_ID SERIAL primary key,
Location_NM Varchar(30),
City_ID int REFERENCES City(City_ID));

Create table Address(
Address_ID SERIAL primary key,
Address_NM Varchar(30),
Location_ID int REFERENCES Locations(Location_ID));

create table States(
State_ID SERIAL primary key,
State_NM Varchar(30));

create table City(
City_ID SERIAL primary key,
City_NM Varchar(30),
State_ID int REFERENCES States(State_ID));

create table Locations(
Location_ID SERIAL primary key,
Location_NM Varchar(30),
City_ID int REFERENCES City(City_ID));

Create table Address(
Address_ID SERIAL primary key,
Address_NM Varchar(30),
Location_ID int REFERENCES Locations(Location_ID));

CREATE TABLE Salary(
Emp_ID Varchar(60) REFERENCES Employee(Emp_ID),
Salary int,
Start_DT date,
primary key(Salary, Start_DT),
foreign Key(Emp_ID, Start_DT) REFERENCES Position_history(Emp_ID,Start_DT));

create table proj_stg (Emp_ID varchar(8),
 Emp_NM varchar(50),
Email  varchar(100),
hire_dt date,
job_title varchar(100),
salary int,
department_nm varchar(50),
manager varchar(50),
start_dt date,
end_dt date,
location varchar(50),
address varchar(100),
city varchar(50),
state varchar(2),
education_lvl varchar(50));						   

			
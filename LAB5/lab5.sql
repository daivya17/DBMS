Create database Daivyacs084;
Use database Daivyacs084;
create table project(
pno int,
ploc varchar(50),
pname varchar(50),
primary key (pno));

create table dept(
deptno int primary key,
dname varchar(50),
dloc varchar(50));

create table employee(
empno int primary key,
empname varchar(50),
mgr_no int,
hiredate date,
sal int,
deptno int,
foreign key (deptno) references dept (deptno));

create table incentives(
empno int ,
incentive_date date ,
incentive_amt int,
primary key(empno,incentive_date),
foreign key (empno) references employee (empno));

create table assigned_to(
empno int,
pno int,
job_role varchar (50),
primary key (empno, pno),
foreign key (empno) references employee(empno),
foreign key (pno) references project (pno));


insert into project 
values(01,'bengaluru','pascalai'),
(02,'hyderbaad','p1m'),
(03,'mysuru','p2m'),
(04,'chennai','p3m'),
(05,'delhi','p4m');

insert into dept
values(01,'sales','bengaluru'),
(02,'it','hyderabad'),
(03,'hr','mysuru'),
(04,'finance','delhi'),
(05,'production','chennai');

insert into employee
values (101,"Dinesh",111,"2021-11-01",50000,1),
(102,"Dhanush",112,"2024-01-01",70000,2),
(103,"Daivya",113,"2024-01-01",80000,3),
(104,"Aditya",114,"2023-08-11",65000,1),
(105,"Arun",111,"2022-06-07",35000,2);

insert into incentives
values(4,'2020-11-12',3000),
(8,'2015-07-30',4000),
(7,'2010-10-14',5000),
(7,'2015-07-24',7000),
(2,'2020-11-30',3000);

insert into assigned_to
values(101,02,'assistant'),
(101,01,'manager'),
(102,02,'head'),
(103, 03,'manager'),
(104,05,'developer');

select e.empno
from employee e, assigned_to a
where e.empno=a.empno and a.pno in(select pno from project 
where ploc in ('bengaluru' ,' hyderabad',' mysuru'));

select empno from employee 
where empno not in (select distinct empno from incentives);

select e.empno, e.empname, d.deptno, a.job_role, d.dloc ,p.ploc
from employee e, project p,  assigned_to a, dept d
where e.empno=a.empno and p.pno=a.pno and e.deptno=d.deptno and d.dloc=p.ploc;

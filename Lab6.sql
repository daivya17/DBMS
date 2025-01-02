select e.empname,p.*
from employee e, project p, assigned_to a
where e.empno=a.empno and p.pno=a.pno;

select i.empno,e.empname,sum(i.incentive_amt)as total_incentive
from incentives i,employee e
where i.empno=e.empno
group by empno;


select p.pname,p.ploc
from project p
where pno in(select pno from assigned_to a where job_role='manager');


select d.dname,count(e.empno)
from dept d,employee e
where d.deptno=e.deptno
group by d.dname;


select e.empno,e.empname
from employee e
where not exists(select 1 from assigned_to a where e.empno=a.empno);


select e.empname,d.deptno,d.dloc
from employee e,dept d
where e.deptno=d.deptno;


select *
from employee e
where mgr_no=7;

select p.pname,count(e.empno)
from project p,assigned_to e
where e.pno=p.pno
group by p.pname;

SELECT e1.empname AS employee_name,
       e1.empno AS employee_number,
       e1.deptno,
       d.dname AS department_name,
       d.dloc AS department_location,
       e2.empname AS manager_name
FROM employee e1
JOIN employee e2 ON e1.mgr_no = e2.empno
JOIN dept d ON e1.deptno = d.deptno
ORDER BY e2.empname, e1.empname;

select empno,count(incentive_date)as number_of_times,sum(incentive_amt) as total_amt
from incentives
group by empno;

select e.empno,e.empname
from employee e
where e.empno in (select empno from assigned_to where empno=e.empno and job_role='app developer');


select deptno,avg(sal) as average
from employee
group by deptno;

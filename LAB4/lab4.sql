select branchname,assets
from branch;

select customername
from bankcustomer
where city='banglore';

select c.customername
from bankcustomer c, depositer d,bankaccount a,branch b
where c.customername=d.customername and
d.accno=a.accno and
a.branchname=b.branchname and
b.branchname=all(select b.branchname from branch 
where b.branchcity='delhi');

select c.customername,b.balance
from bankcustomer c,bankaccount b,depositer d
where d.accno=b.accno and c.customername=d.customername
and b.balance>5000;

select b.branchname
from branch b,bankaccount a,loan l where b.branchname=a.branchname and b.branchname=l.branchname;

select branchname,count(*)
from bankaccount
group by branchname;

select b.branchname
from branch b
where b.branchname not in(select branchname from loan);

select branchname
from loan
where amount=(select min(amount) from loan);

with abc as (select t1.title as src, t2.title as dst from titles t1 join titles t2 on t1.emp_no = t2.emp_no where t1.title != t2.title and t1.to_date = t2.from_date group by src, dst),
def as (select T1 as src,T3 as dst from (select t1.title T1, t2.title T2, t3.title T3 from titles t1 join titles t2 on t1.emp_no = t2.emp_no join titles t3 on t2.emp_no=t3.emp_no where t1.title!=t2.title and t2.title!=t3.title and t1.to_date = t2.from_date and t2.to_date = t3.from_date group by T1,T2,T3) sub1)
select src,dst from abc UNION select src,dst from def;

with xyz as (select t1.title as src, t2.title as dst from (select distinct(title) from titles) t1 join (select distinct(title) from titles) t2 order by t1.title),
abc as (select t1.title as src, t2.title as dst from titles t1 join titles t2 on t1.emp_no = t2.emp_no where t1.title != t2.title and t1.to_date = t2.from_date group by src, src),
def as (select T1 as src,T3 as dst from (select t1.title T1, t2.title T2, t3.title T3 from titles t1 join titles t2 on t1.emp_no = t2.emp_no join titles t3 on t2.emp_no=t3.emp_no where t1.title!=t2.title and t2.title!=t3.title and t1.to_date = t2.from_date and t2.to_date = t3.from_date group by T1,T2,T3) sub1),
ghi as (select src,dst from abc UNION select src,dst from def)
select * from xyz left join ghi on xyz.src = ghi.src;

on xyz.src = ghi.src where ghi.src = NULL and ghi.dst = NULL;


with xyz as (select t1.title Title1, t2.title Title2 from (select distinct(title) from titles) t1 join (select distinct(title) from titles) t2 order by t1.title),
abc as (select t1.title Title1, t2.title Title2 from titles t1 inner join titles t2 on t1.emp_no=t2.emp_no
where t1.to_date <= t2.from_date)
select Title1 as src, Title2 as dst from xyz where (Title1,Title2) not in (select Title1, Title2 from abc) order by Title2, Title1;

select t1.title src, t2.title dst from (select distinct(title) from titles) t1 join (select distinct(title) from titles) t2 order by t1.title
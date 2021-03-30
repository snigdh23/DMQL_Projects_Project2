select temp1.emp_no,temp2.tcnt-temp1.s1 as cnt from (select t1.emp_no, count(t1.emp_no) as s1 from titles t1 join salaries sal on t1.emp_no = sal.emp_no where t1.from_date = sal.from_date group by t1.emp_no) temp1 join 
(select emp_no , count(emp_no) as tcnt from titles group by emp_no) temp2 on temp1.emp_no = temp2.emp_no where (temp2.tcnt-temp1.s1) > 0
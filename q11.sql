with tots as (select dem.dept_no dptno, dpt.dept_name as dept_name, dem.emp_no as emp_no , sal.salary as salary from departments dpt join dept_emp dem on dpt.dept_no = dem.dept_no join salaries sal on dem.emp_no=sal.emp_no where YEAR(dem.to_date) = 9999 and YEAR(sal.to_date) = 9999  order by dept_name asc, salary desc)
(select dept_name, emp_no, salary from tots where dptno = "d001" order by salary desc limit 1) UNION (select dept_name, emp_no, salary from tots where dptno = "d002" order by salary desc limit 1) UNION (select dept_name, emp_no, salary from tots where dptno = "d003" order by salary desc limit 1)
UNION (select dept_name, emp_no, salary from tots where dptno = "d004" order by salary desc limit 1) UNION (select dept_name, emp_no, salary from tots where dptno = "d005" order by salary desc limit 1) UNION (select dept_name, emp_no, salary from tots where dptno = "d006" order by salary desc limit 1)
UNION (select dept_name, emp_no, salary from tots where dptno = "d007" order by salary desc limit 1) UNION (select dept_name, emp_no, salary from tots where dptno = "d008" order by salary desc limit 1) UNION (select dept_name, emp_no, salary from tots where dptno = "d009" order by salary desc limit 1) order by dept_name;
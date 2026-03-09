SELECT department, count(*), avg(salary) FROM employees GROUP BY department HAVING count(*) > 5

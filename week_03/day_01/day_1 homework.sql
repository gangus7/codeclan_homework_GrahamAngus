SELECT * 
FROM employees 
WHERE department = 'Human Resources';


SELECT first_name, last_name, country 
FROM employees
WHERE department = 'Legal';

SELECT COUNT(*)
FROM employees 
WHERE country = 'Portugal' OR country = 'Spain';


SELECT pay_detail_id
FROM employees

SELECT count(*)
FROM employees 
WHERE local_account_no = NULL;

SELECT first_name, last_name 
FROM employees
ORDER BY last_name ASC NULLS LAST;

SELECT count(*)
FROM employees 
WHERE first_name = 'F%';

SELECT count(*)
FROM employees 
WHERE pension_enrol = TRUE AND country != 'France' OR country != 'Germany';

SELECT count (*)
FROM employees
WHERE start_date = BETWEEN '2003-01-01' AND '2003-12-31',
GROUP BY department;

















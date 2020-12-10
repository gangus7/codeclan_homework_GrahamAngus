--MVP
--Q1 


SELECT *
FROM pay_details 
WHERE local_account_no IS NULL AND iban IS NULL;

--MVP
--Q2

SELECT 
first_name,
last_name, 
country 
FROM employees
ORDER BY country, last_name NULLS LAST; 

--MVP
--Q3

SELECT *
FROM employees
ORDER BY salary DESC NULLS LAST
limit 10;

--MVP 
--Q4

SELECT 
first_name, 
last_name, 
salary
FROM employees
WHERE country = 'Hungary'
ORDER BY salary ASC NULLS LAST 
LIMIT 1;

--MVP 
--Q5

SELECT *
FROM employees 
WHERE email LIKE '%yahoo%'

--MVP
--Q6 
SELECT 
COUNT (id), 
pension_enrol
FROM employees
GROUP BY pension_enrol;



--MVP
--Q7
 
SELECT 
first_name, 
last_name, 
salary
FROM employees
WHERE department = 'Engineering' AND fte_hours = 1.0
ORDER BY salary DESC NULLS LAST 
LIMIT 1;

--MVP
--Q8

SELECT 
country,
COUNT(id),
AVG(salary)
FROM employees 
GROUP BY country
HAVING COUNT(id) > 30
ORDER BY AVG(salary) DESC NULLS LAST;

--MVP
--Q9

SELECT 
first_name, 
last_name, 
fte_hours,
salary, 
fte_hours * salary AS effective_yearly_salary 
FROM employees;

--MVP
--Q10

SELECT
employees.first_name,
employees.last_name,
pay_details.local_tax_code 
FROM employees INNER JOIN pay_details
ON pay_detail_id = pay_details.id
WHERE local_tax_code IS NULL;

--MVP
--Q11

SELECT 
employees.first_name, 
employees.last_name,
employees.salary,
employees.fte_hours, 
(48* 35* CAST(charge_cost AS int) - salary) * fte_hours AS expected_profit
FROM employees INNER JOIN teams
ON employees.team_id = teams.id;

--MVP
--Q12

SELECT 
first_name, 
COUNT(*)
FROM employees 
WHERE first_name IS NOT NULL
GROUP BY first_name 
HAVING COUNT(*) > 1
ORDER BY COUNT DESC ,
first_name;


--EXT 

SELECT 
department, 
COUNT(*)
FROM employees 
GROUP BY department
ORDER BY COUNT DESC;


WITH largest_dept AS 
SELECT 
department,
AVG(salary) AS avg_salary
FROM employees 
GROUP BY id;

SELECT 
id, 
first_name, 
last_name,
salary, 
fte_hours,
salary / AVG(salary) AS salary_ratio,
fte_hours / AVG(fte_hours) AS fte_hours_ratio
FROM employees 
WHERE department = 'Legal'
GROUP BY id;


--EXT2
SELECT 
COUNT (id), 
CAST(pension_enrol AS int)
FROM employees
GROUP BY pension_enrol;

--EXT3
SELECT 
employees.first_name, 
employees.last_name, 
employees.email, 
employees.start_date,
committees.name
FROM employees INNER JOIN committees
ON employees.team_id = committees.id
WHERE committees.name = 'Equality and Diversity'
ORDER BY employees.start_date;


--EXT4





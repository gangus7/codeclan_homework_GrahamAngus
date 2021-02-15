/*Add a column for each employee showing the 
 * ratio of their salary to the average salary of their team. */

/* Step 1 - get a table of avg salaries for each team */
/* team name is in teams table */
/* salary etc in employee table */



SELECT
e.first_name,
e.last_name,
team_avgs.name AS team_name, 
e.salary,
e.salary / team_avgs.avg_salary AS salary_over_team_avg
FROM employees AS e INNER JOIN ( SELECT
t.id,
t.name, 
AVG(e.salary) AS avg_salary 
FROM employees AS e INNER JOIN teams AS t 
ON e.team_id = t.id 
GROUP BY t.id 
) AS team_avgs
ON e.team_id = team_avgs.id
ORDER BY e.team_id;


/* rewwrite using a common table expression CTE */
/* CTE replaces a subquery */
/* 'make this table I'm about to define available in the rest of a following query' */
/* AKA 'with queries' */

WITH team_avgs(id, name, avg_salary) AS ( 
SELECT
t.id,
t.name, 
AVG(e.salary)
FROM employees AS e INNER JOIN teams AS t 
ON e.team_id = t.id 
GROUP BY t.id
)
SELECT 
e.first_name, 
e.last_name,
team_avgs.name AS team_name,
e.salary,
e.salary / team_avgs.avg_salary AS salary_over_team_avg
FROM employees AS e INNER JOIN team_avgs
ON e.team_id = team_avgs.id 
ORDER BY e.team_id 



/* Add a column showing ration of employee salary to their country's agv salary */ 

SELECT 
country, 
AVG(salary) AS avg_salary 
FROM employees 
GROUP BY country 

WITH country_avgs(country, avg_salary) AS (
SELECT 
country, 
AVG(salary)
FROM employees 
GROUP BY country 
), 
team_avgs(id, name, avg_salary) AS ()
SELECT 
e.first_name, 
e.last_name, 
e.country, 
e.salary, 
e.salary / country_avgs.avg_salary AS salary_over_country 
FROM employees AS e INNER JOIN country_avgs
ON e.country = country_avgs.country 


/* WIndow Functions */
/* A new way to use aggregrates */

SELECT 
department, 
AVG(salary) AS avg_salary
FROM employees 
GROUP BY department 

SELECT 
AVG(salary)
FROM employees 

/* Window functions let you apply groupwise aggregates while keeping access to 
 * * individual rows */

/* AKA 'over queries */


SELECT 
function_name OVER (window_definition) 
FROM 

/* let's write one making the window the whole table */ 

SELECT 
first_name, 
last_name, 
salary, 
SUM(salary) OVER () AS sum_salary
FROM employees 
 
SELECT 
first_name, 
last_name, 
salary, 
(SELECT SUM(salary) FROM employees) AS sum_salary 
FROM employees 

/* window definitions */ 
/* ORDER BY */

/* "Get a table of employees' names, salary and start date ordered
 * by start date, together with a running total of salries by start date." */

SELECT 
id, 
first_name, 
last_name,
salary,
start_date,
SUM(salary) OVER (ORDER BY start_date ASC NULLS LAST) AS running_tot_salary
FROM employees 


/* ORDER BY makes the window for the current row run from the start of the table 
 * up to the current row, including any rows with the same value of ordering variable 
 * as the current row */

/* "Rank employees in order by their start date with the corporation." */
/* few different definitions of rank - differ in terms of how they treat ties */ 

SELECT 
id, 
first_name, 
last_name, 
start_date, 
RANK() OVER (ORDER BY start_date ASC NULLS LAST) AS start_rank,
DENSE_RANK() OVER (ORDER BY start_date ASC NULLS LAST) AS start_dense_rank,
ROW_NUMBER() OVER (ORDER BY start_date ASC NULLS LAST) AS start_row_number
FROM employees 

/* Add two extra columns, window functions, using DENSE_RANK() and ROW_NUMBER() 
* look at the table produced. What do you think is happening? */ 

/* PARTITION BY second window definition */ 
/* "show for each employee the number of other employees
 * who are members of the same department as them." */ 

SELECT 
id, 
first_name, 
last_name, 
department, 
COUNT(*) OVER(PARTITION BY department) AS num_employees_in_department 
FROM employees;

 


SELECT id, 
first_name, 
last_name, 
grade, 
salary, 
MAX(salary) OVER (PARTITION BY grade) AS max_salary, 
MIN(salary) OVER (PARTITION BY grade) AS min_salary
FROM employees;





SELECT 
e.first_name, 
e.last_name, 
t.name AS team_name, 
e.salary, 
e.salary / AVG(e.salary) OVER (PARTITION BY e.team_id) AS salary_over_team_avg
FROM employees AS e INNER JOIN teams AS t 
ON e.team_id = t.id 


/* ORDER BY AND PARTITION BY together */ 
/* "Get a table of employees showing the order
 * in which they started work with the corporation split by department" */ 

SELECT 
first_name, 
last_name,
start_date, 
department, 
RANK() OVER (PARTITION BY department ORDER BY start_date ASC NULLS LAST) AS order_started_in_dept
FROM employees 
ORDER BY start_date;
 






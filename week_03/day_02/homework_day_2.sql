/* Get a table of all employees details, 
together with their local_account_no and local_sort_code, if they have them. */ 

SELECT 
employees.*, 
pay_details.local_account_no, 
pay_details.local_sort_code 
FROM employees LEFT JOIN pay_details
ON employees.id = pay_details.id;


/*Find the first name, last name and team name of employees who are members of teams for which the charge cost is greater than 80. 
 * Order the employees alphabetically by last name.*/ 

SELECT 
employees.first_name,
employees.last_name,
teams.name,
teams.charge_cost 
FROM employees INNER JOIN teams
ON employees.team_id = teams.id
WHERE cast(teams.charge_cost AS int) > 80
ORDER BY employees.last_name ASC NULLS LAST;

/* Breakdown the number of employees in each of the teams, including any teams without members. 
 * Order the table by increasing size of team. */ 
 
SELECT 
teams.name,
COUNT(employees.team_id)
FROM teams INNER JOIN employees 
GROUP BY teams.name;


SELECT 
id, 
first_name, 
last_name,
salary, 
fte_hours * salary AS effective_salry 
SUM(fte_hours * salary) OVER (order by fte_hours * salary ASC NULLS LAST)
FROM employees;



SELECT animals.name,
animals.species,
diets.diet_type
FROM animals INNER JOIN diets 
ON animals.diet_id = diets.id;


SELECT 
a.id, 
a.name,
a.species,
a.age,
d.diet_type 
FROM animals AS a INNER JOIN diets AS d 
ON a.diet_id = d.id 
WHERE a.age > 4;


SELECT 
d.diet_type,
COUNT(a.id)
FROM animals AS a INNER JOIN diets AS d 
ON a.diet_id = d.id 
GROUP BY d.diet_type 


SELECT 
animals.id,
animals.name, 
animals.species,
diets.diet_type 
FROM animals INNER JOIN diets 
ON animals.diet_id = diets.id
WHERE animals.diet_id = 1;

SELECT 
a.*, 
d.*
FROM animals AS a LEFT JOIN diets AS d 
ON a.diet_id = d.id 


SELECT 
a.*, 
d.*
FROM animals AS a RIGHT JOIN diets AS d 
ON a.diet_id = d.id 


SELECT 
d.diet_type,
COUNT(a.id) AS num_animals
FROM animals AS a RIGHT JOIN diets AS d 
ON a.diet_id = d.id 
GROUP BY d.diet_type 


SELECT 
a.*, 
d.*
FROM animals AS a FULL OUTER JOIN diets AS d 
ON a.diet_id = d.id 


SELECT  
a.name AS animal_name,
a.id, 
a.species,
cs.day, 
k.name AS keeper_name
FROM (animals AS a INNER JOIN care_schedule AS cs ON a.id = cs.animal_id)
INNER JOIN keepers AS k 
ON cs.keeper_id = k.id
WHERE a.id = 7;


SELECT 
k.name AS employee_name,
m.name AS manager_name
FROM keepers AS k LEFT JOIN keepers AS m 
ON k.manager_id = m.id 






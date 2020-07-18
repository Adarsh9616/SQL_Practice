--Revising the Select Query I 
SELECT * 
FROM CITY
WHERE population>100000 AND countrycode='USA';

--Revising the Select Query II 
SELECT name
FROM city
WHERE population>120000 AND countrycode='USA';

--Select All 
SELECT *
FROM city;

--Select By ID 
SELECT *
FROM city
WHERE id=1661;

--Japanese Cities' Attributes 
SELECT *
FROM city
WHERE countrycode='JPN';

--Japanese Cities' Names 
SELECT name
FROM city
WHERE countrycode='JPN';

--Weather Observation Station 1 
SELECT city,state
FROM station;

--Weather Observation Station 3 
SELECT DISTINCT city
FROM station
WHERE (id%2)=0;

--Weather Observation Station 4 
SELECT COUNT(city)-COUNT(DISTINCT city)
from station;

--Weather Observation Station 9 
SELECT DISTINCT city
from station
WHERE city LIKE '[^AEIOU]%';

--Weather Observation Station 8 
SELECT DISTINCT city
from station
WHERE city LIKE '[AEIOU]%[AEIOU]';

--Weather Observation Station 7 
SELECT DISTINCT city
from station
WHERE city LIKE '%a' OR city LIKE '%e' OR city LIKE'%i' OR city LIKE '%o' OR city LIKE '%u';

--Weather Observation Station 6 
SELECT DISTINCT city
from station
WHERE city LIKE 'a%' OR city LIKE 'e%' OR city LIKE'i%' OR city LIKE 'o%' OR city LIKE 'u%';

--Weather Observation Station 5 
select CITY,LENGTH(CITY) from STATION order by Length(CITY) asc, CITY limit 1; 
select CITY,LENGTH(CITY) from STATION order by Length(CITY) desc, CITY limit 1;

--Employee Names 
SELECT name
FROM employee
ORDER BY name;

--Higher Than 75 Marks 
SELECT NAME FROM STUDENTS WHERE Marks > 75 ORDER BY RIGHT(NAME, 3), ID ASC;

--Weather Observation Station 12 
SELECT DISTINCT city
from station
WHERE city LIKE '[^AEIOU]%' AND city LIKE '%[^AEIOU]';

--Weather Observation Station 11 
SELECT DISTINCT city
from station
WHERE city LIKE '[^AEIOU]%' OR city LIKE '%[^AEIOU]';

--Weather Observation Station 10 
SELECT DISTINCT city
from station
WHERE city LIKE '%[^AEIOU]';

--Revising Aggregations - Averages
SELECT AVG(population)
FROM city
WHERE district='california';

--Revising Aggregations - The Sum Function 
SELECT SUM(population)
FROM city
WHERE district='california';

--Revising Aggregations - The Count Function 
SELECT COUNT(id)
FROM city
WHERE population>100000;

--Type of Triangle 
SELECT IF(A+B <= C,'Not A Triangle',IF(A = B AND A = C,'Equilateral',IF(A = B OR A = C OR B = C,'Isosceles','Scalene')))
FROM TRIANGLES;
                                                             
--Employee Salaries 
SELECT name
FROM employee
WHERE salary>2000 AND months<10
ORDER BY employee_id asc;
  
 --Top Earners 
  select (salary * months) as earnings ,count(*) from employee group by 1 order by earnings desc limit 1;
                                                                        
--The Blunder
SELECT CEIL((AVG(SALARY))-(AVG(REPLACE(SALARY,'0','')))) FROM EMPLOYEES;
                                       
--Population Density Difference  
SELECT MAX(population)-MIN(population)
FROM city;
                                       
--Japan Population
SELECT SUM(population)
FROM city
WHERE countrycode='jpn';
                                       
--Average Population                                        
SELECT ROUND(AVG(population))
FROM city;                                                                        

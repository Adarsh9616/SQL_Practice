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

--Weather Observation Station 2 
SELECT ROUND(SUM(lat_n),2),ROUND(SUM(long_w),2)
FROM station;

--Weather Observation Station 13 
SELECT ROUND(SUM(lat_n),4)
FROM station
WHERE lat_n>38.7880 AND lat_n<137.2345;

--Weather Observation Station 14 
SELECT ROUND(MAX(lat_n),4)
FROM station
WHERE lat_n<137.2345;

--Weather Observation Station 15 
SELECT ROUND(long_w,4)
FROM station
WHERE lat_n<137.2345
ORDER BY lat_n DESC
LIMIT 1;

--Weather Observation Station 16 
SELECT ROUND(lat_n,4)
FROM station
WHERE lat_n>38.7780
ORDER BY lat_n ASC
LIMIT 1;

--Weather Observation Station 17 
SELECT ROUND(long_w,4)
FROM station
WHERE lat_n>38.7780
ORDER BY lat_n ASC
LIMIT 1;

--Weather Observation Station 18 
SELECT ROUND(abs((MAX(LAT_N) - MIN(LAT_N)))+ABS((MAX(LONG_W)-MIN(LONG_W))),4) FROM STATION;

--Weather Observation Station 19 
select round(sqrt(power(min(lat_n)-max(lat_n),2)+power(min(long_w)-max(long_w),2)),4) from station;

--Weather Observation Station 20 
SELECT ROUND(AVG(S.LAT_N), 4) FROM STATION S WHERE
ABS((SELECT COUNT(*) FROM STATION WHERE LAT_N < S.LAT_N) -
(SELECT COUNT(*) FROM STATION WHERE LAT_N > S.LAT_N)) <= 1;

--SQL Project Planning 
SET sql_mode = '';
SELECT Start_Date, End_Date
FROM 
    (SELECT Start_Date FROM Projects WHERE Start_Date NOT IN (SELECT End_Date FROM Projects)) a,
    (SELECT End_Date FROM Projects WHERE End_Date NOT IN (SELECT Start_Date FROM Projects)) b 
WHERE Start_Date < End_Date
GROUP BY Start_Date 
ORDER BY DATEDIFF(End_Date, Start_Date), Start_Date;

--Asian Population 
SELECT SUM(CITY.POPULATION) 
FROM CITY, COUNTRY
WHERE CITY.COUNTRYCODE = COUNTRY.CODE AND COUNTRY.CONTINENT = 'Asia';

--African Cities 
SELECT city.name
FROM CITY, COUNTRY
WHERE CITY.COUNTRYCODE = COUNTRY.CODE AND COUNTRY.CONTINENT = 'Africa';

--Draw The Triangle 2 
DECLARE @i INT = 1
WHILE (@i <= 20) 
BEGIN
   PRINT REPLICATE('* ', @i) 
   SET @i = @i + 1
END

--Draw The Triangle 1 
DECLARE @i INT = 20
WHILE (@i > 0) 
BEGIN
   PRINT REPLICATE('* ', @i) 
   SET @i = @i - 1
END

--Top Competitors 
select h.hacker_id, h.name
from submissions s
inner join challenges c
on s.challenge_id = c.challenge_id
inner join difficulty d
on c.difficulty_level = d.difficulty_level 
inner join hackers h
on s.hacker_id = h.hacker_id
where s.score = d.score and c.difficulty_level = d.difficulty_level
group by h.hacker_id, h.name
having count(s.hacker_id) > 1
order by count(s.hacker_id) desc, s.hacker_id asc

--The Report 
SELECT (CASE g.grade>=8 WHEN TRUE THEN s.name ELSE null END),g.grade,s.marks 
FROM students s INNER JOIN grades g ON s.marks BETWEEN min_mark AND max_mark 
ORDER BY g.grade DESC,s.name,s.marks;

--Average Population of Each Continent 
SELECT COUNTRY.CONTINENT, FLOOR(AVG(CITY.POPULATION))
FROM CITY INNER JOIN COUNTRY
ON CITY.COUNTRYCODE = COUNTRY.CODE
GROUP BY COUNTRY.CONTINENT;

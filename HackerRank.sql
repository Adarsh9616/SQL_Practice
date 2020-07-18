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

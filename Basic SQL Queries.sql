

--Delete the table
DROP TABLE student;

-- create the table
CREATE TABLE student (
    student_id INT PRIMARY KEY,
    name VARCHAR(20),
    major VARCHAR(20)
);

-- display its attributes
DESCRIBE student;

--delete table
DROP TABLE student;

-- Alter table adding a new column
ALTER TABLE student ADD gpa DECIMAL(3,2);
DESCRIBE student;

ALTER TABLE student DROP COLUMN gpa;
DESCRIBE student;

-- Displaying all the data of the table
SELECT * FROM student;

--Intserting into the table
INSERT INTO student VALUES(1,'Jack','Biology');
INSERT INTO student VALUES(2,'Kate','Sociology');
INSERT INTO student VALUES(3,'Claire','Chemistry');
INSERT INTO student VALUES(4,'Jack','Biology');
INSERT INTO student VALUES(5,'Mike','Computer Science');

INSERT INTO student(name,major) VALUES('Jack','cs');
INSERT INTO student(name,major) VALUES('Jac','cs');

-- updating values in the table with a particular condition
UPDATE student
SET major='Comp Sci'
WHERE student_id=4;

UPDATE student
SET major='Biochemistry'
WHERE major='Biology' OR major='Chemistry';

UPDATE student
SET name='Tom',major='undicided'
WHERE student_id=1;

SELECT * FROM student;

UPDATE student
SET major='undicided';

-- deleteing particular value from the table
DELETE FROM student
WHERE student_id=5;

DELETE FROM student
WHERE name='Tom'AND major='undicided';

SELECT student.name,student.major
FROM student
ORDER BY student_id ASC;

SELECT * 
FROM student
ORDER BY major, student_id;

SELECT *
FROM student
ORDER BY name DESC
LIMIT 2;

SELECT name,major
FROM student
WHERE major<>'Biology' OR major='Chemistry' OR name='Kate';

-- comments  <>-NOt EQual


SELECT name,major
FROM student
WHERE name IN('Kate','Claire','Mike');


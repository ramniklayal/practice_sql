CREATE TABLE student (
    student_id INT PRIMARY KEY,
    name VARCHAR(10),
    major VARCHAR(10)
);

DESCRIBE student;

DROP TABLE student;

ALTER TABLE student ADD gpa DECIMAL(3, 2);

ALTER TABLE student DROP COLUMN gpa;

INSERT INTO student VALUES(1, 'Jack', 'Bio');
INSERT INTO student VALUES(2, 'Kate', 'Sociology');
INSERT INTO student VALUES(3, 'Claire', 'Chemistry');
INSERT INTO student VALUES(4, 'Jack', 'Bio' );
INSERT INTO student VALUES(5, 'Mike', 'Comp Sci');

SELECT * FROM student;

SELECT student.name, student.major  
FROM student
ORDER BY name DESC
LIMIT 3;

SELECT *
FROM student
ORDER BY major, student_id;
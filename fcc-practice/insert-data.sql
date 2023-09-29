CREATE TABLE student (
    student_id INT PRIMARY KEY,
    name VARCHAR(10),
    major VARCHAR(10)
);

DROP TABLE student;

SELECT * FROM student;

INSERT INTO student VALUES(5, 'Mike', 'Comp Sci');              -- Inserts values to the table

INSERT INTO student(student_id, name) VALUES(3, 'Claire');      -- Inserts specific values that are mentioned in brackets to the table

UPDATE student
SET major = 'Chemistry'
WHERE major = 'English';                                        -- Update syntax to change particular record

UPDATE student
SET major = 'Bio'
WHERE major = 'Biology';                                        -- Another example of updating database

UPDATE student
SET major = 'English'
WHERE student_id = 3;                                           -- Example of updating one field using another as selector

UPDATE student
SET major = 'Biochem'
WHERE major = 'Bio' OR major = 'Chemistry';                     -- Example of combining two records to single major using OR logic

SELECT * FROM student;
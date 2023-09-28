CREATE TABLE student (
    student_id INT,
    name VARCHAR(10),
    major VARCHAR(10)
);

DESCRIBE student;

DROP TABLE student;

ALTER TABLE student ADD gpa DECIMAL(3, 2);

ALTER TABLE student DROP COLUMN gpa;
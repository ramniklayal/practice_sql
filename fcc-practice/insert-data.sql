CREATE TABLE student (
    student_id INT PRIMARY KEY,
    name VARCHAR(10),
    major VARCHAR(10)
);

SELECT * FROM student;

INSERT INTO student VALUES(2, 'Kate', 'Sociology');

INSERT INTO student(student_id, name) VALUES(3, 'Claire')
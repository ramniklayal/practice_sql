CREATE TABLE employee (
  emp_id INT PRIMARY KEY,
  first_name VARCHAR(40),
  last_name VARCHAR(40),
  birth_day DATE,
  sex VARCHAR(1),
  salary INT,
  super_id INT,
  branch_id INT
);

CREATE TABLE branch (
  branch_id INT PRIMARY KEY,
  branch_name VARCHAR(40),
  mgr_id INT,
  mgr_start_date DATE,
  FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL
);

ALTER TABLE employee
ADD FOREIGN KEY(branch_id)
REFERENCES branch(branch_id)
ON DELETE SET NULL;

ALTER TABLE employee
ADD FOREIGN KEY(super_id)
REFERENCES employee(emp_id)
ON DELETE SET NULL;

CREATE TABLE client (
  client_id INT PRIMARY KEY,
  client_name VARCHAR(40),
  branch_id INT,
  FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
);

CREATE TABLE works_with (
  emp_id INT,
  client_id INT,
  total_sales INT,
  PRIMARY KEY(emp_id, client_id),
  FOREIGN KEY(emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
  FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE
);

CREATE TABLE branch_supplier (
  branch_id INT,
  supplier_name VARCHAR(40),
  supply_type VARCHAR(40),
  PRIMARY KEY(branch_id, supplier_name),
  FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
);

-- Corporate
INSERT INTO employee VALUES(100, 'David', 'Wallace', '1967-11-17', 'M', 250000, NULL, NULL);

INSERT INTO branch VALUES(1, 'Corporate', 100, '2006-02-09');

UPDATE employee
SET branch_id = 1
WHERE emp_id = 100;

INSERT INTO employee VALUES(101, 'Jan', 'Levinson', '1961-05-11', 'F', 110000, 100, 1);

-- Scranton
INSERT INTO employee VALUES(102, 'Michael', 'Scott', '1964-03-15', 'M', 75000, 100, NULL);

INSERT INTO branch VALUES(2, 'Scranton', 102, '1992-04-06');

UPDATE employee
SET branch_id = 2
WHERE emp_id = 102;

INSERT INTO employee VALUES(103, 'Angela', 'Martin', '1971-06-25', 'F', 63000, 102, 2);
INSERT INTO employee VALUES(104, 'Kelly', 'Kapoor', '1980-02-05', 'F', 55000, 102, 2);
INSERT INTO employee VALUES(105, 'Stanley', 'Hudson', '1958-02-19', 'M', 69000, 102, 2);

-- Stamford
INSERT INTO employee VALUES(106, 'Josh', 'Porter', '1969-09-05', 'M', 78000, 100, NULL);

INSERT INTO branch VALUES(3, 'Stamford', 106, '1998-02-13');

UPDATE employee
SET branch_id = 3
WHERE emp_id = 106;

INSERT INTO employee VALUES(107, 'Andy', 'Bernard', '1973-07-22', 'M', 65000, 106, 3);
INSERT INTO employee VALUES(108, 'Jim', 'Halpert', '1978-10-01', 'M', 71000, 106, 3);


-- BRANCH SUPPLIER
INSERT INTO branch_supplier VALUES(2, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Patriot Paper', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'J.T. Forms & Labels', 'Custom Forms');
INSERT INTO branch_supplier VALUES(3, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(3, 'Stamford Lables', 'Custom Forms');

-- CLIENT
INSERT INTO client VALUES(400, 'Dunmore Highschool', 2);
INSERT INTO client VALUES(401, 'Lackawana Country', 2);
INSERT INTO client VALUES(402, 'FedEx', 3);
INSERT INTO client VALUES(403, 'John Daly Law, LLC', 3);
INSERT INTO client VALUES(404, 'Scranton Whitepages', 2);
INSERT INTO client VALUES(405, 'Times Newspaper', 3);
INSERT INTO client VALUES(406, 'FedEx', 2);

-- WORKS_WITH
INSERT INTO works_with VALUES(105, 400, 55000);
INSERT INTO works_with VALUES(102, 401, 267000);
INSERT INTO works_with VALUES(108, 402, 22500);
INSERT INTO works_with VALUES(107, 403, 5000);
INSERT INTO works_with VALUES(108, 403, 12000);
INSERT INTO works_with VALUES(105, 404, 33000);
INSERT INTO works_with VALUES(107, 405, 26000);
INSERT INTO works_with VALUES(102, 406, 15000);
INSERT INTO works_with VALUES(105, 406, 130000);

SELECT * FROM branch_supplier;

-- More basic queries

SELECT * FROM employee ORDER BY salary DESC;

-- Ordered by sex then name
SELECT * FROM employee ORDER BY sex, first_name, last_name;

-- Find first 5 employees in table
SELECT * FROM employee LIMIT 5;

-- First and last names of all employees
SELECT first_name, last_name FROM employee;

-- Forename and surnames of all employees
SELECT first_name AS forename, last_name AS surname FROM employee;

-- Find all different genders
SELECT DISTINCT sex FROM employee;

-- Find all different branches
SELECT DISTINCT branch_id FROM employee;

SELECT * FROM employee;


-- FUNCTIONS (includes Aggregation)

-- Find number of employees
SELECT COUNT(emp_id) FROM employee;

-- Number of employees with supervisor
SELECT COUNT(super_id) FROM employee;

-- Number of female emps born after 1970
SELECT COUNT(emp_id) FROM employee WHERE sex='F' AND birth_day > '1971-01-01';

-- Avg salary of emps
SELECT AVG(salary) FROM employee;

-- Avg salary of male emps
SELECT AVG(salary) FROM employee WHERE sex = 'M';

-- Sum of salary of all emps
SELECT SUM(salary) FROM employee;

-- Aggregation
-- Find out how many males and females there are
SELECT COUNT(sex), sex FROM employee GROUP BY sex;

-- Find total sales of each salesman
SELECT SUM(total_sales), emp_id FROM works_with GROUP BY emp_id;

-- Find total sales to each client
SELECT SUM(total_sales), client_id FROM works_with GROUP BY client_id;

-- Find any client's who are an LLC
SELECT * FROM client WHERE client_name LIKE '%LLC';

-- Find any branch suppliers who are in label business
SELECT * FROM branch_supplier WHERE supplier_name LIKE '%Label%';

-- Find emp born in October
SELECT * FROM employee WHERE birth_day LIKE '____-10%';

-- Find any clients who are schools
SELECT * FROM client WHERE client_name LIKE '%school%';

-- Union
-- Find a list of employee and branch names
SELECT first_name AS company_names FROM employee UNION SELECT branch_name FROM branch UNION SELECT client_name FROM client; -- Union can only combine same number of columns, only combine same data types. The first column name shows up as the main column, but AS can change the name in query.

-- Find a list of all clients & branch suppliers' names
SELECT client_name, client.branch_id FROM client UNION SELECT supplier_name, branch_supplier.branch_id FROM branch_supplier;

-- Find a list of all money spent or earned by the company
SELECT salary FROM employee UNION SELECT total_sales FROM works_with;

-- UNION basically combines results from 2 or more SELECT queries

-- JOINS
INSERT INTO branch VALUES(4, 'Buffalo', NULL, NULL);

SELECT * FROM branch;

-- Find all branches and the names of their managers
SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM employee
JOIN branch    -- LEFT JOIN, RIGHT JOIN
ON employee.emp_id = branch.mgr_id;

SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM employee
LEFT JOIN branch
ON employee.emp_id = branch.mgr_id;
-- With LEFT JOIN, the table in the FROM line is the left table and vice versa with RIGHT JOIN
-- 4th type of join is not possible in mySQL, called FULL OUTER JOIN. Its basically a left and right join combined. E.g. Grabbing both employee and branch table even if not similar columns

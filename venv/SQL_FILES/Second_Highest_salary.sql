Table: Employee

+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| salary      | int  |
+-------------+------+
id is the primary key (column with unique values) for this table.
Each row of this table contains information about the salary of an employee.
 

Write a solution to find the second highest distinct salary from the Employee table. If there is no second highest salary, return null (return None in Pandas).

The result format is in the following example.

 

Example 1:

Input: 
Employee table:
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
Output: 
+---------------------+
| SecondHighestSalary |
+---------------------+
| 200                 |
+---------------------+
Example 2:

Input: 
Employee table:
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
+----+--------+
Output: 
+---------------------+
| SecondHighestSalary |
+---------------------+
| null                |
+---------------------+


  CREATE TABLE Employee (
    id INT PRIMARY KEY,
    salary INT
);
INSERT INTO Employee (id, salary) VALUES
(1, 100),
(2, 200),
(3, 300);
 
SELECT 
    MAX(salary)
FROM
    employee
WHERE
    salary < (SELECT 
            MAX(salary)
        FROM
            employee);
   
-- Clear existing data (optional if you're rerunning)
DELETE FROM Employee;
CREATE TABLE Employee (
    id INT PRIMARY KEY,
    salary INT
);
-- Insert new sample data (Example 2)
INSERT INTO Employee (id, salary) VALUES
(1, 100);

SELECT 
    MAX(salary)
FROM
    employee
WHERE
    salary < (SELECT 
            MAX(salary)
        FROM
            employee);

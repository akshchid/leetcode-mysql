+-------------+---------+
|  Name         |  type      |
+-------------+---------+
| employee_id | int     |
| name        | varchar |
| salary      | int     |
+-------------+---------+
employee_id It's the primary key of this table .
Each row of this table shows the employees id , Name and salary .

Write a SQL Query statement , Calculate the bonus for each employee .
If an employee's id Is odd And his name Not in ’M’ start , Then his bonus is his salary 100%, Otherwise, the bonus is 0.

Return the result table ordered by employee_id.

For the returned result set, please follow employee_id Sort .

The query result format is shown in the following example ：

Employees surface :

+-------------+---------+--------+
| employee_id | name    | salary |
+-------------+---------+--------+
| 2           | Meir    | 3000   |
| 3           | Michael | 3800   |
| 7           | Addilyn | 7400   |
| 8           | Juan    | 6100   |
| 9           | Kannon  | 7700   |
+-------------+---------+--------+
Result sheet :

+-------------+-------+
| employee_id | bonus |
+-------------+-------+
| 2           | 0     |
| 3           | 0     |
| 7           | 7400  |
| 8           | 0     |
| 9           | 7700  |
+-------------+-------+
Because employees id It's even , So employees id yes 2 and 8 The bonus for two of our employees is 0.
Employee id by 3 Because his name is ’M’ start , therefore , Bonus is 0.
The other employees got a 100% bonus .

*/


SELECT
    employee_id,
    CASE
        WHEN employee_id % 2 = 1 AND name NOT LIKE 'M%' THEN salary
        ELSE 0
    END AS bonus
FROM Employees
ORDER BY employee_id;

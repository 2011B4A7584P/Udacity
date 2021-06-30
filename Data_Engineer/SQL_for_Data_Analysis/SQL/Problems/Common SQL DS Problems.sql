/*Find 2nd highest salary/sales from an employee/sales table*/
/*Best solution*/
SELECT IFNULL((SELECT DISTINCT s.sale FROM sales s ORDER BY 1 DESC LIMIT 1 OFFSET 1), NULL) AS second_highest_sale FROM sales s LIMIT 1;
SELECT MAX(s.sale) AS second_highest_sale FROM sales s WHERE s.sale <> (SELECT MAX(sale) FROM sales);

/*In case nth highest salary is asked, then*/
SELECT IFNULL((SELECT DISTINCT s.sale FROM sales s ORDER BY 1 DESC LIMIT 1 OFFSET n-1), NULL) AS nth_highest_sale FROM sales s LIMIT 1;

/*Duplicate emails*/
CREATE TABLE person (ID integer, email VARCHAR(100));
SELECT p.email FROM person p GROUP BY 1 HAVING COUNT(p.email) > 1;
SELECT x.email FROM (SELECT p.email, COUNT(p.email) AS num FROM person p GROUP BY 1)x WHERE x.num > 1;

/*Duplicate sales_rep_name*/
SELECT s.sales_employee FROM sales s GROUP BY 1 HAVING COUNT(s.sales_employee) > 1;
SELECT x.sales_employee FROM (SELECT s.sales_employee, COUNT(s.sales_employee) AS num FROM sales s GROUP BY 1)x WHERE x.num > 1;

/*Rising temperature as compared to previous day from weather table - id, record_date, temp*/
CREATE TABLE weather(ID integer PRIMARY KEY, record_date DATE, temp integer);
SELECT DISTINCT w1.id FROM weather w1, weather w2 WHERE w1.temp < w2.temp AND DATEDIFF(w2.record_date,w1.record_date) = 1;

/*Find highest salary across departments in an employee database*/
CREATE TABLE employee(id INTEGER PRIMARY KEY, name VARCHAR(50), Salary BIGINT, Dept_Id INTEGER);
CREATE TABLE department(Dept_Id INTEGER PRIMARY KEY, Dept_Name VARCHAR(50));
SELECT * FROM employee;
SELECT * FROM department;

SELECT d.dept_name, x.name,x.max_dept_salary FROM 
(SELECT e.dept_id,e.name, e.salary, MAX(e.salary) OVER (PARTITION BY e.dept_id) AS max_dept_salary FROM employee e)x
JOIN department d ON x.dept_id = d.dept_id WHERE x.salary = x.max_dept_salary;

SELECT d.dept_name, e.name, e.salary  FROM employee e JOIN department d ON e.dept_id = d.dept_id WHERE (e.dept_id, e.salary) 
IN (SELECT x.dept_id, MAX(x.salary) FROM employee x GROUP BY 1);

/*Exchange Seats - flip seats of adjacent students*/
CREATE TABLE seat (ID INTEGER PRIMARY KEY , student VARCHAR(50));
INSERT INTO seat VALUES (6, 'Ashish');

SELECT * FROM seat;

SELECT x.id, x.student FROM (
SELECT CASE WHEN ((SELECT MAX(id) FROM seat)%2 = 1) AND id = (SELECT MAX(id) FROM seat) THEN id
            WHEN id % 2 = 1 THEN id+1
            ELSE id - 1
            END AS id, student FROM seat) x ORDER BY 1;

/*Subscription Overlap*/
CREATE TABLE subscriptions (ID integer, start_date DATE, end_date DATE);
SELECT * FROM subscriptions;


SELECT y.id, CASE WHEN y.status = 0 THEN 'FALSE' ELSE 'TRUE' END AS overlap FROM (
SELECT x.id, SUM(x.overlap) AS status FROM(
SELECT s1.id, CASE WHEN (s1.start_date BETWEEN s2.start_date AND s2.end_date) OR (s1.end_date BETWEEN s2.start_date AND s2.end_date) THEN TRUE
                   ELSE FALSE END AS overlap FROM subscriptions s1, subscriptions s2 WHERE s1.id <> s2.id)x group by 1 order by 1) y;
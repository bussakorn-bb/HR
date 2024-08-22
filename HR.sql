CREATE TABLE Team (
  team_id INT PRIMARY KEY,
  team_name VARCHAR(50)
);

CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(255) UNIQUE,
    hire_date DATE,
    team_id INT,
    FOREIGN KEY (team_id) REFERENCES team(team_id)
);

CREATE TABLE Salary (
  employee_id INT PRIMARY KEY,
  role VARCHAR(50),
  salary INTEGER
);

-- เพิ่มข้อมูลไปในแต่ละ Table
INSERT INTO employee (employee_id, first_name, last_name, email, hire_date, team_id)
VALUES 
(1, 'Warde', 'Remon', 'wremon0@zimbio.com', '2023-06-01', 1),
(2, 'Orlando', 'Groneway', 'ogroneway1@wikipedia.org', '2023-06-22', 2),
(3, 'Amalita', 'Shorland', 'ashorland2@npr.org', '2023-03-25', 2),
(4, 'Reinwald', 'Pickersail', 'rpickersail3@skyrock.com', '2023-06-24', 3),
(5, 'Ilario', 'Anfrey', 'ianfrey4@google.com', '2023-01-02', 1),
(6, 'Davey', 'Frowen', 'dfrowen5@nsw.gov.au', '2022-03-03', 3),
(7, 'Leigha', 'Randlesome', 'lrandlesome6@alibaba.com', '2022-10-15', 1),
(8, 'Junia', 'Yakovliv', 'jyakovliv7@artisteer.com', '2023-07-31', 2),
(9, 'Rochell', 'Waggatt', 'rwaggatt8@opera.com', '2023-04-15', 1),
(10, 'Moises', 'Ardley', 'mardley9@webnode.com', '2022-06-21', 3),
(11, 'Jennie', 'Smit', 'jenniejj9@google.com', '2023-05-10', 1),
(12, 'Shawn', 'Wonga', 'wongash9@hotmail.com', '2023-12-25', 2),
(13, 'Annie', 'Lalaler', 'annie019@npr.org.com', '2023-06-21', 3),
(14, 'Chisa', 'Mars', 'marschisa9@webnode.com', '2023-06-18', 3),
(15, 'Daisy', 'Flowiwa', 'flwwdaisy9@alibaba.com', '2023-04-26', 1);
.mode box
SELECT*FROM employee;

INSERT INTO team (team_id, team_name)
VALUES (1, 'team_a'),
(2, 'team_b'),
(3, 'team_c');
.mode box
SELECT*FROM team;

INSERT INTO salary (employee_id, role, salary)
VALUES (1, 'Sales', 27000),
(2, 'Marketing', 55000),
(3, 'Legal', 36000),
(4, 'Sales', 40000),
(5, 'Software Engineer', 50000),
(6, 'Sales', 38000),
(7, 'Sales', 29000),
(8, 'Software Engineer', 31000),
(9, 'Admin', 25000),
(10, 'Software Engineer', 45000),
(11, 'Marketing', 45000),
(12, 'Accountant', 65000),
(13, 'Human Resources', 25000),
(14, 'Marketing', 35000),
(15, 'Legal', 32000);
.mode box
SELECT*FROM salary;


------Retrieve member data for all teams
SELECT team.team_name, 
first_name || ' ' || last_name AS fullname,
salary.role AS position, 
salary.salary
FROM employee 
JOIN team ON employee.team_id = team.team_id
JOIN salary ON employee.employee_id = salary.employee_id
ORDER BY team.team_name;
------Retrieve highest and lowest salary
SELECT 
    MAX(salary) AS max_salary,
    MIN(salary) AS min_salary
FROM 
    salary;
-------Retrieve data for the top 3 highest paid 
SELECT 
    first_name || ' ' || last_name AS fullname,
    salary
FROM 
    employee
    JOIN salary ON employee.employee_id = salary.employee_id
ORDER BY 
    salary DESC
LIMIT 3;
---------Retrieve number for employee for each position
SELECT 
    role AS position,
    COUNT(*) AS position_count
FROM 
    salary
GROUP BY 
    role
ORDER BY 
    position_count DESC;
---------Retrieve the number of employees hired in 2022 and 2023
SELECT 
    COUNT(CASE WHEN hire_date >= '2022-01-01' AND hire_date <= '2022-12-31' THEN 1 END) AS '2022',
    COUNT(CASE WHEN hire_date >= '2023-01-01' AND hire_date <= '2023-12-31' THEN 1 END) AS '2023'
FROM 
    employee;





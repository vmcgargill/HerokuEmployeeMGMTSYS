-- Create Database
DROP DATABASE IF EXISTS employee_db;
CREATE DATABASE employee_db;
USE employee_db;

-- Create Employee Table
CREATE TABLE employee (
  id int NOT NULL primary key AUTO_INCREMENT,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  role_id int NOT NULL,
  manager_id int NOT NULL
);

-- Create Employee Role Table 
CREATE TABLE employee_role (
  id int NOT NULL primary key AUTO_INCREMENT,
  title VARCHAR(30) NOT NULL,
  salary DECIMAL NOT NULL,
  department_id int NOT NULL
);

-- Create Department Table
CREATE TABLE department (
  id int NOT NULL primary key AUTO_INCREMENT,
  name VARCHAR(30) NOT NULL
);

-- Inser Department Values
INSERT INTO department (name)
VALUES ("Executive"), ("Management"), ("Sales"), ("Production"), 
("Information Technology"), ("Human Resources"), ("Accounting & Finance");

-- Insert Employee Roles
INSERT INTO employee_role (title, salary, department_id)
-- Executive Department
VALUES ("Chief Executive Official", 1000000.00, 1), 
("President of Sales & Marketing", 500000.00, 1),
("Chief Product Officer", 500000.00, 1), 
("Chief Technology Officer", 500000.00, 1),
("Chief Human Resource Officer", 500000.00, 1), 
("Chief Financial Officer", 500000.00, 1), 
-- Management Department
("Sales Manager", 100000.00, 2), 
("Production Manager", 100000.00, 2), 
("IT Manager", 100000.00, 2), 
("HR Manager", 100000.00, 2), 
("Finance Manager", 100000.00, 2), 
("Accounting Manager", 100000.00, 2), 
-- Sales
("Sales Represenative", 60000.00, 3), 
("Marketing Intern", 20000.00, 3), 
-- Production
("Production Associate", 40000.00, 4), 
("Customer Service Represenative", 40000.00, 4),  
("Order Specialist", 40000.00, 4), 
-- IT
("Software Developer", 80000.00, 5), 
("Desktop Support Specialist", 40000.00, 5),
-- HR
("Human Resource Coordinator", 40000.00, 6), 
("Human Resource Assistant", 20000.00, 6), 
-- Accounting & Finance
("Accountant", 50000.00, 7), 
("Bookkeeper", 40000.00, 7), 
("Financial Analyst", 50000.00, 7), 
("Finance Intern", 20000.00, 7);

-- Insert Employees Values
INSERT INTO employee (first_name, last_name, role_id, manager_id)
VALUES 
-- Executives
("Bill", "Gates", 1, 1), -- 1
("Steve", "Jobs", 2, 1), -- 2
("Mark", "Zuckerberg", 3, 1), -- 3
("Elon", "Musk", 4, 1), -- 4
("Jeff", "Bezos", 5, 1), -- 5
("Warren", "Buffet", 6, 1), -- 6
-- Managers
("King", "Midas", 7, 2), -- 7
("Julius", "Caesar", 8, 3), -- 8
("Genghis", "Khan", 9, 4), -- 9
("Queen", "Victoria", 10, 5), -- 10
("Alexander", "III Macedonia", 11, 6), -- 11
("Queen", "Elizabeth", 12, 6), -- 12
-- Sales Represenatives
("Barrack", "Obama", 13, 7), 
("Donald", "Trump", 13, 7),
("Joe", "Biden", 13, 7),
("Hilary", "Clinton", 13, 7),
-- Marketing Interns
("Mike", "Pence", 14, 7),
("Al", "Gore", 14, 7),
("Kamala", "Harris", 14, 7),
-- Production Associates
("George", "Washington", 15, 8),
("Abraham", "Lincoln", 15, 8),
("Franklin", "Roosevelt", 15, 8),
-- Customer Service Represenatives
("Theodore", "Roosevelt", 16, 8),
("Thomas", "Jefferson", 16, 8),
-- Order Specialist
("Benjamin", "Franklin", 17, 8),
-- Software Developer
("Thomas", "Edison", 18, 9),
("Nikola", "Tesla", 18, 9),
-- Desktop Support Specialist
("Isaac", "Newton", 19, 9),
("Albert", "Einstein", 19, 9),
("Johann", "Goethe", 19, 9),
-- Human Resource Coordinator
("Elvis", "Presley", 20, 10),
("Johnny", "Cash", 20, 10),
-- Human Resource Assistant
("Michael", "Jackson", 21, 10),
("Marshal", "Mathers", 21, 10),
-- Accountant
("John", "Lennon", 22, 11),
("Paul", "McCartney", 22, 11),
-- Bookkeeper
("George", "Harrison", 23, 11),
("Ringo", "Starr", 23, 11),
-- Financial Analyst
("Vlad", "Dracula", 24, 12),
("Elizabeth", "Báthory", 24, 12),
-- Finance Intern
("Van", "Helsing", 25, 12);

-- To see data
-- SELECT * FROM department;
-- SELECT * FROM employee_role;
-- SELECT * FROM employee;
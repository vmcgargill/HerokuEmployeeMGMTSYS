const PORT = process.env.PORT || 8080;
const username = process.env.username;
const password = process.env.password;
const database = process.env.database;
const host = process.env.host;
const express = require("express");
const EmployeeMGMTServer = express();
const path = require("path");
const mysql = require("mysql");
EmployeeMGMTServer.use(express.static('public'));
EmployeeMGMTServer.use(express.urlencoded({ extended: true }));
EmployeeMGMTServer.use(express.json());

const EmployeeTableQuery = `
SELECT employee.id, CONCAT(employee.first_name , ' ' , employee.last_name) AS name FROM employee`;

const RoleTableQuery = `
SELECT * FROM employee_role`;

const DepartmetnQueryAll = `SELECT * FROM department`;

// For heroku deployment
// Creates connection to MySQL database
const connection = mysql.createConnection({
    host: host,
    port: 3306,
    user: username,
    password: password,
    database: database
});

// For testing purposes only
// const connection = mysql.createConnection({
//     host: "localhost",
//     port: 3306,
//     user: "root",
//     password: "password",
//     database: "employee_db"
// });

// Connects to MySQL database and initializes the start of the app
connection.connect(function(err) {
    if (err) throw err;
});

// Load home page
EmployeeMGMTServer.get("/", function(req, res) {
  res.sendFile(path.join(req.url + ".html"));
});

// Load home page
EmployeeMGMTServer.get("/employee", function(req, res) {
    res.sendFile(path.join(__dirname, "public" + req.url));
});

  // Load home page
EmployeeMGMTServer.get("/department", function(req, res) {
    res.sendFile(path.join(__dirname, "public" + req.url + ".html"));
  });

  // Load home page
EmployeeMGMTServer.get("/role", function(req, res) {
    res.sendFile(path.join(__dirname, "public" + req.url + ".html"));
});

// API request that gets all employees
EmployeeMGMTServer.get("/api/employee", function(req, res) {
    connection.query(EmployeeTableQuery, function(err, results) {
        if (err) throw err;
        return res.json(results);
    });
});

// API request that gets all departments
EmployeeMGMTServer.get("/api/department", function(req, res) {
    connection.query(DepartmetnQueryAll, function(err, results) {
        if (err) throw err;
        return res.json(results);
    });
});

// API request that gets all roles
EmployeeMGMTServer.get("/api/role", function(req, res) {
    connection.query(RoleTableQuery, function(err, results) {
        if (err) throw err;
        return res.json(results);
    });
});

// Start server listener
EmployeeMGMTServer.listen(PORT, function() {
    console.log("Server is listening on http://localhost:" + PORT);
});
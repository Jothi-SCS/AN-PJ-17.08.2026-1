CREATE DATABASE CollegeDB;

USE CollegeDB;

CREATE TABLE Department (
    DepartmentID NUMERIC(5) PRIMARY KEY,
    DepartmentName VARCHAR(20) NOT NULL,
    HOD VARCHAR(20) NOT NULL
);

DESCRIBE Department;

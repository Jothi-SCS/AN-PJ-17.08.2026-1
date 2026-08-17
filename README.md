# CollegeDB – Department Table

## SQL Database Assignment

### Objective

To create a MySQL database named `CollegeDB` and create a `Department` table with the specified fields and constraints.

---

## Problem Statement

Create a database named `CollegeDB` and create a table named `Department` with the following fields:

| Field | Data Type | Constraint |
|---|---|---|
| DepartmentID | INT(5) | PRIMARY KEY |
| DepartmentName | VARCHAR(20) | — |
| HOD | VARCHAR(20) | — |

---

## Requirements

Your SQL program must:

1. Create a database named `CollegeDB`.
2. Select/use the `CollegeDB` database.
3. Create a table named `Department`.
4. Create `DepartmentID` as an integer field.
5. Set `DepartmentID` as the PRIMARY KEY.
6. Create `DepartmentName` as `VARCHAR(20)`.
7. Create `HOD` as `VARCHAR(20)`.

---

## Submission Instructions

1. Accept the GitHub Classroom assignment.
2. Open the file:

       solution.sql

3. Write your SQL program in `solution.sql`.
4. Save the file.
5. Commit your changes.
6. Push the changes to GitHub.
7. GitHub Actions will automatically execute the test cases.

---

## Important

Do not modify:

- `.github/workflows/autograding.yml`
- `tests/test.sh`

Only modify:

- `solution.sql`

---

## Autograding

The program will be evaluated automatically using MySQL and GitHub Actions.

The following test cases will be checked:

- CollegeDB database exists.
- Department table exists.
- DepartmentID column exists.
- DepartmentID is INT.
- DepartmentID is PRIMARY KEY.
- DepartmentName is VARCHAR(20).
- HOD is VARCHAR(20).

---

## Marks

| Test Case | Marks |
|---|---:|
| CollegeDB database | 1 |
| Department table | 1 |
| DepartmentID | 1 |
| DepartmentID INT | 1 |
| PRIMARY KEY | 2 |
| DepartmentName VARCHAR(20) | 2 |
| HOD VARCHAR(20) | 2 |
| **Total** | **10** |

---

## Expected SQL Structure

The solution should contain SQL statements similar to:

```sql
CREATE DATABASE CollegeDB;

USE CollegeDB;

CREATE TABLE Department (
    DepartmentID INT(5) PRIMARY KEY,
    DepartmentName VARCHAR(20),
    HOD VARCHAR(20)
);

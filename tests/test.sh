#!/bin/bash

set -u

MYSQL="mysql -h 127.0.0.1 -uroot -proot -N -B"

PASS=0
FAIL=0

pass() {
    echo "✅ PASS: $1"
    PASS=$((PASS+1))
}

fail() {
    echo "❌ FAIL: $1"
    FAIL=$((FAIL+1))
}

echo "======================================"
echo " CollegeDB Department Autograder"
echo "======================================"

# Test Case 1: CollegeDB database exists
DB_EXISTS=$($MYSQL -e "
SELECT SCHEMA_NAME
FROM INFORMATION_SCHEMA.SCHEMATA
WHERE SCHEMA_NAME='CollegeDB';
")

if [ "$DB_EXISTS" = "CollegeDB" ]; then
    pass "Test 1 - CollegeDB database exists"
else
    fail "Test 1 - CollegeDB database does not exist"
fi

# Stop if database does not exist
if [ "$DB_EXISTS" != "CollegeDB" ]; then
    echo ""
    echo "Final Result: FAILED"
    exit 1
fi

# Test Case 2: Department table exists
TABLE_EXISTS=$($MYSQL -e "
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA='CollegeDB'
AND TABLE_NAME='Department';
")

if [ "$TABLE_EXISTS" = "Department" ]; then
    pass "Test 2 - Department table exists"
else
    fail "Test 2 - Department table does not exist"
fi

if [ "$TABLE_EXISTS" != "Department" ]; then
    echo ""
    echo "Final Result: FAILED"
    exit 1
fi

# Test Case 3: DepartmentID exists
COLUMN_ID=$($MYSQL -e "
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA='CollegeDB'
AND TABLE_NAME='Department'
AND COLUMN_NAME='DepartmentID';
")

if [ "$COLUMN_ID" = "DepartmentID" ]; then
    pass "Test 3 - DepartmentID column exists"
else
    fail "Test 3 - DepartmentID column is missing"
fi

# Test Case 4: DepartmentID is integer
TYPE_ID=$($MYSQL -e "
SELECT DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA='CollegeDB'
AND TABLE_NAME='Department'
AND COLUMN_NAME='DepartmentID';
")

if [ "$TYPE_ID" = "int" ]; then
    pass "Test 4 - DepartmentID is INT"
else
    fail "Test 4 - DepartmentID is not INT"
fi

# Test Case 5: DepartmentID is PRIMARY KEY
PK_ID=$($MYSQL -e "
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA='CollegeDB'
AND TABLE_NAME='Department'
AND CONSTRAINT_NAME='PRIMARY'
AND COLUMN_NAME='DepartmentID';
")

if [ "$PK_ID" = "DepartmentID" ]; then
    pass "Test 5 - DepartmentID is PRIMARY KEY"
else
    fail "Test 5 - DepartmentID is not PRIMARY KEY"
fi

# Test Case 6: DepartmentName VARCHAR(20)
DN_TYPE=$($MYSQL -e "
SELECT DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA='CollegeDB'
AND TABLE_NAME='Department'
AND COLUMN_NAME='DepartmentName';
")

DN_LENGTH=$($MYSQL -e "
SELECT CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA='CollegeDB'
AND TABLE_NAME='Department'
AND COLUMN_NAME='DepartmentName';
")

if [ "$DN_TYPE" = "varchar" ] && [ "$DN_LENGTH" = "20" ]; then
    pass "Test 6 - DepartmentName is VARCHAR(20)"
else
    fail "Test 6 - DepartmentName is not VARCHAR(20)"
fi

# Test Case 7: HOD VARCHAR(20)
HOD_TYPE=$($MYSQL -e "
SELECT DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA='CollegeDB'
AND TABLE_NAME='Department'
AND COLUMN_NAME='HOD';
")

HOD_LENGTH=$($MYSQL -e "
SELECT CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA='CollegeDB'
AND TABLE_NAME='Department'
AND COLUMN_NAME='HOD';
")

if [ "$HOD_TYPE" = "varchar" ] && [ "$HOD_LENGTH" = "20" ]; then
    pass "Test 7 - HOD is VARCHAR(20)"
else
    fail "Test 7 - HOD is not VARCHAR(20)"
fi

echo ""
echo "======================================"
echo " AUTOGRADING SUMMARY"
echo "======================================"
echo "Passed: $PASS"
echo "Failed: $FAIL"
echo "Total : $((PASS+FAIL))"
echo "======================================"

if [ "$FAIL" -eq 0 ]; then
    echo "🎉 ALL TEST CASES PASSED"
    exit 0
else
    echo "⚠️ SOME TEST CASES FAILED"
    exit 1
fi

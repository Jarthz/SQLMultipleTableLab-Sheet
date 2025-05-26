SELECT ItemName, DepartmentName FROM Sale WHERE ItemName = "Compass";
SELECT * FROM Department;

SELECT DISTINCT ItemName, DepartmentFloor
FROM (Sale NATURAL JOIN Department)
WHERE Department.DepartmentFloor = 2;

SELECT * FROM Sale;
SELECT * FROM Department;

SELECT *
FROM (Sale NATURAL JOIN Department)
WHERE ItemName = "Compass";
--WHERE Department.DepartmentFloor = 2;

SELECT *
--FROM (Sale INNER JOIN Department ON Sale.DepartmentName = Department.DepartmentName)
FROM (Sale INNER JOIN Department)
WHERE ItemName = "Compass";

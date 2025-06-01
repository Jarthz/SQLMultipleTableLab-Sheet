SELECT ItemName, DepartmentName FROM Sale WHERE ItemName = 'Compass';
SELECT * FROM Department;

SELECT DISTINCT ItemName, DepartmentFloor
FROM (Sale NATURAL JOIN Department)
WHERE Department.DepartmentFloor = 2;


SELECT *
FROM (Sale NATURAL JOIN Department)
WHERE ItemName = 'Compass';
--WHERE Department.DepartmentFloor = 2;

SELECT *
--FROM (Sale INNER JOIN Department ON Sale.DepartmentName = Department.DepartmentName)
FROM (Sale INNER JOIN Department)
WHERE ItemName = 'Compass';

SELECT DISTINCT ItemName, 
Department.DepartmentFloor AS 'On 
Floor' 
FROM Delivery, Department 
WHERE Delivery.DepartmentName = Department.DepartmentName 
AND 
Department.DepartmentFloor <> 2 
ORDER BY Department.DepartmentFloor, ItemName; 

SELECT DISTINCT Item.ItemName, Department.DepartmentFloor AS 'Floor'
FROM Item, Sale, Department
WHERE Item.ItemName = Sale.ItemName AND Department.DepartmentName = Sale.DepartmentName
AND Department.DepartmentFloor <> 2
ORDER BY Department.DepartmentFloor, Item.ItemName;

SELECT AVG(EmployeeSalary) 
FROM Employee
WHERE DepartmentName = 'Clothes';

SELECT AVG(EmployeeSalary) AS 'Salary', DepartmentName
FROM Employee
GROUP BY DepartmentName
ORDER BY 'Salary' DESC;

-- question 1 Nested
SELECT DISTINCT ItemName 
FROM Sale
WHERE DepartmentName IN 
(SELECT DepartmentName 
FROM Department
WHERE DepartmentFloor = 2);

--q2
SELECT EmployeeName, EmployeeSalary 
FROM Employee
WHERE EmployeeNumber = 
(SELECT BossNumber 
FROM Employee
WHERE EmployeeName = 'Clare');

--q3
SELECT EmployeeName, EmployeeSalary
FROM Employee
WHERE EmployeeNumber IN 
(SELECT BossNumber
FROM Employee
GROUP BY BossNumber HAVING COUNT(*) > 2);

SELECT DISTINCT DepartmentName
FROM Delivery AS Delivery1 
WHERE NOT EXISTS 
(SELECT * 
FROM Delivery AS Delivery2 
WHERE Delivery2.DepartmentName = 
Delivery1.DepartmentName 
AND ItemName NOT IN 
(SELECT ItemName 
FROM Delivery AS Delivery3 
WHERE Delivery3.DepartmentName <> 
Delivery1.DepartmentName)); 
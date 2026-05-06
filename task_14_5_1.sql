--1. ДВА ЗАПРОСА EXISTS
SELECT * FROM Departments d WHERE EXISTS (SELECT * FROM Donations don WHERE don.DepartmentId = d.Id);
SELECT * FROM Doctors d WHERE EXISTS (SELECT * FROM DoctorsExaminations de WHERE de.DoctorId = d.Id);

--2. ЗАПРОСЫ ANY И SOME
SELECT * FROM Doctors WHERE Salary > ANY (SELECT Premium FROM Doctors);
SELECT * FROM Wards WHERE Places > SOME (SELECT Places FROM Wards WHERE Places < 5);

--3. ЗАПРОС ALL
SELECT * FROM Doctors WHERE Salary > ALL (SELECT Premium FROM Doctors);

--4. СОЧЕТАНИЕ ANY/SOME И ALL
SELECT * FROM Doctors WHERE Salary > ANY(SELECT Premium FROM Doctors) AND Salary > ALL(SELECT Salary FROM Doctors WHERE Salary < 45000);

--5. UNION
SELECT Name FROM Departments UNION SELECT Name FROM Sponsors;

--6. UNION ALL
SELECT Name FROM Departments UNION ALL SELECT Name FROM Sponsors;

--7. ПЯТЬ ВИДОВ JOIN
SELECT d.Surname, de.StartTime FROM Doctors d INNER JOIN DoctorsExaminations de ON d.Id = de.DoctorId;

SELECT d.Name AS Dept, w.Name AS Ward FROM Departments d LEFT JOIN Wards w ON d.Id = w.DepartmentId;

SELECT w.Name AS Ward, d.Name AS Dept FROM Wards w RIGHT JOIN Departments d ON w.DepartmentId = d.Id;

SELECT s.Name, don.Amount FROM Sponsors s FULL OUTER JOIN Donations don ON s.Id = don.SponsorId;

SELECT d.Name, w.Name FROM Departments d LEFT JOIN Wards w ON d.Id = w.DepartmentId
UNION
SELECT d.Name, w.Name FROM Departments d RIGHT JOIN Wards w ON d.Id = w.DepartmentId;
-- Academy

SELECT s.FirstName, s.LastName, g.GroupName
FROM dbo.Students s JOIN dbo.Groups g ON s.GroupId = g.Id;

SELECT s.FirstName, s.LastName, a.Assesment
FROM dbo.Students s JOIN dbo.Achievements a ON s.id = a.StudentId;

SELECT sub.SubjectName, a.Assesment
FROM dbo.Subjects sub JOIN dbo.Achievements a ON sub.id = a.SubjectId;

SELECT s.FirstName, g.GroupName, a.Assesment
FROM dbo.Students s
JOIN dbo.Groups g ON s.GroupId = g.Id
JOIN dbo.Achievements a ON s.id = a.StudentId;

SELECT g.GroupName, AVG(CAST(a.Assesment AS FLOAT)) as [Средний балл]
FROM dbo.Groups g
JOIN dbo.Students s ON g.Id = s.GroupId
JOIN dbo.Achievements a ON s.id = a.StudentId
GROUP BY g.GroupName

-- Hospital

SELECT w.Name AS [Палата], dep.Name AS [Отделение]
FROM dbo.Wards w
JOIN dbo.Departments dep ON w.DepartmentId = dep.Id;

SELECT s.Name AS [Спонсор], don.Amount AS [Сумма]
FROM dbo.Sponsors s
JOIN dbo.Donations don ON s.Id = don.SponsorId;

SELECT dep.Name AS [Отделение], don.Amount AS [Сумма пожертвования]
FROM dbo.Departments dep
JOIN dbo.Donations don ON dep.Id = don.DepartmentId;

SELECT d.Surname AS [Фамилия врача], e.Name AS [Обследование]
FROM dbo.Doctors d
JOIN dbo.DoctorsExaminations de ON d.Id = de.DoctorId
JOIN dbo.Examinations e ON de.ExaminationId = e.Id;

SELECT dep.Name, COUNT(w.Id) AS [Количество палат]
FROM dbo.Departments dep
JOIN dbo.Wards w ON dep.Id = w.DepartmentId
GROUP BY dep.Name;

-- Овощи и фрукты

SELECT p.Название, c.Name as [Тип]
FROM [Овощи_и_Фрукты] p JOIN Categories c ON p.CategoryId = c.Id;

SELECT p.Название FROM [Овощи_и_Фрукты] p
JOIN Categories c ON p.CategoryId = c.Id WHERE c.Name = 'Фрукт';

SELECT p.Название FROM [Овощи_и_Фрукты] p
JOIN Categories c ON p.CategoryId = c.Id WHERE c.Name = 'Овощ';

SELECT c.Name, COUNT(p.Название) as [Количество]
FROM Categories c JOIN [Овощи_и_Фрукты] p ON c.Id = p.CategoryId GROUP BY c.Name;

SELECT c.Name, MAX(p.Калорийность) as [Макс Калории]
FROM Categories c JOIN [Овощи_и_Фрукты] p ON c.Id = p.CategoryId GROUP BY c.Name;
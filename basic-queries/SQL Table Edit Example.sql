SELECT *
FROM Students AS S
JOIN Hobbies AS H ON S.StudentID = H.StudentID;

SELECT *
FROM Hobbies;
/*INSERT INTO Students(StudentID, Firstname)
VALUES (409, 'Jonathan')*/

INSERT INTO Hobbies(StudentID, HobbyName)
VALUES(409,'Fencing');

UPDATE dbo.Hobbies
SET HobbyName = 'Jaming'
WHERE HobbyID = 45;
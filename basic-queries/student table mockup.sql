-- Create Students table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Firstname NVARCHAR(100)
);

-- Create Hobbies table (many hobbies per student)
CREATE TABLE Hobbies (
    HobbyID INT PRIMARY KEY,
    StudentID INT,
    HobbyName NVARCHAR(100),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

INSERT INTO Students VALUES (1, 'Goku'), (2, 'Vegeta');
INSERT INTO Hobbies VALUES (1, 1, 'Training'), (2, 1, 'Eating'), (3, 2, 'Meditating');
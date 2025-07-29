CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    AuthorName VARCHAR(100),
    Country VARCHAR(100)
);

CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    AuthorID INT,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);
INSERT INTO Authors (AuthorID, AuthorName, Country) VALUES
(1, 'Fredrik Backman', 'Sweden'),
(2, 'Haruki Murakami', 'Japan'),
(3, 'Chinua Achebe', 'Nigeria');

INSERT INTO Books (BookID, Title, AuthorID) VALUES
(101, 'A Man Called Ove', 1),
(102, 'Kafka on the Shore', 2),
(103, 'Things Fall Apart', 3);

SELECT 
    Books.Title AS BookTitle,
    Authors.AuthorName,
    Authors.Country
FROM 
    Books
INNER JOIN 
    Authors ON Books.AuthorID = Authors.AuthorID;

CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(100)
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);
INSERT INTO Departments (DeptID, DeptName) VALUES
(1, 'Computer Science'),
(2, 'Software Engineering'),
(3, 'Data Analytics'),
(4, 'Career Development'),
(5, 'Industrial Training');

INSERT INTO Courses (CourseID, CourseName, DeptID) VALUES
(1, 'Design and Analysis of Algorithms', 1),
(2, 'Computer Networks', 1),
(3, 'Operating System', 1),
(4, 'Full Stack-I', 2),
(5, 'Project Based Learning in Java', 2),
(6, 'ADBMS', 3),
(7, 'Competitive Coding-I', 3),
(8, 'Soft Skills-III', 4),
(9, 'Aptitude-III', 4),
(10, 'Institute/Industrial Summer Training', 5);

SELECT DeptName
FROM Departments
WHERE DeptID IN (
    SELECT DeptID
    FROM Courses
    GROUP BY DeptID
    HAVING COUNT(*) > 2
);
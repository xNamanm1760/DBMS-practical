CREATE DATABASE CollegeCourseManagement;
USE CollegeCourseManagement;

CREATE TABLE Faculty (
    Faculty_ID INT PRIMARY KEY,
    Faculty_Name VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Department VARCHAR(50) NOT NULL,
    Experience INT DEFAULT 0 CHECK (Experience >= 0)
);

CREATE TABLE Course (
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(100) NOT NULL,
    Credits INT NOT NULL CHECK (Credits BETWEEN 1 AND 6),
    Department VARCHAR(50) NOT NULL,
    Faculty_ID INT,
    Course_Fee DECIMAL(10,2) DEFAULT 50000 CHECK (Course_Fee > 0),
    FOREIGN KEY (Faculty_ID) REFERENCES Faculty(Faculty_ID)
);

INSERT INTO Faculty VALUES
(101, 'Dr. Rajesh Kumar', 'rajesh@college.edu', 'CSE', 10),
(102, 'Dr. Neha Sharma', 'neha@college.edu', 'AI & ML', 8),
(103, 'Dr. Amit Verma', 'amit@college.edu', 'ECE', 7),
(104, 'Dr. Priya Singh', 'priya@college.edu', 'CSE', 5),
(105, 'Dr. Rohit Mehta', 'rohit@college.edu', 'Mathematics', 12);

INSERT INTO Course VALUES
(201, 'Database Management Systems', 4, 'CSE', 101, 55000),
(202, 'Artificial Intelligence', 3, 'AI & ML', 102, 60000),
(203, 'Digital Electronics', 4, 'ECE', 103, 50000),
(204, 'Data Structures', 3, 'CSE', 104, 55000),
(205, 'Engineering Mathematics', 2, 'Mathematics', 105, 45000);

SELECT * FROM Course
WHERE Credits BETWEEN 2 AND 4;

SELECT * FROM Course
WHERE Course_Name LIKE 'D%';

SELECT * FROM Course
WHERE Department IN ('CSE', 'AI & ML');

SELECT DISTINCT Department
FROM Course;

UPDATE Course
SET Faculty_ID = 101
WHERE Course_ID = 204;

DELETE FROM Course
WHERE Course_ID = 205;

ALTER TABLE Course
ADD Max_Students INT DEFAULT 60 CHECK (Max_Students > 0);

SELECT * FROM Course;
-- Table 1: Campers
CREATE TABLE Campers (
    CamperID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    MiddleName VARCHAR(50),
    LastName VARCHAR(50), 
    DateOfBirth DATE,
    Gender CHAR(1),
    Email VARCHAR(100),
    PersonalPhone VARCHAR(15)
);

-- Table 2: Camps
CREATE TABLE Camps (
    CampID INT PRIMARY KEY,
    CampTitle VARCHAR(100),
    StartDate DATE,
    EndDate DATE,
    Price DECIMAL(10,2),
    Capacity INT
);

-- Table 3: Camp_Attendance
CREATE TABLE Camp_Attendance (
    AttendanceID INT PRIMARY KEY,
    CamperID INT,
    CampID INT,
    VisitDate DATE,
    FOREIGN KEY (CamperID) REFERENCES Campers(CamperID),
    FOREIGN KEY (CampID) REFERENCES Camps(CampID)
);



-- Query to Count Lakshmi’s Visits in Last 3 Years--
SELECT COUNT(*) AS VisitsInLast3Years
FROM Camp_Attendance ca
JOIN Campers c ON ca.CamperID = c.CamperID
WHERE c.FirstName = 'Lakshmi'
  AND ca.VisitDate >= CURRENT_DATE - INTERVAL '3 years';


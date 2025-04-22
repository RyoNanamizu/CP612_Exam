-- Table: Department
CREATE TABLE Department (
    deptID INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100)
);

-- Table: Office
CREATE TABLE Office (
    oID INT PRIMARY KEY,
    capacity INT
);

-- Table: Employee
CREATE TABLE Employee (
    empID INT PRIMARY KEY,
    fullName VARCHAR(100) NOT NULL,
    salary DECIMAL(10, 2),
    tasks TEXT,
    deptID INT NOT NULL,
    oID INT NOT NULL,
    FOREIGN KEY (deptID) REFERENCES Department(deptID),
    FOREIGN KEY (oID) REFERENCES Office(oID)
);

-- Relationship: Works_for
-- Implemented as a foreign key in Employee referencing Department
-- Cardinality: Many employees work for one department (N:1)

-- Relationship: Hosted_in
-- Implemented as a foreign key in Employee referencing Office
-- Cardinality: One employee is hosted in one office (1:1)

-- Relationship: Operates_from
-- This is a many-to-many relationship between Department and Office
-- Needs a separate table
CREATE TABLE Operates_from (
    deptID INT,
    oID INT,
    PRIMARY KEY (deptID, oID),
    FOREIGN KEY (deptID) REFERENCES Department(deptID),
    FOREIGN KEY (oID) REFERENCES Office(oID)
);

CREATE DATABASE Pms_DB;

Create TABLE tblDepartment (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL
);

INSERT INTO tblDepartment (DepartmentID, DepartmentName)
VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Production'),
(4, 'Sales'),
(5, 'Quality Control'),
(6, 'Finance'),
(7, 'Logistics'),
(8, 'Research and Development'),
(9, 'Procurement'),
(10, 'Maintenance');

CREATE TABLE tblPosition (
    PositionID INT PRIMARY KEY IDENTITY(1,1),
    DepartmentID INT,
    PositionName VARCHAR(100) NOT NULL,
    FOREIGN KEY (DepartmentID) REFERENCES tblDepartment(DepartmentID)
);

INSERT INTO tblPosition (DepartmentID, PositionName)
VALUES
(1, 'HR Manager'),
(1, 'HR Assistant'),
(1, 'Recruiter'),
(1, 'Payroll Specialist'),
(1, 'Employee Relations Specialist'),
(2, 'IT Manager'),
(2, 'Software Developer'),
(2, 'System Administrator'),
(2, 'Network Engineer'),
(2, 'Database Administrator'),
(3, 'Production Supervisor'),
(3, 'Machine Operator'),
(3, 'Quality Inspector'),
(3, 'Assembly Line Worker'),
(3, 'Production Planner'),
(4, 'Sales Manager'),
(4, 'Sales Executive'),
(4, 'Sales Coordinator'),
(4, 'Account Manager'),
(4, 'Sales Analyst'),
(5, 'Quality Assurance Manager'),
(5, 'Quality Control Inspector'),
(5, 'Quality Analyst'),
(5, 'Compliance Officer'),
(5, 'Quality Engineer'),
(6, 'Finance Manager'),
(6, 'Accountant'),
(6, 'Financial Analyst'),
(6, 'Auditor'),
(6, 'Payroll Specialist'),
(7, 'Logistics Manager'),
(7, 'Warehouse Supervisor'),
(7, 'Inventory Coordinator'),
(7, 'Shipping and Receiving Clerk'),
(7, 'Supply Chain Analyst'),
(8, 'R&D Manager'),
(8, 'Product Developer'),
(8, 'Research Scientist'),
(8, 'Innovation Specialist'),
(8, 'Lab Technician'),
(9, 'Procurement Manager'),
(9, 'Purchasing Agent'),
(9, 'Vendor Relations Specialist'),
(9, 'Supply Chain Manager'),
(9, 'Inventory Control Specialist'),
(10, 'Maintenance Manager'),
(10, 'Maintenance Technician'),
(10, 'Mechanical Engineer'),
(10, 'Electrical Engineer'),
(10, 'Facility Manager');


SELECT * FROM tblDepartment;
SELECT * FROM tblPosition;


SELECT Department.DepartmentName, Position.PositionName AS Position from tblDepartment AS Department
Inner Join tblPosition as Position ON Department.DepartmentID = Position.DepartmentID;


CREATE Procedure UspGetDepartment
AS
BEGIN
SELECT DepartmentID, DepartmentName 
FROM tblDepartment
END;



CREATE PROCEDURE usp_GetSelectedPosition
    @DepartmentID INT = NULL,
    @PositionID INT = NULL
AS
BEGIN
    SELECT 
        d.DepartmentName AS Department,
        p.PositionName AS Position
    FROM 
        tblDepartment d
    LEFT JOIN 
        tblPosition p ON p.DepartmentID = d.DepartmentID
    WHERE 
        (@DepartmentID IS NULL OR d.DepartmentID = @DepartmentID) AND
        (@PositionID IS NULL OR p.PositionID = @PositionID);
END;

CREATE PROCEDURE usp_GetPositionByDepartment
    @DepartmentID INT
AS
BEGIN
    SELECT PositionID, PositionName
    FROM tblPosition
    WHERE DepartmentID = @DepartmentID
END;


EXEC usp_GetPositionByDepartment @DepartmentID = 2;
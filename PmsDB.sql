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



CREATE TABLE tblState (
    StateID INT IDENTITY(1,1) PRIMARY KEY,
    StateName VARCHAR(50)
);

INSERT INTO tblState (StateName) VALUES
('Madhya Pradesh'),
('Maharashtra'),
('Uttar Pradesh'),
('Rajasthan'),
('Gujarat'),
('Karnataka'),
('Tamil Nadu'),
('West Bengal'),
('Bihar'),
('Kerala');

CREATE TABLE tblCity (
    CityID INT IDENTITY(1,1) PRIMARY KEY,
    CityName VARCHAR(50),
    StateID INT
);


INSERT INTO tblCity (CityName, StateID) VALUES
('Bhopal', 1),
('Indore', 1),
('Gwalior', 1),
('Jabalpur', 1),
('Ujjain', 1),
('Mumbai', 2),
('Pune', 2),
('Nagpur', 2),
('Nashik', 2),
('Aurangabad', 2),
('Lucknow', 3),
('Kanpur', 3),
('Agra', 3),
('Varanasi', 3),
('Meerut', 3),
('Jaipur', 4),
('Udaipur', 4),
('Jodhpur', 4),
('Ajmer', 4),
('Kota', 4),
('Ahmedabad', 5),
('Surat', 5),
('Vadodara', 5),
('Rajkot', 5),
('Bhavnagar', 5),
('Bangalore', 6),
('Mysore', 6),
('Mangalore', 6),
('Hubli', 6),
('Belgaum', 6),
('Chennai', 7),
('Coimbatore', 7),
('Madurai', 7),
('Tiruchirappalli', 7),
('Salem', 7),
('Kolkata', 8),
('Asansol', 8),
('Siliguri', 8),
('Durgapur', 8),
('Howrah', 8),
('Patna', 9),
('Gaya', 9),
('Bhagalpur', 9),
('Muzaffarpur', 9),
('Darbhanga', 9),
('Thiruvananthapuram', 10),
('Kochi', 10),
('Kozhikode', 10),
('Thrissur', 10),
('Kollam', 10);


select * from tblState;
select * from tblCity;

Create procedure uspGetState
AS
Begin
Select StateID, StateName from  tblState;
end;


CREATE PROCEDURE uspGetSelectData
    @StateID INT = NULL,
    @CityID INT = NULL
AS
BEGIN
    SELECT 
        s.StateName AS State, 
        c.CityName AS City 
    FROM 
        tblState AS s
    LEFT JOIN 
        tblCity AS c ON s.StateID = c.StateID
    WHERE
        (@StateID IS NULL OR s.StateID = @StateID) AND
        (@CityID IS NULL OR c.CityID = @CityID);
END;


create procedure usp_SetCityByState
@StateID INT
as
begin
select CityID, CityName
from tblCity
where @StateID = StateID
end;

CREATE TABLE tblCompanyIndustry (
    ID INT PRIMARY KEY IDENTITY(1,1),
    IndustryName NVARCHAR(255) NOT NULL
);

INSERT INTO tblCompanyIndustry (IndustryName) VALUES ('Technology');
INSERT INTO tblCompanyIndustry (IndustryName) VALUES ('Healthcare');
INSERT INTO tblCompanyIndustry (IndustryName) VALUES ('Finance');
INSERT INTO tblCompanyIndustry (IndustryName) VALUES ('Education');
INSERT INTO tblCompanyIndustry (IndustryName) VALUES ('Manufacturing');

select * from tblCompanyIndustry


CREATE PROC Usp_GetCompanyIndustries
AS
BEGIN
	SELECT ID, IndustryName
	FROM tblCompanyIndustry;
END;

SELECT * from tblCompanyRegistration;
EXEC sp_rename 'tblCompanyRegistration.ComnayPersonName',  'CompanyPersonName', 'COLUMN';


Alter PROC Usp_insertCompanyRegistration
(
@CompanyName VARCHAR(50)= NULL,
@CompanyRegistrationNumber INT,
@CompanyIndustry VARCHAR(50) = NULL,
@CompanyPersonName VARCHAR(50) = NULL,
@CompanyPersonNumber VARCHAR(50) = NULL,
@CompanyPersonEmail VARCHAR(50) = NULL,
@CompanyStateName VARCHAR(50) = NULL,
@CompanyStateCity VARCHAR(50) = NULL,
@CompanyAddress VARCHAR(50) = NULL
)
AS
BEGIN
INSERT INTO tblCompanyRegistration([CompanyName], [CompanyRegistrationNumber], [CompanyIndustry], [CompanyPersonName], [CompanyPersonNumber], [CompanyPersonEmailID], [CompanyState], [CompanyCity], [CompanyAddress])
Values
(
@CompanyName,
@CompanyRegistrationNumber,
@CompanyIndustry,
@CompanyPersonName,
@CompanyPersonNumber,
@CompanyPersonEmail,
@CompanyStateName,
@CompanyStateCity,
@CompanyAddress
)
END;

select * from  tblCompanyRegistration;

DELETE FROM tblCompanyRegistration
WHERE id BETWEEN  1003 AND 1014; 

CREATE PROC Usp_GetGridData
AS
BEGIN
SELECT [ID], [CompanyName], [CompanyRegistrationNumber], [CompanyIndustry], [CompanyPersonName], [CompanyPersonNumber], [CompanyPersonEmailID], [CompanyState], [CompanyCity], [CompanyAddress] FROM tblCompanyRegistration
END;


CREATE PROC Usp_DeleteCompanyRow
	@ID INT
AS
BEGIN
	DELETE FROM tblCompanyRegistration WHERE ID = @ID
END;


alTER PROCEDURE Usp_UpdateCompanyRow
	@ID INT,
    @CompanyName VARCHAR(50) = NULL,
    @CompanyRegistrationNumber VARCHAR(50) = NULL,
    @CompanyIndustry VARCHAR(50) = NULL,
    @CompanyPersonName VARCHAR(50) = NULL,
    @CompanyPersonNumber VARCHAR(50) = NULL,
    @CompanyPersonEmail VARCHAR(50) = NULL,
    @CompanyStateName VARCHAR(50) = NULL,
    @CompanyStateCity VARCHAR(50) = NULL,
    @CompanyAddress VARCHAR(300) = NULL
AS
BEGIN
    
	UPDATE tblCompanyRegistration
	SET  
		CompanyName = @CompanyName,
        CompanyRegistrationNumber = @CompanyRegistrationNumber,
        CompanyIndustry = @CompanyIndustry,
        CompanyPersonName = @CompanyPersonName,
        CompanyPersonNumber = @CompanyPersonNumber,
        CompanyPersonEmail = @CompanyPersonEmail,
        CompanyStateName = @CompanyStateName,
        CompanyStateCity = @CompanyStateCity,
        CompanyAddress = @CompanyAddress
		WHERE ID = @ID;

END

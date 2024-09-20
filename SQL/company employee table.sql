USE Pms_DB

CREATE TABLE tblCompanyRegistration1 (
    ID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    CompanyName VARCHAR(50) NULL,
    CompanyRegistrationNumber INT UNIQUE NULL,
    CompanyIndustry VARCHAR(50)  NULL,
    CompanyPersonName VARCHAR(50) NULL,
    CompanyPersonNumber VARCHAR(50) NULL,
    CompanyPersonEmailID VARCHAR(50) NULL,
    CompanyState VARCHAR(50) NULL,
    CompanyCity VARCHAR(50) NULL,
    CompanyAddress VARCHAR(300) NULL
);


CREATE TABLE tblEmployeeRegistration1 (
    ID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    CompanyRegistrationNumber INT NULL,
    EmployeelD INT NULL,
    SelectEmployeeShift VARCHAR(50) NULL,
    SelectEmployeeDepartment VARCHAR(50) NULL,
    SelectEmployeePosition VARCHAR(50) NULL,
    DateOfJoining DATE NULL,
    EmployeeFullName VARCHAR(50) NULL,
    EmployeeNumber VARCHAR(50) NULL,
    EmployeeEmail VARCHAR(50) NULL,
    SelectEmployeeGender VARCHAR(50) NULL,
    SelectEmployeeState VARCHAR(50) NULL,
    SelectEmployeeCity VARCHAR(50) NULL,
    EmployeeAddress VARCHAR(50) NULL,
    EmployeeCTC DECIMAL(12,2) NULL,
    CONSTRAINT FK_CompanyRegistrationNumber FOREIGN KEY (CompanyRegistrationNumber) REFERENCES tblCompanyRegistration1(CompanyRegistrationNumber)
);


ALTER TABLE tblEmployeeRegistration1
RENAME COLUMN EmployeelD TO EmployeeID;
EXEC sp_rename 'tblEmployeeRegistration1.EmployeelD',  'EmployeeID', 'COLUMN';
EXEC sp_rename 'tblEmployeeRegistration1.DateOfJoining',  'DateOfJJoining', 'COLUMN';
ALTER TABLE tblEmployeeRegistration1
ALTER COLUMN EmployeeID INT;

Select * from tblEmployeeRegistration1
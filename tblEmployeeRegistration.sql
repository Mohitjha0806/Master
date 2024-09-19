/*
   Wednesday, September 18, 20243:59:47 PM
   User: 
   Server: DESKTOP-MCN1KET
   Database: Pms_DB
   Application: 
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.tblEmployeeRegistration
	(
	ID int NOT NULL IDENTITY (1, 1),
	CompanyRegistrationNumber varchar(50) NULL,
	EmployeeID varchar(50) NULL,
	SelectEmployeeShift varchar(50) NULL,
	SelectEmployeeDepartment varchar(50) NULL,
	SelectEmployeePosition varchar(50) NULL,
	DateOfJJoining date NULL,
	EmployeeFullName varchar(50) NULL,
	EmployeeNumber varchar(50) NULL,
	EmployeeEmail varchar(50) NULL,
	SelectEmployeeGender varchar(50) NULL,
	SelectEmployeeState varchar(50) NULL,
	SelectEmployeeCity varchar(50) NULL,
	EmployeeAddress varchar(300) NULL,
	EmployeeCTC decimal(12, 2) NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.tblEmployeeRegistration ADD CONSTRAINT
	PK_tblEmployeeRegistration PRIMARY KEY CLUSTERED 
	(
	ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.tblEmployeeRegistration SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.tblEmployeeRegistration', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.tblEmployeeRegistration', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.tblEmployeeRegistration', 'Object', 'CONTROL') as Contr_Per 
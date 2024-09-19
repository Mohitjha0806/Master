/*
   Wednesday, September 18, 20243:02:05 PM
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
CREATE TABLE dbo.tbCompanReg
	(
	Id int NOT NULL IDENTITY (1, 1),
	CompanyRegistrationNumber varchar(50) NULL,
	EmployeeID int NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.tbCompanReg ADD CONSTRAINT
	PK_tbCompanReg PRIMARY KEY CLUSTERED 
	(
	Id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
CREATE UNIQUE NONCLUSTERED INDEX IX_tbCompanReg ON dbo.tbCompanReg
	(
	Id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE dbo.tbCompanReg SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.tbCompanReg', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.tbCompanReg', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.tbCompanReg', 'Object', 'CONTROL') as Contr_Per 
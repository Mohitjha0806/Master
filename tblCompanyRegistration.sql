/*
   Wednesday, September 18, 20243:32:27 PM
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
ALTER TABLE dbo.tblCompanyRegistration
	DROP CONSTRAINT UQ__tblCompa__A30DD59FCB90BFC3
GO
ALTER TABLE dbo.tblCompanyRegistration ADD CONSTRAINT
	UK_tblCompanyRegistration UNIQUE NONCLUSTERED 
	(
	ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.tblCompanyRegistration SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.tblCompanyRegistration', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.tblCompanyRegistration', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.tblCompanyRegistration', 'Object', 'CONTROL') as Contr_Per 
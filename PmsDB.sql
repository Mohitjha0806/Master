USE [Pms_DB]
GO
/****** Object:  StoredProcedure [dbo].[Usp_UpdateCompanyRow]    Script Date: 9/13/2024 4:12:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[Usp_UpdateCompanyRow]
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
        CompanyPersonEmailID = @CompanyPersonEmail,
        CompanyState =@CompanyStateName,
        CompanyCity =@CompanyStateCity,
        CompanyAddress =@CompanyAddress
    WHERE ID =@ID;
END



use Pms_DB;

select * from tblCompanyRegistration

Insert Into tblCompanyRegistration([CompanyName], [CompanyRegistrationNumber], [CompanyIndustry], [CompanyPersonName], [CompanyPersonNumber], [CompanyPersonEmailID], [CompanyState], [CompanyCity], [CompanyAddress])
Values

('Google', 1212, 'ASBD', 'Rishi', '8888888888', 'rishi@gmail.com', 'MP', 'Bhopal', 'Bhopal');

ALTER TABLE tblCompanyRegistration
ADD CONSTRAINT UQ_CompanyRegistrationNumber UNIQUE (CompanyRegistrationNumber);

TRUNCATE TABLE tblCompanyRegistration;

Create TABLE tblRishi ()
TRUNCATE TABLE tblRishi;

insert into tblRishi (name, age)
values ('mohit', 24);

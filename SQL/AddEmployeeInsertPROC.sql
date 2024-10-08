USE [Pms_DB]
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertEmployeeRegistration]    Script Date: 9/20/2024 3:57:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[usp_InsertEmployeeRegistration]
(
@CompanyRegistrationNumber INT,
@EmployeeID int ,
@SelectEmployeeShift VARCHAR(50) = NULL,
@SelectEmployeeDepartment VARCHAR(50) = NULL,
@SelectEmployeePosition VARCHAR(50) = NULL,
@DateOfJJoining DATE = NULL,
@EmployeeFullName VARCHAR(50) = NULL,
@EmployeeNumber VARCHAR(50) = NULL,
@EmployeeEmail VARCHAR(50) = NULL,
@SelectEmployeeGender VARCHAR(50) = NULL,
@SelectEmployeeState VARCHAR(50) = NULL,
@SelectEmployeeCity VARCHAR(50) = NULL,
@EmployeeAddress  varchar(300) = NULL,
@EmployeeCTC decimal(12, 2) = NULL
)
AS
BEGIN

DECLARE @msg VARCHAR(50) = NULL
DECLARE @errorMsg VARCHAR(100)

BEGIN TRY

IF EXISTS (SELECT 1 FROM tblEmployeeRegistration1 WHERE CompanyRegistrationNumber = @CompanyRegistrationNumber)

BEGIN
    INSERT INTO tblEmployeeRegistration1([CompanyRegistrationNumber], [EmployeeID], [SelectEmployeeShift], [SelectEmployeeDepartment], 
    [SelectEmployeePosition], [DateOfJJoining], [EmployeeFullName], [EmployeeNumber], [EmployeeEmail], [SelectEmployeeGender], 
    [SelectEmployeeState], [SelectEmployeeCity], [EmployeeAddress], [EmployeeCTC])

VALUES
(
     @CompanyRegistrationNumber,
     @EmployeeID,
     @SelectEmployeeShift,
     @SelectEmployeeDepartment,
     @SelectEmployeePosition,
     @DateOfJJoining,
     @EmployeeFullName,
     @EmployeeNumber,
     @EmployeeEmail,
     @SelectEmployeeGender,
     @SelectEmployeeState,
     @SelectEmployeeCity,
     @EmployeeAddress,
     @EmployeeCTC
)
     SET @msg = 'OK'
	 SET @errorMsg = 'Data Insert Successfully'
END 

ELSE

BEGIN

       SET @msg = 'ERROR'
	   SET @errorMsg = 'Company Registration Is Alredy Exists'

END  

SELECT @msg AS Msg, @errorMsg AS ErrorMsg

END TRY
   BEGIN CATCH
      SET @msg = 'ERROR'
      SET @errorMsg = ERROR_MESSAGE()
   END CATCH
END;

select * from tblEmployeeRegistration1;


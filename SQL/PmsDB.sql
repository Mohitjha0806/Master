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


select * from tblCompanyRegistration1;
select * from tblEmployeeRegistration1;




ALTER PROCEDURE [dbo].[usp_InsertEmployeeRegistration]
(
    @CompanyRegistrationNumber INT,
    @EmployeeID int,
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
    @EmployeeAddress VARCHAR(300) = NULL,
    @EmployeeCTC DECIMAL(12, 2) = NULL
)
AS
BEGIN
    DECLARE @msg VARCHAR(50) = NULL;
    DECLARE @errorMsg VARCHAR(100) = NULL;

    BEGIN TRY
       
        IF EXISTS (SELECT 1 FROM tblCompanyRegistration1 WHERE CompanyRegistrationNumber = @CompanyRegistrationNumber)
        BEGIN
            
            INSERT INTO tblEmployeeRegistration1
            (
                [CompanyRegistrationNumber], 
                [EmployeeID], 
                [SelectEmployeeShift], 
                [SelectEmployeeDepartment], 
                [SelectEmployeePosition], 
                [DateOfJJoining], 
                [EmployeeFullName], 
                [EmployeeNumber], 
                [EmployeeEmail], 
                [SelectEmployeeGender], 
                [SelectEmployeeState], 
                [SelectEmployeeCity], 
                [EmployeeAddress], 
                [EmployeeCTC]
            )
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
            );

           
            SET @msg = 'OK';
            SET @errorMsg = 'Data Inserted Successfully';
        END
        ELSE
        BEGIN
           
            SET @msg = 'ERROR';
            SET @errorMsg = 'Invalid Company Registration Number. Entry not found in parent table.';
        END

       
        SELECT @msg AS Msg, @errorMsg AS ErrorMsg;

    END TRY
    BEGIN CATCH
        
        SET @msg = 'ERROR';
        SET @errorMsg = ERROR_MESSAGE();
        SELECT @msg AS Msg, @errorMsg AS ErrorMsg;
    END CATCH
END;


CREATE Procedure UspGetEmployeeData
AS
BEGIN
SELECT [ID], [CompanyRegistrationNumber], [EmployeeID], [SelectEmployeeShift], [SelectEmployeeDepartment], [SelectEmployeePosition], [DateOfJJoining], [EmployeeFullName], [EmployeeNumber], [EmployeeEmail], [SelectEmployeeGender], [SelectEmployeeState], [SelectEmployeeCity], [EmployeeAddress], [EmployeeCTC] FROM tblEmployeeRegistration1
END;

EXEC UspGetEmployeeData;

alter PROCEDURE usp_GetCompanyRegistrationNumbertblEmployee
    @CompanyRegistrationNumber INT
AS
BEGIN
    SELECT * 
    FROM tblEmployeeRegistration1
    WHERE @CompanyRegistrationNumber = CompanyRegistrationNumber
END

EXEC usp_GetCompanyRegistrationNumbertblEmployee;

select * from tblEmployeeRegistration1;
select * from tblCompanyRegistration1;
SELECT * FROM tblEmployeeRegistration1 WHERE CompanyRegistrationNumber = 1006;





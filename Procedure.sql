CREATE PROCEDURE CW2.AddNewProgramme(
	@Programme_Code as VARCHAR(255),
	@Title as VARCHAR(255),
	@Year as VARCHAR(1),
	@responseMessage NVARCHAR(250) OUTPUT
)
AS
BEGIN 
	BEGIN TRANSACTION
		BEGIN TRY
			DECLARE @Error NVARCHAR(Max);
			DECLARE @NewProgrammeCode VARCHAR(40)
			DECLARE @NewTitle VARCHAR(55)
			DECLARE @NewYear VARCHAR(1)


			SELECT @NewProgrammeCode = ProgrammeCode, @NewTitle = ProgrammeTitle, @NewYear = [Year] from CW2.Programmes
			WHERE ProgrammeCode = @Programme_Code AND ProgrammeTitle = @Title AND [Year] = @Year


			IF @NewProgrammeCode IS NULL AND @NewTitle IS NULL AND @NewYear IS NULL
			BEGIN
				INSERT INTO CW2.Programmes
				VALUES(@Programme_Code, @Title, @Year)
				SET @responseMessage = 'Programme added with the details: ' + @Programme_Code + ', ' + @Title + ', '  + @Year;
			END
			

			ELSE
			BEGIN
				SET @responseMessage = 'Programme exists with the details: ' + @Programme_Code + ', ' + @Title + ', '  + @Year;
			END
			IF @@TRANCOUNT > 0 COMMIT;
		END TRY 
		BEGIN CATCH
			SET @Error = @Error+': An error was encountered: Programme could not be created.'
			IF @@TRANCOUNT > 0
				ROLLBACK TRANSACTION;
			RAISERROR(@Error, 1, 0);
		END CATCH;
END

DROP PROCEDURE IF EXISTS CW1.AddCustomer

DECLARE @message VARCHAR(250);
exec CW2.AddNewProgramme 'Data Analysis', 'DA543', '1', @message OUTPUT;
SELECT @message;

DECLARE @message VARCHAR(250);
exec CW2.AddNewProgramme 'Computer Architecture', 'COMP1001', '1', @message OUTPUT;
SELECT @message;
CREATE PROCEDURE CW1.AddCustomer(
	@Name as VARCHAR(255),
	@Address as VARCHAR(255),
	@Number as VARCHAR(21),
	@responseMessage NVARCHAR(250) OUTPUT
)
AS
BEGIN 
	BEGIN TRANSACTION

		BEGIN TRY
			DECLARE @Error NVARCHAR(Max);
			DECLARE @NewName VARCHAR(40)
			DECLARE @NewAddress VARCHAR(55)
			DECLARE @NewPhoneNumber VARCHAR(15)


			SELECT @NewPhoneNumber = Phonenumber, @NewName = CustomerName, @NewAddress = CustomerAddress from CW1.Customer
			WHERE Phonenumber = @Number AND CustomerName = @Name AND CustomerAddress = @Address


			IF @NewName IS NULL AND @NewAddress IS NULL AND @NewPhoneNumber IS NULL
			BEGIN
				INSERT INTO CW1.Customer
				VALUES(@Name, @Address, @Number)
				SET @responseMessage = 'Customer added with the details: ' + @Name + ', ' + @Address + ', '  + @Number;
			END
			

			ELSE
			BEGIN
				SET @responseMessage = 'Customer exists with the details: ' + @Name + ', ' + @Address + ', ' + @Number;
			END
			IF @@TRANCOUNT > 0 COMMIT;
		END TRY 
		BEGIN CATCH
			SET @Error = @Error+': An error was encountered: Customer could not be created.'
			IF @@TRANCOUNT > 0
				ROLLBACK TRANSACTION;
			RAISERROR(@Error, 1, 0);
		END CATCH;
END

DROP PROCEDURE IF EXISTS CW1.AddCustomer

DECLARE @message VARCHAR(250);
exec CW1.AddCustomer 'Harry Parker', 'Plymouth', '07123 456543', @message OUTPUT;
SELECT @message;

DECLARE @message VARCHAR(250);
exec CW1.AddCustomer 'Harry Park', 'Plymout', '07123 456788', @message OUTPUT;
SELECT @message;
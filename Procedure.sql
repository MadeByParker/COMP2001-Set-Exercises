CREATE PROCEDURE CW1.AddCustomer(
	@Name as VARCHAR(255),
	@Address as VARCHAR(255),
	@Number as VARCHAR(21)
)
AS
BEGIN 
	BEGIN TRANSACTION

		BEGIN TRY
			DECLARE @Error NVARCHAR(Max);
			DECLARE @NewName VARCHAR(40)
			DECLARE @NewAddress VARCHAR(55)
			DECLARE @NewPhoneNumber VARCHAR(15)
			DECLARE @responseMessage NVARCHAR(250)

			SELECT @NewPhoneNumber = Phonenumber from CW1.Customer
			WHERE Phonenumber = @Number

			SELECT @NewName = CustomerName from CW1.Customer
			WHERE CustomerName = @Name

			SELECT @NewAddress = CustomerAddress from CW1.Customer
			WHERE CustomerAddress = @Address

			if exists (SELECT * FROM CW1.Customer WHERE CustomerName = @Name AND CustomerAddress = @Address AND Phonenumber = @Number)
			SET @responseMessage = ' Booking exists with the details: ';
			

		ELSE
			BEGIN
			INSERT INTO CW1.Customer
			VALUES(@Name, @Address, @Number)
		
			END

				
			IF @@TRANCOUNT > 0 COMMIT;
		END TRY 
		BEGIN CATCH
			SET @Error = @Error+': An error was encountered: There cannot be duplicate bookings by the same person'
			IF @@TRANCOUNT > 0
				ROLLBACK TRANSACTION;
			RAISERROR(@Error, 1, 0);
		END CATCH;
END

DROP PROCEDURE IF EXISTS CW1.AddCustomer

exec CW1.AddCustomer 'Harry Parker', 'Plymouth', '07123 456543'

exec CW1.AddCustomer 'Harry Parke', 'Plymout', '07123 456788'
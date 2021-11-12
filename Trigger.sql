CREATE TRIGGER changeAccommAvaliability on CW1.Accommodation
AFTER INSERT
AS
BEGIN
        DECLARE @Error NVARCHAR(Max);
        DECLARE @CustomerID VARCHAR(40);
        DECLARE @BookingID VARCHAR(55);
        DECLARE @RoomID VARCHAR(15);
        DECLARE @NoOfBookings int;
        SELECT @RoomID = INSERTED.[RoomID] from inserted
        Select NoOfBookings INTO [@NoOfBookings] FROM CW1.Accommodation
	BEGIN 

         /*   SELECT  TOP 1 CustomerID INTO [@CustomerID]  FROM CW1.Booking ORDER BY CustomerID DESC;
 
            SELECT  TOP 1 BookingID INTO [@BookingID]  FROM CW1.Booking ORDER BY BookingID DESC;
 
 
		    SELECT  TOP 1 RoomID INTO [@RoomID]  FROM CW1.Booking ORDER BY RoomID DESC;*/

                SELECT * FROM CW1.Accommodation
                WHERE RoomID = @RoomID
                UPDATE CW1.Accommodation   SET NoOfBookings = NoOfBookings + 1
                
                SELECT * FROM CW1.Accommodation
                WHERE RoomID = @RoomID
                IF @NoOfBookings = 10
                BEGIN 
                UPDATE CW1.Accommodation SET Maintenance_needed = 'Maintenance required'
                END
	END
END
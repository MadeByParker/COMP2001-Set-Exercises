CREATE TRIGGER CW1.UpdateRoomStatus on CW1.Booking
AFTER INSERT
AS
BEGIN 
	BEGIN 
                IF (SELECT COUNT(*) FROM CW1.Booking, inserted WHERE CW1.Booking.RoomID = inserted.RoomID) % 10 = 0
                BEGIN 
                        UPDATE CW1.Accommodation 
                        SET CW1.Accommodation.MaintenanceStatus = 'Maintenance required'
                        WHERE CW1.Accommodation.RoomID = (
                                SELECT CW1.Booking.RoomID from CW1.Booking, inserted WHERE CW1.Booking.BookingID = inserted.BookingID
                        )
                END                
	END
END

DROP TRIGGER IF EXISTS CW1.UpdateRoomStatus
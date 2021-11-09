CREATE VIEW CW1.BookingView AS 
SELECT CW1.Customer.CustomerName, CW1.Customer.CustomerAddress, CW1.Customer.PhoneNumber, CW1.Booking.CheckInDate, CW1.Booking.CheckOutDate, CW1.Accommodation.RoomType
FROM CW1.Booking, CW1.Customer,CW1.Accommodation;

SELECT * FROM CW1.BookingView
WHERE CW1.BookingView.CustomerName = 'Harry Parker'

DROP VIEW IF EXISTS CW1.BookingView
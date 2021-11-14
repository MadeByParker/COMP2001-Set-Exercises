SELECT * FROM CW1.BookingView
WHERE CW1.BookingView.CustomerName = 'Harry Parker'

DROP VIEW IF EXISTS CW1.BookingView

CREATE VIEW CW1.BookingView AS 
SELECT DISTINCT CW1.Booking.BookingID, CW1.Customer.CustomerName, CW1.Customer.CustomerAddress, CW1.Customer.Phonenumber, CW1.Booking.RoomType, CW1.Booking.Catering, CW1.Booking.CheckInDate, CW1.Booking.CheckOutDate
FROM ((CW1.Booking
INNER JOIN CW1.Customer ON CW1.Booking.CustomerID = CW1.Customer.CustomerID)
INNER JOIN CW1.Accommodation ON CW1.Booking.RoomID = CW1.Accommodation.RoomID);
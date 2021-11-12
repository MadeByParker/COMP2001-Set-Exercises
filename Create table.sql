CREATE TABLE CW1.Customer
(	
	CustomerID INT IDENTITY(1,1) not null, 
	CustomerName varchar(40) not null,
	CustomerAddress varchar(55) not null,
	Phonenumber varchar(15) not null /*and constraints like no letters*/, 
	CONSTRAINT pk_CustomerID  PRIMARY KEY (CustomerID), 
)

CREATE TABLE CW1.Accommodation
(	
	RoomID int  IDENTITY(1,1) not null, 
	RoomType varchar(20) not null,
	AmountOfGuests int not null,
	Maintenance_needed varchar(20) not null /*every 10 visits must trigger to yes*/,
	NoOfBookings int not null,
	CONSTRAINT pk_Rooms PRIMARY KEY (RoomID),
)

CREATE TABLE CW1.Booking
(	
	BookingID INT IDENTITY(1,1) not null,
	CustomerID INT not null,
	CustomerName varchar(40) not null,
	RoomID INT not null, 
	RoomType varchar(20) not null,
	AmountOfGuests INT not null,
    CheckInDate Date not null,
    CheckOutDate Date not null /*must not be before check in date*/,
	CONSTRAINT pk_Booking PRIMARY KEY (BookingID),
	CONSTRAINT fk_Room FOREIGN KEY (RoomID) 
	REFERENCES CW1.Accommodation(RoomID), 
	CONSTRAINT Fk_Customer FOREIGN KEY (CustomerID)
	REFERENCES CW1.Customer(CustomerID),

)



INSERT INTO CW1.Customer (CustomerName, CustomerAddress, Phonenumber)
VALUES('Harry Parker', 'Plymouth', '07455 123456') 


INSERT INTO CW1.Accommodation(RoomType, AmountOfGuests, NoOfBookings, Maintenance_needed)
VALUES('Sheperds Hut', '8', '0', 'Room Avaliable')



INSERT INTO CW1.Booking(CustomerID, CustomerName, RoomID, RoomType, AmountOfGuests, CheckInDate, CheckOutDate)
VALUES ('2', 'Harry Parker', '2', 'Bedroom', '2', '2021-06-26', '2021-07-02')

SELECT * from CW1.Accommodation
DELETE FROM CW1.Booking
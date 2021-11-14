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
	RoomID int IDENTITY(1,1) not null, 
	RoomType varchar(20) not null,
	AmountOfGuestsLimit int not null,
	MaintenanceStatus varchar(20) not null /*every 10 visits must trigger to yes*/,
	Catering VARCHAR(45) NOT NULL,
	CONSTRAINT pk_Rooms PRIMARY KEY (RoomID),
)

CREATE TABLE CW1.Booking
(	
	BookingID INT IDENTITY(1,1) not null,
	CustomerID INT NOT NULL,
	CustomerName varchar(40) not null,
	RoomID INT NOT NULL, 
	RoomType varchar(20) not null,
	AmountOfGuests INT not null,
    CheckInDate Date not null,
    CheckOutDate Date not null /*must not be before check in date*/,
	Catering VARCHAR(45) not NULL
	CONSTRAINT pk_Booking PRIMARY KEY (BookingID),
	CONSTRAINT fk_Room FOREIGN KEY (RoomID) 
	REFERENCES CW1.Accommodation(RoomID), 
	CONSTRAINT Fk_Customer FOREIGN KEY (CustomerID)
	REFERENCES CW1.Customer(CustomerID),
)



INSERT INTO CW1.Customer (CustomerName, CustomerAddress, Phonenumber)
VALUES('Harry Parker', 'Plymouth', '07455 123456') 


INSERT INTO CW1.Accommodation(RoomType, AmountOfGuestsLImit, MaintenanceStatus, Catering)
VALUES('Sheperds Hut', '8', 'Room Avaliable', 'Self Catered or Catered')


INSERT INTO CW1.Booking(CustomerID, CustomerName, RoomID, RoomType, AmountOfGuests, Catering, CheckInDate, CheckOutDate)
VALUES ('1', 'Harry Parker', '1', 'Sheperds Hut', '4', 'Self-Catered', '2021-06-26', '2021-07-02')

SELECT * from CW1.Accommodation
DELETE FROM CW1.Booking

SELECT * FROM CW1.Accommodation

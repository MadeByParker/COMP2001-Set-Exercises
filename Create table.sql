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
	RoomNO int IDENTITY(1,1) not null, 
	RoomType varchar(20) not null,
	AmountOfGuests int not null,
	Maintenance_needed varchar(20) not null /*every 10 visits must trigger to yes*/,
	CONSTRAINT pk_Rooms PRIMARY KEY (RoomNO),
)

CREATE TABLE CW1.CheckIns
(	
	CustomerNo INT IDENTITY(1,1) not null,
	Name varchar(40) not null,
	RoomID int IDENTITY(1,1) not null, 
	RoomType varchar(20) not null,
	AmountOfGuests INT not null,
    CheckInDate Date not null,
    CheckOutDate Date not null /*must not be before check in date*/,
	CONSTRAINT pk_CheckRooms PRIMARY KEY (RoomID), 
)

CREATE TABLE CW1.Maintenance
(
    RoomID int IDENTITY(1,1) not null, 
    CheckInDate Date not null,
    CheckOutDate Date not null /*must not be before check in date*/,
    Maintenance_needed BIT not null /*every 10 visits must trigger to yes*/,
    CONSTRAINT pk_RoomsCleanup PRIMARY KEY (RoomID), 
)


ALTER TABLE CW1.CheckIns
	ADD CONSTRAINT fk_customer FOREIGN KEY (CustomerNo) REFERENCES CW1.Customer(CustomerID)

ALTER TABLE CW1.CheckIns
	ADD CONSTRAINT fk_room FOREIGN KEY (RoomID) REFERENCES CW1.Accommodation(RoomNO)

ALTER TABLE CW1.Maintenance
	ADD CONSTRAINT fk_roomCleanup FOREIGN KEY (RoomID) REFERENCES CW1.Accommodation(RoomNO)

INSERT INTO CW1.Customer (CustomerName, CustomerAddress, Phonenumber)
VALUES('Peter Parker', 'New York', '+44 7657 123456') 

INSERT INTO CW1.Accommodation(RoomType, AmountOfGuests, Maintenance_needed)
VALUES('Bedroom', '2', 'Room Avaliable')

CREATE VIEW CW1.Customer_Booking AS 
SELECT CW1.Customer.CustomerName, CW1.Customer.CustomerAddress, CW1.Customer.PhoneNumber, CW1.CheckIns.CheckInDate, CW1.CheckIns.CheckOutDate, CW1.Accommodation.RoomNO, CW1.Accommodation.RoomType
FROM ((CW1.CheckIns
INNER JOIN CW1.Customer ON CW1.CheckIns.CustomerNo = CW1.Customer.CustomerID)
INNER JOIN CW1.Accommodation ON CheckIns.RoomID = Accommodation.RoomNO);

SELECT * FROM CW1.Customer_Booking;

INSERT INTO CW1.CheckIns (Name, RoomType, AmountOfGuests, CheckInDate, CheckOutDate)
VALUES('Peter Parker', 'Bedroom', '2', '2021-11-01', '2021-10-12');

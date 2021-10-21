CREATE TABLE CW1.Customer
(	
	CustomerID INT not null, 
	CustomerName varchar(40) not null,
	CustomerAddress varchar(55) not null,
	Phonenumber varchar(15) not null /*and constraints like no letters*/, 
	CONSTRAINT pk_CustomerID  PRIMARY KEY (CustomerID), 
)



CREATE TABLE CW1.Accommodation
(	
	RoomNO varchar(3) not null, 
	RoomType varchar(20) not null,
	AmountOfGuests int not null,
	Maintenance_needed BIT not null /*every 10 visits must trigger to yes*/,
	CONSTRAINT pk_Rooms PRIMARY KEY (RoomNO),
)

CREATE TABLE CW1.CheckIns
(	
	CustomerNo INT not null,
	Name varchar(40) not null,
	RoomID varchar(3) not null, 
	RoomType varchar(20) not null,
	AmountOfGuests INT not null,
    CheckInDate Date not null,
    CheckOutDate Date not null /*must not be before check in date*/,
	CONSTRAINT pk_CheckRooms PRIMARY KEY (RoomID), 
)

ALTER TABLE CheckIns
	ADD CONSTRAINT fk_customer FOREIGN KEY (CustomerNo) REFERENCES CW1.Customer(CustomerID)

ALTER TABLE CheckIns
	ADD CONSTRAINT fk_room FOREIGN KEY (RoomID) REFERENCES CW1.Accommodation(RoomNO)


CREATE TABLE CW1.Maintenance
(
    Room varchar(3) not null, 
    CheckInDate Date not null,
    CheckOutDate Date not null /*must not be before check in date*/,
    Maintenance_needed BIT not null /*every 10 visits must trigger to yes*/,
    CONSTRAINT pk_RoomsCleanup PRIMARY KEY (Room), 
)

ALTER TABLE Maintenance
	ADD CONSTRAINT fk_roomCleanup FOREIGN KEY (Room) REFERENCES CW1.Accommodation(RoomNO)


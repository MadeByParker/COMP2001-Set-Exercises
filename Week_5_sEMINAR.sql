CREATE SCHEMA RB

CREATE TABLE RB.Person
(
    PersonID int IDENTITY(1,1) not null,
    Person_Name VARCHAR(255) not null,
    DOB DATE,
    CONSTRAINT pk_people PRIMARY KEY(
        PersonID
    )
)

INSERT INTO RB.Person(Person_Name, DOB) 
VALUES('Harry', '2001-07-24'),
('Harry', '2001-07-24')

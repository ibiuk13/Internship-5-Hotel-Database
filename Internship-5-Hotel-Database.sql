create database HotelChain

use HotelChain

create table Hotels(
Id int IDENTITY(1,1) PRIMARY KEY,
HotelName nvarchar(100) NOT NULL
)

create table Rooms(
Id int IDENTITY(1,1) PRIMARY KEY,
RoomNumber int NOT NULL,
RoomCapacity int NOT NULL,
RoomCategory nvarchar(100) NOT NULL,
RoomPrice int NOT NULL CHECK (RoomPrice > 0),
HotelId int FOREIGN KEY REFERENCES Hotels(Id) NOT NULL
)

create table Stays(
Id int IDENTITY(1,1) PRIMARY KEY,
Purchaser nvarchar(200) NOT NULL,
TypeOfStay nvarchar(100),
PriceOfStay int NOT NULL,
TimeOfPurchase datetime2 NOT NULL,
StartOfStay datetime2 NOT NULL,
EndOfStay datetime2 NOT NULL,
RoomId int FOREIGN KEY REFERENCES Rooms(Id) NOT NULL,
HotelId int FOREIGN KEY REFERENCES Hotels(Id) NOT NULL
)

create table Visitors(
Id int IDENTITY(1,1) PRIMARY KEY,
FirstName nvarchar(100) NOT NULL,
LastName nvarchar(100) NOT NULL,
OIB nvarchar(20) NOT NULL,
StayId int FOREIGN KEY REFERENCES Stays(Id) NOT NULL
)

create table Employees(
Id int IDENTITY(1,1) PRIMARY KEY,
FirstName nvarchar(100) NOT NULL,
LastName nvarchar(100) NOT NULL,
OIB nvarchar(20) NOT NULL,
Position nvarchar(100) NOT NULL,
HotelId int FOREIGN KEY REFERENCES Hotels(Id) NOT NULL,
)

insert into Hotels(HotelName) VALUES
('Lav'),
('Atrium'),
('Radisson Blu'),
('Park'),
('Amphora')

insert into Employees(FirstName, LastName, OIB, Position, HotelId) VALUES
('Ante', 'Antiæ','1234567','recepcionist',1),
('Marija', 'Mariæ', '865432','èistaèica',2),
('Ivo','Iviæ','356433','sobna posluga',3),
('Ivana','Ivanèiæ','6353827','sobna posluga',4),
('Marko', 'Markiæ','1235677','recepcionist',5),
('Bruna', 'Bruniæ', '8123463','èistaèica',5)

insert into Rooms(RoomNumber, RoomCapacity, RoomCategory, RoomPrice, HotelId) VALUES
(101, 2, 'double',800,1),
(102, 2, 'double',800,1),
(201, 4, 'quad',1300,1),
(101, 2, 'double',800,2),
(201, 3, 'king',1600,2),
(202, 3, 'king',1600,2),
(355, 2, 'double',900,3),
(765, 4, 'suite',2000,4),
(445, 3, 'triple',1000,5)

insert into Stays(Purchaser,TypeOfStay,PriceOfStay,TimeOfPurchase,StartOfStay,EndOfStay,RoomId, HotelId) VALUES
('Stipe Stipiæ','pansion',2000,'2020-12-04 9:00','2020-12-10 10:00','2020-12-12 16:00',1,1),
('Ana Aniæ','polupansion',3000,'2020-10-01 8:00','2020-12-2 10:00','2020-12-5 16:00',2,1),
('Karlo Karliæ',NULL,13000,'2020-12-10 12:00','2020-12-20 10:00','2020-12-30 16:00',3,1),
('Mirko Mirkiæ','pansion',5000,'2019-11-01 9:00','2019-12-01 10:00','2019-12-03 16:00',4,2),
('Petra Petriæ','polupansion',900,'2020-08-04 9:00','2020-10-10 10:00','2020-12-10 16:00',1,1)

insert into Visitors(FirstName,LastName,OIB,StayId)VALUES
('Stipe','Stipiæ',123456789,1),
('Barbara','Barbariæ',9876543,2),
('Karla','Karliæ',156424,2),
('Marko','Mirkiæ',23413289,3),
('Filip','Petriæ',1324352,5)

SELECT * FROM Rooms WHERE HotelId = 1

SELECT * FROM Rooms WHERE RoomNumber BETWEEN 100 AND 199

SELECT FirstName,LastName FROM Employees WHERE (Position = 'èistaèica' AND HotelId = 2)

SELECT * FROM Stays WHERE (TimeOfPurchase > '2020-12-01 00:00' AND PriceOfStay > 1000)

SELECT * FROM Stays WHERE (EndOfStay > GETDATE())

DELETE FROM Stays WHERE (EndOfStay < '2020-01-01 00:00' )

UPDATE Rooms SET RoomCapacity = 4 WHERE (HotelId = 2 AND RoomCapacity = 3)

SELECT * FROM Stays WHERE (RoomId = 1) ORDER BY StartOfStay

SELECT * FROM Stays WHERE (HotelId = 1 AND (TypeOfStay = 'pansion' OR TypeOfStay = 'polupansion'))

UPDATE Employees SET Position = 'recepcionist' WHERE (Id = 3 OR Id = 4)







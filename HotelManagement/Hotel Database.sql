--Jefferson Zhumi
--CIS 205
--Hotel database
--copy and paste table by table to MYSQL

CREATE DATABASE htl;
USE htl;

--------------------------------------------
-- Creates and populates the Hotel table
--------------------------------------------
CREATE TABLE Hotel
(
hotelCode	CHAR(8),
name		VARCHAR(20),
hStreet		VARCHAR(20),
hCity		VARCHAR(20),
hState		CHAR(2),
hZip		CHAR(5),
areaCode	CHAR(3),
hPhone		CHAR(8),
rating		VARCHAR(15),

CONSTRAINT Hotel_PK PRIMARY KEY(hotelCode)
);

INSERT INTO Hotel values('htl12345', 'Holiday Inn', '6600 Coastal Hwy',	'Ocean City', 'MD', '21842', '410', '524-1700', '3 Star');

INSERT INTO Hotel values('htl54321', 'Hotel Indigo', '509 9th Avenue', 'San Diego', 'CA', '92101', '619', '737-4000', '4 Star');

INSERT INTO Hotel values('htl67890', 'Kimpton Hotel', '10740 Whilshire Blvd', 'Los Angeles', 'CA', '90024', '310', '475-8712', '5 Star');

----------------------------------------------
-- Creates and populates the Guest table
----------------------------------------------
CREATE TABLE Guest
(
fname			VARCHAR(20),
lname			VARCHAR(20),
gStreet			VARCHAR(20),
gCity			VARCHAR(20),
gState			CHAR(2),
gZip			CHAR(5),
gPhone			CHAR(12), 
email			VARCHAR(30),
cardNum			CHAR(16),
checkIn			DATE,
checkOut		DATE,
nights			INT,

CONSTRAINT Guest_PK PRIMARY KEY(email)
);

INSERT INTO Guest values('Elizabeth', 'Banks', '325 N. Bender St.', 'Los Angeles', 'CA', '90058', '310-923-2913',
'e.banks@gmail.com', '1234432156788760', '2016-04-24', '2016-04-28', '4');

INSERT INTO Guest values('Bethany', 'Nolan', '5432 Delsea Dr.', 'Vineland', 'NJ', '08362', '609-725-1010',
'bethnolan@yahoo.com', '8760567843211234', '2016-05-04', '2016-05-10', '5');

INSERT INTO Guest values('Kathleen', 'Spencer', '642 Sycamore St.', 'Miami', 'FL', '33127', '305-890-4534',
'heykat@gmail.com', '1356653157900975', '2016-07-14', '2016-07-16', '2');

INSERT INTO Guest values('Jason', 'Bates', '317 Welsh Rd.', 'Philadelphia', 'PA', '19115', '215-234-2670',
'jaybates@hotmail.com', '8374981212846950', '2016-08-09', '2016-08-16', '7');

INSERT INTO Guest values('Manny', 'Garcia', '645 Etkins Ln.', 'Ambler', 'PA', '19002', '484-676-4003',
'mannyg@gmail.com', '0094678298763415', '2016-07-03', '2016-07-05', '2');

INSERT INTO Guest values('Nicole', 'Rossi', '9800 Foley Ave.', 'St. Petersburg', 'FL', '33714', '305-265-7895',
'nrossi@hotmail.com', '7801092827839982', '2016-12-23', '2016-12-30', '7');

----------------------------------------------
-- Creates and populates the Room table
----------------------------------------------
CREATE TABLE Room
(
rType			VARCHAR(30),
isAvail			CHAR(1),
price			DOUBLE,
hotelCode		CHAR(8), 

CONSTRAINT Room_PK PRIMARY KEY(rtype, hotelCode),
CONSTRAINT Room_FK1 FOREIGN KEY(hotelCode)
REFERENCES Hotel(hotelCode)
);

INSERT INTO Room values('Family Suite', 'Y', 159.00, 'htl12345');

INSERT INTO Room values('Standard Single', 'N', 110.00, 'htl12345');

INSERT INTO Room values('Standard Double', 'Y', 129.00, 'htl12345');

INSERT INTO Room values('Standard Triple', 'N', 139.00, 'htl12345');

INSERT INTO Room values('Superior Suite', 'Y', 209.00, 'htl54321');

INSERT INTO Room values('King Bed Executive View', 'Y', 229.00, 'htl54321');

INSERT INTO Room values('Standard Room', 'N', 179.00, 'htl54321');

INSERT INTO Room values('Two Queen Beds', 'Y', 179.00, 'htl54321');

INSERT INTO Room values('Skyline Two Queen Beds', 'y', 269.00, 'htl67890');

INSERT INTO Room values('Grand Skyline Room', 'y', 349.00, 'htl67890');

INSERT INTO Room values('Arena suite', 'y', 590.00, 'htl67890');

----------------------------------------------
--ROOMMIRROR test
----------------------------------------------
CREATE TABLE RoomMirror
(
rType			VARCHAR(30),
isAvail			CHAR(1),
price			DOUBLE,
hotelCode		CHAR(8), 

CONSTRAINT RoomMirror_PK PRIMARY KEY(rtype, hotelCode),
CONSTRAINT RoomMirror_FK1 FOREIGN KEY(hotelCode)
REFERENCES Hotel(hotelCode)
);

INSERT INTO RoomMirror values('Family Suite', 'Y', 159.00, 'htl12345');

INSERT INTO RoomMirror values('Standard Single', 'N', 110.00, 'htl12345');

INSERT INTO RoomMirror values('Standard Double', 'Y', 129.00, 'htl12345');

INSERT INTO RoomMirror values('Standard Triple', 'N', 139.00, 'htl12345');

INSERT INTO RoomMirror values('Superior Suite', 'Y', 209.00, 'htl54321');

INSERT INTO RoomMirror values('King Bed Executive View', 'Y', 229.00, 'htl54321');

INSERT INTO RoomMirror values('Standard Room', 'N', 179.00, 'htl54321');

INSERT INTO RoomMirror values('Two Queen Beds', 'Y', 179.00, 'htl54321');

INSERT INTO RoomMirror values('First class suite', 'N', 269.00, 'htl67890');

INSERT INTO RoomMirror values('Second class suite', 'N', 349.00, 'htl67890');

INSERT INTO RoomMirror values('Third class suite', 'N', 590.00, 'htl67890');

----------------------------------------------
-- Creates and populates the Amenitites table
-----------------------------------------------
CREATE TABLE Amenities
(
amnCode			CHAR(3),
amnDesc			VARCHAR(30),

CONSTRAINT Amenities_PK PRIMARY KEY(amnCode)
);

INSERT INTO Amenities values('101', 'Indoor Pool');

INSERT INTO Amenities values('102', 'Outdoor Pool');

INSERT INTO Amenities values('103', 'Free Wifi');

INSERT INTO Amenities values('104', 'Free Breakfast');

INSERT INTO Amenities values('105', 'Pets Allowed');

INSERT INTO Amenities values('106', 'Fitness Center');

INSERT INTO Amenities values('107', 'Picnic Area');

INSERT INTO Amenities values('108', 'Roof Top Lounge');

INSERT INTO Amenities values('109', 'Full Service Spa');

INSERT INTO Amenities values('110', 'Restaurant');

---------------------------------------------
-- Creates and populates the Offers table
---------------------------------------------
CREATE TABLE Offers
(
hotelCode		CHAR(8),
amnCode			CHAR(3),

CONSTRAINT Offers_PK PRIMARY KEY(hotelCode, amnCode),
CONSTRAINT Offers_FK1 FOREIGN KEY(hotelCode)
REFERENCES Hotel(hotelCode),
CONSTRAINT Offers_FK2 FOREIGN KEY(amncode)
REFERENCES Amenities(amnCode)
);

INSERT INTO Offers values('htl12345', '101');

INSERT INTO Offers values('htl12345', '104');

INSERT INTO Offers values('htl12345', '106');

INSERT INTO Offers values('htl12345', '107');

INSERT INTO Offers values('htl54321', '101');

INSERT INTO Offers values('htl54321', '102');

INSERT INTO Offers values('htl54321', '103');

INSERT INTO Offers values('htl54321', '105');

INSERT INTO Offers values('htl54321', '106');

INSERT INTO Offers values('htl67890', '101');

INSERT INTO Offers values('htl67890', '102');

INSERT INTO Offers values('htl67890', '103');

INSERT INTO Offers values('htl67890', '105');

INSERT INTO Offers values('htl67890', '106');

INSERT INTO Offers values('htl67890', '108');

INSERT INTO Offers values('htl67890', '109');

INSERT INTO Offers values('htl67890', '110');

---------------------------------------------
-- Creates and populates the Books TABLE
---------------------------------------------
CREATE TABLE Books
(
rType			VARCHAR(30),
hotelCode		CHAR(8),
email			VARCHAR(30),

CONSTRAINT Books_PK PRIMARY KEY(rType, hotelCode, email),
CONSTRAINT Books_FK1 FOREIGN KEY(rType)
REFERENCES Room(rType),
CONSTRAINT Books_FK2 FOREIGN KEY(hotelCode)
REFERENCES Hotel(hotelCode),
CONSTRAINT Books_FK3 FOREIGN KEY(email)
REFERENCES Guest(email)
);

INSERT INTO Books values('Standard Single', 'htl12345', 'bethnolan@yahoo.com');

INSERT INTO Books values('Grand Skyline Room', 'htl67890', 'heykat@gmail.com');

INSERT INTO Books values('King Bed Executive View', 'htl54321', 'jaybates@hotmail.com');

INSERT INTO Books values('Standard Double', 'htl12345', 'mannyg@gmail.com');

INSERT INTO Books values('Grand Skyline Room', 'htl67890', 'nrossi@hotmail.com');

INSERT INTO Books values('Arena suite', 'htl67890', 'e.banks@gmail.com');



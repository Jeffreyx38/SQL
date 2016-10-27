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

--Individual queries
--Jefferson Zhumi

1.
SELECT * FROM room
UNION 
SELECT * FROM roomMirror; 

2.
SELECT room.rType
FROM room INNER JOIN roomMirror
USING (rType);

3.
SELECT DISTINCT rType
FROM roomMirror
WHERE (rType) NOT IN
(SELECT rType FROM room);

SELECT DISTINCT hotelcode
FROM roomMirror
WHERE (hotelcode) NOT IN
(SELECT hotelcode FROM room);

4.
SELECT hotelCode, count(hotelCode)
FROM room
GROUP BY hotelCode
HAVING count(hotelCode) > 2;

5.
ALTER TABLE room ADD nBathroom double;
ALTER TABLE roomMirror ADD nBathroom double;

ALTER TABLE room ADD phone varchar(40);
ALTER TABLE roomMirror ADD phone varchar(40);

6.
UPDATE roomMirror
SET nBathroom="2",phone="123456789"
WHERE hotelCode = "htl12345";

UPDATE roomMirror
SET nBathroom="3",phone="987654321"
WHERE hotelCode = "htl67890";
7.

ALTER TABLE roomMirror
DROP COLUMN nBathroom, DROP COLUMN phone;

8.
INSERT INTO RoomMirror values('Single person room', 'Y', 579.00, 'htl54321');

INSERT INTO RoomMirror values('One night person', 'N', 269.00, 'htl12345');

INSERT INTO RoomMirror values('Family of four', 'Y', 249.00, 'htl67890');

INSERT INTO RoomMirror values('Test room', 'Y', 390.00, 'htl54321');
/* UC1 */
create database AddressBookService;
use AddressBookService;

/* UC2 */
create table AddressBook
(
firstName Varchar(255),
lastName varchar(255),
address varchar(255),
city char(255),
state char(255),
zip INT,
phoneNumber BIGINT,
email NVARCHAR(255)
);
SELECT * FROM AddressBook;

/* UC3 */
INSERT INTO AddressBook VALUES('Chandru','K', 'Garden', 'Gadag','Karnataka',452159,1234567815,'chandru15199@gmail.com');
INSERT INTO AddressBook VALUES('Ram','M', 'Hostel', 'Gadag','Karnataka',741123,5284963175,'ram@gmail.com');
INSERT INTO AddressBook VALUES('Joy','V', 'Complex', 'Delhi','Delhi',528417,2145796325,'joy@gmail.com');
INSERT INTO AddressBook VALUES('Rita','B', 'Niwas', 'Mysore','Karnatka',369258,4251789625,'rita@gmail.com');

SELECT * FROM AddressBook;

/* UC4 */
--Update AddressBook SET address = 'Matoshri Niwas' WHERE firstName = 'Vidhya';
--SELECT * FROM AddressBook;
Alter table AddressBook Drop column phoneNumber;
Alter table AddressBook Add phoneNumber BIGINT;

Drop table AddressBook;

/* UC2 */
create table AddressBook
(
firstName Varchar(255),
lastName varchar(255),
address varchar(255),
city char(255),
state char(255),
zip INT,
phoneNumber BIGINT,
email NVARCHAR(255)
)
SELECT * FROM AddressBook;

/* UC 3 */
INSERT INTO AddressBook VALUES('Chandru','K', 'Garden', 'Gadag','Karnataka',452159,1234567815,'chandru15199@gmail.com');
INSERT INTO AddressBook VALUES('Ram','M', 'Hostel', 'Gadag','Karnataka',741123,5284963175,'ram@gmail.com');
INSERT INTO AddressBook VALUES('Joy','V', 'Complex', 'Delhi','Delhi',528417,2145796325,'joy@gmail.com');
INSERT INTO AddressBook VALUES('Rita','B', 'Niwas', 'Mysore','Karnatka',369258,4251789625,'rita@gmail.com');

SELECT * FROM AddressBook;


/* UC4 */
Update AddressBook SET address = 'Matoshri Niwas' WHERE firstName = 'Vidhya';
SELECT * FROM AddressBook;

Update AddressBook SET firstName = 'Chandru' where email = 'chandru151998@gmail.com';
Update AddressBook SET address = 'NIWAS' where email = 'chandru151998@gmail.com';
Update AddressBook SET city = 'Benguluru' where email = 'chandru151998@gmail.com';
Update AddressBook SET state = 'Karnatka' where email = 'chandru151998@gmail.com';
SELECT * FROM AddressBook;

/* UC5 */
INSERT INTO AddressBook VALUES('Ram','J', 'Gada', 'Hubli','Karnataka',582103,7406140157,'ram1234@gmail.com');
DELETE FROM AddressBook WHERE firstName = 'Ankita';
SELECT * FROM AddressBook;

/* UC6 */
SELECT firstName, lastName, address, state, zip, phoneNumber, email from AddressBook where city = 'benguluru';
SELECT firstName, lastName, address, city, zip, phoneNumber, email from AddressBook where state = 'Tamil Nadu';

/* UC7 */
SELECT city, count(city) from AddressBook Group BY city;
SELECT state, count(state) from AddressBook Group BY state;

/* UC8 */
SELECT firstName, lastName, address, city, state, zip, phoneNumber, email from AddressBook where city = 'Gadag' ORDER BY firstName;

/* UC9 */
alter table AddressBook Add Type VARCHAR(255);
SELECT * from AddressBook;

Update AddressBook SET Type = 'Professional' WHERE firstName = 'Chandru';
Update AddressBook SET Type = 'Family' WHERE firstName = 'Vetri';
Update AddressBook SET Type = 'Friend' WHERE firstName = 'Srikant';
Update AddressBook SET Type = 'Friend' WHERE firstName = 'Ajay';

/* UC10 */
SELECT Type, COUNT(Type) FROM AddressBook Group BY Type;  

/* UC11 */
INSERT INTO AddressBook VALUES('Teja','Kalahalamath', 'Gadag', 'Hubli','Karnataka',582103,7406140157,'chandru151998@gmail.com', 'Friend');
INSERT INTO AddressBook VALUES('Vetri','Velan', 'Niwas', 'Hosur','Karnataka',582148,9586421578,'vetri18@gmail.com', 'Friend');
INSERT INTO AddressBook VALUES('Srikant','K', 'Niwas', 'Vijaywada','Andhra',524896,9895634278,'srikant1598@gmail.com', 'Family');
SELECT * FROM AddressBook;

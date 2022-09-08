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
INSERT INTO AddressBook VALUES('Vaishnavi','Kalahalamath', 'Aashirvad Niwas', 'Gadag','Karnataka',431205,1234567815,'vaishnavikalahalamath@gmail.com');
INSERT INTO AddressBook VALUES('Gourav','Mundhe', 'Aashirvad Niwas', 'Gadag','Karnataka',512436,7894561235,'gouravmundhe@gmail.com');
INSERT INTO AddressBook VALUES('Vishal','Kalahalamath', 'Sarswati complex', 'vadodra','Gujrat',857691,4561237895,'vishalkalahalamath@gmail.com');
INSERT INTO AddressBook VALUES('Vidhya','Kalahalamath', 'Aashirvad Niwas', 'Benguluru','Karnataka',512346,7891234568,'vaibhavkalahalamath@gmail.com');

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
INSERT INTO AddressBook VALUES('Vaishnavi','Kalahalamath', 'Aashirvad Niwas', 'Gadag','Karnataka',431205,1234567815,'vaishnavikalahalamath47@gmail.com');
INSERT INTO AddressBook VALUES('Gourav','Mundhe', 'Aashirvad Niwas', 'Gadag','Karnataka',512436,7894561235,'gouravmundhe@gmail.com');
INSERT INTO AddressBook VALUES('Vishal','Kalahalamath', 'Sarswati complex', 'vadodra','Gujrat',857691,4561237895,'vishalkalahalamath@gmail.com');
INSERT INTO AddressBook VALUES('Vidhya','Kalahalamath', 'Aashirvad Niwas', 'Benguluru','Karnatka',512346,7891234568,'vaibhavkalahalamath@gmail.com');

SELECT * FROM AddressBook;


/* UC4 */
Update AddressBook SET address = 'Matoshri Niwas' WHERE firstName = 'Vidhya';
SELECT * FROM AddressBook;

Update AddressBook SET firstName = 'Vaibhav' where email = 'vaibhavkalahalamath@gmail.com';
Update AddressBook SET address = 'GURU MAHAl' where email = 'vaibhavkalahalamath@gmail.com';
Update AddressBook SET city = 'Benguluru' where email = 'vaibhavkalahalamath@gmail.com';
Update AddressBook SET state = 'Karnatka' where email = 'vaibhavkalahalamath@gmail.com';
SELECT * FROM AddressBook;

/* UC5 */
INSERT INTO AddressBook VALUES('Arti','S', 'Sarthi', 'Pune','Maharashtra',513468,9548621458,'artis@gmail.com');
DELETE FROM AddressBook WHERE firstName = 'Arti';
SELECT * FROM AddressBook;

/* UC6 */
SELECT firstName, lastName, address, state, zip, phoneNumber, email from AddressBook where city = 'benguluru';
SELECT firstName, lastName, address, city, zip, phoneNumber, email from AddressBook where state = 'Gujrat';

/* UC7 */
SELECT city, count(city) from AddressBook Group BY city;
SELECT state, count(state) from AddressBook Group BY state;

/* UC8 */
SELECT firstName, lastName, address, city, state, zip, phoneNumber, email from AddressBook where city = 'jalna' ORDER BY firstName;

/* UC9 */
alter table AddressBook Add Type VARCHAR(255);
SELECT * from AddressBook;

Update AddressBook SET Type = 'Professional' WHERE firstName = 'Vaishnavi';
Update AddressBook SET Type = 'Family' WHERE firstName = 'Gourav';
Update AddressBook SET Type = 'Friend' WHERE firstName = 'Vishal';
Update AddressBook SET Type = 'Friend' WHERE firstName = 'Vaibhav';

/* UC10 */
SELECT Type, COUNT(Type) FROM AddressBook Group BY Type;  

/* UC11 */
INSERT INTO AddressBook VALUES('Arti','S', 'Sarthi', 'Pune','Maharashtra',513468,9548621458,'artis@gmail.com', 'Family');
INSERT INTO AddressBook VALUES('Shivani','Bandger', 'Shanti Niwas', 'Ichalkaranji','Maharashtra',951423,9516284375,'shivani@gmail.com', 'Friend');
INSERT INTO AddressBook VALUES('Aishwarya','Kusgal', 'Om Niwas', 'Ranchi','Zarkhand',852643,7531598464,'aishwaryak@gmail.com', 'Professional');
SELECT * FROM AddressBook;

/* UC 12 */
create table AddressBookTable
(
AddressBookID int identity(1,1) primary key,
AddressBookName varchar(255)
);

INSERT INTO AddressBookTable values
('Engineers'),('Doctors');

SELECT * FROM AddressBookTable;

create table PersonType
(
PersonID int identity(1,1) primary key,
PersonType varchar(255)
);

INSERT INTO PersonType values
('Family'),('Friend'),('Profession');

SELECT * FROM PersonType;

create table Person
(
PersonID int identity(1,1) primary key,
AddressBookID int,
PersonType varchar(255),
FirstName varchar(255),
LastName varchar(255),
Address varchar(255),
City varchar(255),
State varchar(255),
Zipcode int,
PhoneNumber bigint,
Email varchar(256)
foreign key (AddressBookID) references AddressBookTable(AddressBookID)
);

INSERT INTO Person values
(1,'Friend','Shivani','B','Kolhapur','Pune','MH',124563,1234567892,'shivani@gmail.com'),
(2,'Family','Arti','S','Indore','Indore','Gujrat',548692,7894561235,'artis@gmail.com'),
(1,'Professional','Aishwarya','K','Hydrabad','Hydrabad','TN',954862,15984263,'aishwaryak@gmail.com');

SELECT * FROM Person;

create table MapPersonType
(
PersonID int foreign key references Person(PersonID),
PersonTypeID int foreign key references PersonType(PersonID)
);

INSERT INTO MapPersonType values (1,1),(2,2),(3,3),(2,1);

SELECT * FROM MapPersonType;

/* UC 13 */
/* UC 6 */
select p.PersonID,concat(p.FirstName,p.LastName)as Name,concat(p.Address,',',p.City,',',p.State,',',p.ZipCode) as Address,
p.PhoneNumber,p.Email,pt.PersonID,pt.PersonType,ab.AddressBookID ,ab.AddressBookName
from AddressBookTable ab,Person p,PersonType pt,MapPersonType mpt
where (ab.AddressBookID=p.AddressBookID  and p.PersonID=mpt.PersonID and mpt.PersonTypeID=pt.PersonID) and (City='Pune' or State='MH') ;

/* UC 7 */
select count(*),State from Person 
inner join AddressBookTable on Person.AddressBookID= AddressBookTable.AddressBookID group by State;

select count(*),City
from Person 
inner join AddressBookTable on Person.AddressBookID= AddressBookTable.AddressBookID group by City;

/* UC 8*/
select p.PersonID,concat(p.FirstName,p.LastName)as Name,
concat(p.Address,',',p.City,',',p.State,',',p.ZipCode) as Address,p.PhoneNumber,p.Email,
pt.PersonID,pt.PersonType,ab.AddressBookID ,ab.AddressBookName
from AddressBookTable ab,Person p,PersonType pt,MapPersonType mpt
where (ab.AddressBookID=p.AddressBookID  and p.PersonID=mpt.PersonID and mpt.PersonID=pt.PersonID) and (State='MH') order by FirstName;

/* UC 10 */
SELECT COUNT(*),pt.PersonType FROM
MapPersonType AS mpt 
inner join PersonType as pt On pt.PersonId = mpt.PersonId
inner join Person as p on p.PersonId = mpt.PersonId GROUP BY pt.PersonType;

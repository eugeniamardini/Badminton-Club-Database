create table MEMBERSHIP_INFO    
(
membershipID int not null, 
streetAddress Varchar(30) not null,
city varchar(20) not null, 
cardNumber varchar(16),
membershipType varchar(20) not null,
primary key(membershipID),
constraint MEMBERSHIPFK1
foreign key (cardNumber) references cardInfo(cardNumber)
);

create table cardInfo
(
cardNumber varchar(16),
cardExpiration date not null,
primary key(cardNumber)
);


/*
 Card Expiration is functionally dependant on card number.
*/

create table GUEST
(
guestID int not null, 
guestType varchar(15) not null,
lName varchar(20) not null, 
fName varchar(20) not null,
gMembership_ID int, 
email varchar(30) not null,
phoneNum varchar(11) not null,
primary key(guestID),
constraint GUESTFK1
foreign key (gMembership_ID) references MEMBERSHIP_INFO(membershipID)
on delete set null
on update cascade
);



/*
I don't know there is any NF problem in the guest table.
I assume all guest has their own unique information about these attributes.
*/

create table EMPLOYEE
(
employeeID int not null, 
position varchar(30) not null,
hours int not null, 
pay double not null,
emplPhoneNum varchar(11) not null, 
emplEmail varchar(40) not null,
emplStreetAddress varchar(50) not null, 
emplCity varchar(20) not null,
SSN int not null,
primary key (employeeID));


/*
No department? fixed pay and working hours based on position?
If it is NF3.
*/


create table CLASS
(
classID int not null, 
classType varchar(20) not null, 
classDay varchar(20) not null,
startTime varchar(20) not null, 
endTime varchar(20) not null,
primary key(classID)
);

insert into CLASS value(1000, 'BasicBadminton', 'Tuesday', '12:00', '14:00');


create table ClassEmployee
(
classID int not null, 
classEmployeeID int not null,
constraint CLASSEMPLOYEEFK1
foreign key (classEmployeeID) references EMPLOYEE(employeeID)
on delete cascade
on update cascade,
constraint CLASSEMPLOYEEFK2
foreign key (classID) references CLASS(classID)
on delete cascade
on update cascade
);





/*
NF1
employeeID is not functionally dependent on primary key classID.

*/


create table ATTENDANCE_RECORD
(
attClassID int not null, 
attGuestID int not null,
constraint ATTFK1
foreign key (attClassID) references CLASS(classID)
on delete cascade
on update cascade,
constraint ATTFK2
foreign key (attGuestID) references GUEST(guestID)
on delete cascade
on update cascade
);


/*3NF; Assumed guestID was foreign key, not composite key...?*/

create table ORDERS
(
orderID int not null,
placementDate date not null,
arrivalDate date, 
wasGuestContacted bool not null default 0,
orderStatus varchar(30) not null,
primary key(orderID)
);

/*--------------------------------------*/
create table ORDERSGUEST
(orderID int not null,
orderGuestID int,
constraint ORDERGUESTFK1
foreign key (orderGuestID) references GUEST(guestID),
constraint ORDERGUESTFK2
foreign key (orderID) references ORDERS(orderID)
);

create table ORDEREMPLOYEE
(
orderID int not null,
orderEmployeeID int, 
constraint ORDEREMPLOYEEFK1
foreign key (orderEmployeeID) references EMPLOYEE(employeeID),
constraint ORDEREMPLOYEEFK2
foreign key (orderID) references ORDERS(orderID)
);
/*----------------------------------------------------*/

/*
1NF;  guestID, employeeID not functionally dependent on primary key orderID.
*/


create Table VENDOR
(vendorID int not null, 
vendorName varchar(20) not null,
vPhoneNum varchar(11) not null, 
vEmail varchar(30) not null,
vzipCode int(5) not null,
vebsite varchar(30) not null,
primary key (vendorID),
constraint VENDORFK1
foreign key (vzipCode) references VENDORZIP(zipCode)
);



create table VENDORZIP
(
zipCode int(5) not null,
vStreetAddress varchar(50) not null, 
vCity varchar(20) not null,
vState varchar(20) not null,
primary key (zipCode)
);

/*NF3*/




create table PROSHOP_ITEM
(itemID int not null, 
itemName varchar(25) not null,
itemDescription varchar(50) not null, 
price double not null, 
category varchar(20) not null,
primary key (itemID)
);


create table PROSHOP_ORDER
(
itemID int not null, 
vendorID int not null,
lastOrderDate date not null, 
quantity int not null,
constraint PROSHOP_ORDER1
foreign key (vendorID) references VENDOR(vendorID)
on delete cascade
on update cascade,
constraint PROSHOP_ORDER2
foreign key (itemID) references PROSHOP_ITEM(itemID)
on delete cascade
on update cascade
);




/*1NF; vendorID not functionally dependent on primary key itemID
the first table is for item description
the second table is for item order, vendor and its quantity*/



create table ITEM_ORDERED
(orderID int not null, 
itemID int,
quantity int not null,
constraint ITEM_ORDEREDFK1
foreign key (orderID) references ORDERS(orderID)
on delete cascade
on update cascade,
constraint ITEM_ORDEREDFK2
foreign key (itemID) references PROSHOP_ITEM(itemID)
on delete set null
on update cascade
);


/* this table will be replaced with select statement.*/

create table CLUB_OWNER
(EIN int not null, ownerFName varchar(20) not null,
ownerLName varchar(20) not null, owPhoneNum varchar(11) not null,
owEmail varchar(40) not null, starting_Date Date not null,
role varchar(30), owStreetAddress Varchar(40) not null,
owCity Varchar(20) not null, employeeID int,
primary key(EIN),
constraint CLUB_OWNERFK1
foreign key (employeeID) references EMPLOYEE(employeeID)
on delete set null
on update cascade
);
/* no change on this table*/


insert into MEMBERSHIP_INFO value(11, '24222 Sunrise', 'Bothell', 1234567890, 'A');
insert into MEMBERSHIP_INFO value(12, '11042 NE Bothell DR', 'Bothell', 1111111111, 'A');
insert into MEMBERSHIP_INFO value(13, '131 South Park', 'Seattle', 2222222222, 'B');

insert into cardInfo value(1234567890, 20180301);
insert into cardInfo value(1111111111, 20160701);
insert into cardInfo value(2222222222, 20200101);

insert into EMPLOYEE value(100, 'CFO', 45, 45000, 2223334444, 'sfs32@yahoo.com', '4223 Wood DR', 'Woodinville', 123456789);
insert into EMPLOYEE value(101, 'Finance', 48, 38000, 2223334444, 's5321@uw.edu', '13812 Bellevue road', 'Bellevue', 0987654321);
insert into EMPLOYEE value(102, 'Statician', 54, 43000, 2223334444, 'jdae2f@gmail.com', '322 Rest square', 'Bothell', 1111111111);
insert into EMPLOYEE value(221133, 'Owner', 45, 50000, 2223332222, 'Deathstar@j.net', 'DSA villege 123', 'Bellevue', 222333444);

insert into GUEST value(100, 'A', 'Luke', 'Walker', 11, 'aewws234@gmail.com', 2223332222);
insert into GUEST value(101, 'B', 'Ow', 'Wes', 11, 'khurdq@gmail.com', 2244444422);
insert into GUEST value(102, 'C', 'Micro', 'Soft', 11, 'gasewt434534@ms.com', 1234567890);

insert into CLASS value(1000, 'BasicBadminton', 'Tuesday', '12:00', '14:00');
insert into CLASS value(1021, '2:2 Match', 'Thursday', '8:00', '10:00');
insert into CLASS value(1042, 'Badminton 101', 'Friday', '19:00', '21:00');

insert into ClassEmployee value(1000, 100);
insert into ClassEmployee value(1021, 101);
insert into ClassEmployee value(1042, 102);

insert into attendance_record value(1000, 100);
insert into attendance_record value(1000, 101);
insert into attendance_record value(1042, 102);

insert into ORDERS value(12412, '2015-8-12', '2015-08-15', true, "Arrived");
insert into ORDERS value(11322, '2015-9-17', '2015-09-22', false, "Arrived");
insert into ORDERS value(13211, '2015-12-8', '2015-08-10', true, "Departed");

insert into ORDERSGUEST value(11322, 101);
insert into ORDERSGUEST value(12412, 100);
insert into ORDERSGUEST value(13211, 101);

insert into ORDEREMPLOYEE value (11322, 102);
insert into ORDEREMPLOYEE value (12412, 102);
insert into ORDEREMPLOYEE value (13211, 102);

insert into VENDORZIP value(98021, 'Canyon Park Place 2211', 'Bothell', 'WA');
insert into VENDORZIP value(98052, 'Village Square NE 87st', 'Redmond', 'WA');
insert into VENDORZIP value(98103, 'ABC building 20th floor', 'Seattle', 'WA');

insert into VENDOR value(1000, 'A-company', '4253332222', 'sdfkjh452@gmail.com', 98021, 'Do not have');
insert into VENDOR value(1001, 'B-company', '4254441112', 'gsdfsr@yahoo.com', 98103, 'Do not have');
insert into VENDOR value(1002, 'C-company', '4255224442', '42gsdfe@gmail.com', 98052, 'Do not have');

insert into PROSHOP_ITEM value(10000, 'Super Racket', 'Very Strong Racket', 19.99, 'Equipment');
insert into PROSHOP_ITEM value(20000, 'Badminton 101', 'Boring textbook like a college book.', 24.99, 'Book');
insert into PROSHOP_ITEM value(30000, 'Badminton suite', 'Lee style yellow exercise suite', 19.99, 'Apparel');

insert into PROSHOP_ORDER value(20000, 1001, '2015-9-22', 50);
insert into PROSHOP_ORDER value(30000, 1002, '2015-11-19', 100);
insert into PROSHOP_ORDER value(10000, 1000, '2015-10-1', 20);

insert into ITEM_ORDERED value(12412, 10000, 1);
insert into ITEM_ORDERED value(11322, 20000, 1);
insert into ITEM_ORDERED value(13211, 30000, 3);

insert into CLUB_OWNER value(221133, 'Das', 'Vader', '2223332222', 'Deathstar@j.net', '2005-1-1', '', 'DSA villege 123', 'Bellevue', 221133);


select * from orders where orderID = 12412;
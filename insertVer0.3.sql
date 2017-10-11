insert into cardInfo value(1234567890, 20180301);
insert into cardInfo value(1111111111, 20160701);
insert into cardInfo value(2222222222, 20200101);

insert into MEMBERSHIP_INFO value(11, '24222 Sunrise', 'Bothell', 1234567890, 'A');
insert into MEMBERSHIP_INFO value(12, '11042 NE Bothell DR', 'Bothell', 1111111111, 'A');
insert into MEMBERSHIP_INFO value(13, '131 South Park', 'Seattle', 2222222222, 'B');

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
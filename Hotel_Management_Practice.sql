create database HotelManagementDB;
use HotelManagementDB;

create table Guests(
guest_id int primary key,
guest_name varchar(20),
phone varchar(10),
email varchar(100),
city varchar(10),
created_at datetime);

insert into Guests(guest_id, guest_name, phone, email, city, created_at)
values (1,'Rakesh Bhosle', '7823464181', 'RakeshB@gmail.com', 'pune', '2025-06-22 10:16:17'),
(2, 'Priya Sharma', '9823012345', 'priya@gmail.com', 'Mumbai', '2025-06-23 09:30:00'),
(3, 'Amit Patil', '9765012345', 'amit@gmail.com', 'Pune', '2025-06-24 11:15:00'),
(4, 'Sneha Joshi', '9890012345', 'sneha@gmail.com', 'Nashik', '2025-06-25 14:20:00'),
(5, 'Rahul Deshmukh', '9123012345', 'rahul@gmail.com', 'Pune', '2025-06-26 16:45:00'),
(6, 'Neha Kulkarni', '9766012345', 'neha@gmail.com', 'Nagpur', '2025-06-27 10:00:00'),
(7, 'Karan Shah', '9822012345', 'karan@gmail.com', 'Mumbai', '2025-06-28 12:30:00'),
(8, 'Pooja More', '9891012345', 'pooja@gmail.com', 'Kolhapur', '2025-06-29 13:10:00'),
(9, 'Sahil Pawar', '9156012345', 'sahil@gmail.com', 'Pune', '2025-06-30 17:00:00'),
(10, 'Isha Mehta', '9767012345', 'isha@gmail.com', 'Nashik', '2025-07-01 08:45:00');

select * from Guests;

create table Rooms(
room_id int primary key,
room_number int unique,
room_type varchar(10),
price_per_night decimal(10,2),
room_status varchar(20));

INSERT INTO Rooms
(room_id, room_number, room_type, price_per_night, room_status)
VALUES
(1, 101, 'Single', 1500.00, 'Available'),
(2, 102, 'Single', 1500.00, 'Occupied'),
(3, 103, 'Double', 2500.00, 'Available'),
(4, 104, 'Double', 2500.00, 'Occupied'),
(5, 201, 'Deluxe', 4000.00, 'Available'),
(6, 202, 'Deluxe', 4000.00, 'Maintenance'),
(7, 203, 'Suite', 6500.00, 'Available'),
(8, 204, 'Suite', 6500.00, 'Occupied'),
(9, 301, 'Double', 2800.00, 'Available'),
(10, 302, 'Deluxe', 4200.00, 'Available');

SELECT * FROM Rooms;

CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY,
    guest_id INT,
    room_id INT,
    check_in_date DATE,
    check_out_date DATE,
    booking_status VARCHAR(20),
    FOREIGN KEY (guest_id) REFERENCES Guests(guest_id),
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id)
);

INSERT INTO Bookings
(booking_id, guest_id, room_id, check_in_date, check_out_date, booking_status)
VALUES
(1, 1, 1, '2026-10-01', '2026-10-03', 'Checked-Out'),
(2, 2, 3, '2026-10-02', '2026-10-05', 'Checked-Out'),
(3, 3, 2, '2026-10-10', '2026-10-13', 'Checked-Out'),
(4, 4, 5, '2026-10-14', '2026-10-17', 'Confirmed'),
(5, 5, 4, '2026-10-15', '2026-10-18', 'Confirmed'),
(6, 6, 7, '2026-10-16', '2026-10-19', 'Confirmed'),
(7, 7, 6, '2026-10-17', '2026-10-20', 'Cancelled'),
(8, 8, 9, '2026-10-18', '2026-10-21', 'Confirmed'),
(9, 9, 8, '2026-10-19', '2026-10-22', 'Confirmed'),
(10, 10, 10, '2026-10-20', '2026-10-23', 'Confirmed');
SELECT * FROM Bookings;

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    booking_id INT,
    payment_date DATE,
    amount DECIMAL(10,2),
    payment_method VARCHAR(20),
    payment_status VARCHAR(20),
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);

INSERT INTO Payments
(payment_id, booking_id, payment_date, amount, payment_method, payment_status)
VALUES
(1, 1, '2026-10-01', 3000.00, 'UPI', 'Completed'),
(2, 2, '2026-10-02', 7500.00, 'Card', 'Completed'),
(3, 3, '2026-10-10', 3000.00, 'Cash', 'Completed'),
(4, 4, '2026-10-14', 12000.00, 'UPI', 'Pending'),
(5, 5, '2026-10-15', 7500.00, 'Card', 'Completed'),
(6, 6, '2026-10-16', 19500.00, 'UPI', 'Completed'),
(7, 7, '2026-10-17', 0.00, 'Cash', 'Refunded'),
(8, 8, '2026-10-18', 8400.00, 'Card', 'Pending'),
(9, 9, '2026-10-19', 19500.00, 'UPI', 'Completed'),
(10, 10, '2026-10-20', 12600.00, 'Cash', 'Pending');
SELECT * FROM Payments;


CREATE TABLE Services (
    service_id INT PRIMARY KEY,
    service_name VARCHAR(50) UNIQUE,
    service_price DECIMAL(10,2)
);


INSERT INTO Services
(service_id, service_name, service_price)
VALUES
(1, 'Breakfast', 300.00),
(2, 'Lunch', 500.00),
(3, 'Dinner', 600.00),
(4, 'Laundry', 200.00),
(5, 'Spa', 1500.00),
(6, 'Airport Pickup', 1000.00),
(7, 'Room Cleaning', 150.00),
(8, 'Gym Access', 250.00),
(9, 'Extra Bed', 800.00),
(10, 'Swimming Pool', 400.00);
SELECT * FROM Services;


CREATE TABLE Booking_Services (
    booking_service_id INT PRIMARY KEY,
    booking_id INT,
    service_id INT,
    quantity INT,
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id),
    FOREIGN KEY (service_id) REFERENCES Services(service_id)
);

INSERT INTO Booking_Services
(booking_service_id, booking_id, service_id, quantity)
VALUES
(1, 1, 1, 2),
(2, 1, 4, 1),
(3, 2, 2, 2),
(4, 2, 3, 2),
(5, 3, 1, 1),
(6, 4, 5, 2),
(7, 4, 7, 1),
(8, 5, 6, 1),
(9, 6, 8, 2),
(10, 8, 9, 1),
(11, 9, 10, 2),
(12, 10, 3, 3);
SELECT * FROM Booking_Services;


-- Q1. Find the total number of guests registered in the hotel.
select count(*) As total_guests from Guests;

-- Q2. Find the total number of unique cities from which guests belong.
select count(distinct city) As total_cities from Guests;

-- Q3. Find the average price per night of all hotel rooms.
select avg(price_per_night) As Avg_room_price from Rooms;

-- Q4. Find the highest price per night among all hotel rooms.
select max(price_per_night) As Highest_room_price from Rooms;

 -- Q5. Find the lowest price per night among all hotel rooms.
 select min(price_per_night) As Lowest_room_price from Rooms;

use HotelManagementDB;
select * from Rooms;

-- Find the average price per night for each room type.
select room_type , avg(price_per_night) from Rooms
group by room_type;

--  Find room types whose average price per night is greater than 3000.
select room_type, avg(price_per_night) from Rooms
group by room_type
having avg(price_per_night) > 3000;

select * from Bookings;

-- Find booking statuses that have more than 1 booking.
select booking_status, count(*) from Bookings
group by booking_status
having count(*) > 1;

select * from Payments;

-- Find payment methods whose total payment amount is greater than 10000.
select payment_method, sum(amount) as total_amount
from Payments
group by payment_method 
having sum(amount) > 10000;

select * from Guests;
-- Find cities that have more than 2 guests.
select city, count(*) as total_guests from Guests
group by city 
having count(*) > 2;

select * from Payments;
-- Find payment statuses whose total payment amount is greater than 15000.
select payment_status , sum(amount) as total_payment from Payments
group by payment_status
having sum(amount) > 15000;

-- Find room types whose maximum price per night is greater than 4000.
select room_type, max(price_per_night) as max_price from Rooms
group by room_type
having max(price_per_night) > 4000;

-- Find cities whose minimum guest ID is less than 5.
select city, min(guest_id) as Min_GuestsID from Guests
group by city 
having min(guest_id) < 5;

# joins

-- Display guest names along with their booking statuses.
select Guests.guest_name, Bookings.booking_status from Guests
inner join Bookings
ON Guests.guest_id = Bookings.guest_id;

-- Display booking IDs along with their payment amounts.
select Bookings.booking_id, Payments.amount from Bookings
inner join Payments
ON Bookings.booking_id = Payments.booking_id;

-- Display guest names along with their booking IDs and booking statuses.
select Guests.guest_name, Bookings.booking_id, Bookings.booking_status
from Guests
inner join Bookings
ON Guests.guest_id = Bookings.guest_id;

select * from Rooms;
select * from Bookings;
-- Display room numbers along with their booking IDs and booking statuses.
select Rooms.room_number, Bookings.booking_id, Bookings.booking_status
from Rooms
inner join Bookings
ON Rooms.room_id = Bookings.room_id;

-- Display guest names along with their payment amounts.
describe Guests;
describe Payments;
describe Bookings;

select Guests.guest_name, Bookings.booking_id, Payments.amount
from Guests
inner join Bookings
ON Guests.guest_id = Bookings.guest_id
inner join Payments
ON Bookings.booking_id = Payments.booking_id;

-- Display guest names along with their room numbers.

select Guests.guest_name, Rooms.room_number from Guests
inner join Bookings
ON Guests.guest_id = Bookings.guest_id
inner join Rooms
ON Bookings.room_id = Rooms.room_id;

-- Display guest names along with their payment methods and payment amounts.
select Guests.guest_name, Payments.payment_method, Payments.amount from Guests
inner join Bookings
ON Guests.guest_id = Bookings.guest_id
inner join Payments
ON Bookings.booking_id = Payments.booking_id;

use HotelManagementDB;

-- Display all room numbers along with their booking IDs.
select Rooms.room_number, Bookings.booking_id from Rooms
left join Bookings
ON Rooms.room_id = Bookings.room_id;

-- Display all guests along with their booking IDs.
describe Guests;
describe Bookings;

select Guests.guest_name, Bookings.booking_id from Guests
left join Bookings
ON Guests.guest_id = Bookings.guest_id;

-- Display all booking IDs along with their payment amounts.
select Bookings.booking_id, Payments.amount from Bookings
left join Payments
ON Bookings.booking_id = Payments.booking_id;

-- Display all room types along with their booking IDs.
select Rooms.room_type, Bookings.booking_id from Rooms
left join Bookings
ON Rooms.room_id = Bookings.room_id;

-- Display all guests along with their payment amounts.
select Guests.guest_name, Payments.amount from Guests
left join Bookings
ON Guests.guest_id = Bookings.guest_id
left join Payments
ON Bookings.booking_id = Payments.booking_id;

-- Display all booking IDs along with their payment amounts.
select Bookings.booking_id, Payments.amount from Payments
right join Bookings
ON Bookings.booking_id = Payments.booking_id;

-- Display all guest names along with their booking IDs.
select Guests.guest_name, Bookings.booking_id from Bookings
right join Guests
ON Guests.guest_id = Bookings.guest_id;

-- Display all booking IDs along with guest names and payment amounts.
select Bookings.booking_id, Guests.guest_name, Payments.amount from Bookings
inner join Guests
ON Bookings.guest_id = Guests.guest_id
inner join Payments
ON Bookings.booking_id = Payments.booking_id;

select * from Rooms;

update Guests
set city = 'pune'
where guest_id = 3;

update Rooms
set price_per_night = 4500
where room_id = 6;

update Payments
set payment_status = 'Completed'
where payment_id = 4;

alter table Guests
add Gender varchar(10);
DESCRIBE Guests;

alter table Rooms
add Description varchar(100);
describe Rooms;

update Guests
set Gender = "Male"
where guest_id = 3;
select * from Guests;

update Rooms 
set Description = "Double room with AC"
where room_id = 3;
select * from Rooms;

use HotelManagementDB;

SELECT * FROM Guests
ORDER BY guest_id DESC
LIMIT 5;

SELECT *
FROM Guests
WHERE guest_id = 11;

SELECT COUNT(*) AS total_guests
FROM Guests;

SELECT guest_id
FROM Guests
WHERE guest_id BETWEEN 11 AND 20;

INSERT INTO Guests
(guest_id, guest_name, phone, email, city, created_at)
VALUES
(11, 'Aarav Deshmukh', '9876501234', 'aarav@example.com', 'Pune', '2025-07-02 09:00:00'),
(12, 'Sneha Joshi', '9876501235', 'sneha@example.com', 'Mumbai', '2025-07-02 09:15:00'),
(13, 'Rohan Patil', '9876501236', 'rohan@example.com', 'Nashik', '2025-07-02 09:30:00'),
(14, 'Ananya Shah', '9876501237', 'ananya@example.com', 'Nagpur', '2025-07-02 09:45:00'),
(15, 'Vedant Kulkarni', '9876501238', 'vedant@example.com', 'Pune', '2025-07-02 10:00:00'),
(16, 'Mira Pawar', '9876501239', 'mira@example.com', 'Kolhapur', '2025-07-02 10:15:00'),
(17, 'Aditya More', '9876501240', 'aditya@example.com', 'Mumbai', '2025-07-02 10:30:00'),
(18, 'Ira Desai', '9876501241', 'ira@example.com', 'Nashik', '2025-07-02 10:45:00'),
(19, 'Omkar Jadhav', '9876501242', 'omkar@example.com', 'Pune', '2025-07-02 11:00:00'),
(20, 'Sana Khan', '9876501243', 'sana@example.com', 'Nagpur', '2025-07-02 11:15:00');

SELECT COUNT(*) AS total_guests
FROM Guests;

SELECT guest_id, guest_name, Gender
FROM Guests
WHERE Gender IS NULL;

SELECT guest_id, guest_name, Gender
FROM Guests
ORDER BY guest_id;

UPDATE Guests
SET Gender = CASE guest_id
    WHEN 11 THEN 'Male'
    WHEN 12 THEN 'Female'
    WHEN 13 THEN 'Male'
    WHEN 14 THEN 'Female'
    WHEN 15 THEN 'Male'
END
WHERE guest_id BETWEEN 11 AND 15;

SELECT guest_id, guest_name, Gender
FROM Guests
WHERE Gender IS NULL;

SELECT COUNT(*) AS total_rooms
FROM Rooms;

SELECT room_id, room_number
FROM Rooms
ORDER BY room_id DESC;

INSERT INTO Rooms
(room_id, room_number, room_type, price_per_night, room_status)
VALUES
(11, 303, 'Single', 1600.00, 'Available'),
(12, 304, 'Double', 2700.00, 'Available'),
(13, 305, 'Deluxe', 4300.00, 'Occupied'),
(14, 306, 'Suite',  6800.00, 'Available'),
(15, 307, 'Double', 2800.00, 'Maintenance');

SELECT COUNT(*) AS total_rooms
FROM Rooms;

SELECT *
FROM Rooms
ORDER BY room_id DESC
LIMIT 5;

SELECT COUNT(*) AS total_bookings
FROM Bookings;

SELECT booking_id, guest_id, room_id,
       check_in_date, check_out_date, booking_status
FROM Bookings
ORDER BY booking_id;

INSERT INTO Bookings
(booking_id, guest_id, room_id,
 check_in_date, check_out_date, booking_status)
VALUES
(11, 11, 11, '2026-11-01', '2026-11-03', 'Confirmed'),
(12, 12, 12, '2026-11-02', '2026-11-05', 'Confirmed'),
(13, 13, 13, '2026-11-04', '2026-11-06', 'Confirmed'),
(14, 14, 14, '2026-11-07', '2026-11-10', 'Confirmed'),
(15, 15, 15, '2026-11-11', '2026-11-13', 'Cancelled');

SELECT COUNT(*) AS total_bookings
FROM Bookings;

SELECT * FROM Bookings ORDER BY booking_id DESC LIMIT 5;

SELECT payment_id, booking_id, payment_date,
       amount, payment_method, payment_status
FROM Payments
ORDER BY payment_id;

INSERT INTO Payments
(payment_id, booking_id, payment_date, amount,
 payment_method, payment_status)
VALUES
(11, 11, '2026-11-01', 3200.00, 'UPI',  'Completed'),
(12, 12, '2026-11-02', 8100.00, 'Card', 'Pending'),
(13, 13, '2026-11-04', 8600.00, 'Cash', 'Completed'),
(14, 14, '2026-11-07', 20400.00, 'UPI', 'Pending'),
(15, 15, '2026-11-11', 0.00, 'Cash', 'Refunded');

SELECT COUNT(*) AS total_payments
FROM Payments;

SELECT * FROM Payments ORDER BY payment_id DESC LIMIT 5;

SELECT service_id, service_name, service_price
FROM Services
ORDER BY service_id;

INSERT INTO Services
(service_id, service_name, service_price)
VALUES
(11, 'Welcome Drink', 120.00),
(12, 'Room Service', 250.00),
(13, 'City Tour', 1800.00),
(14, 'Ironing', 100.00),
(15, 'Late Checkout', 700.00);

SELECT COUNT(*) AS total_services
FROM Services;

SELECT *
FROM Services
ORDER BY service_id DESC
LIMIT 5;

SELECT *
FROM Booking_Services
ORDER BY booking_service_id;

INSERT INTO Booking_Services
(booking_service_id, booking_id, service_id, quantity)
VALUES
(13, 11, 11, 2),
(14, 11, 12, 1),
(15, 12, 13, 2),
(16, 12, 14, 1),
(17, 13, 15, 1),
(18, 14,  4, 2),
(19, 14,  6, 1),
(20, 15, 10, 2);

SELECT COUNT(*) AS total_booking_services
FROM Booking_Services;

SELECT
    b.booking_id,
    g.guest_name,
    r.room_number,
    b.booking_status
FROM Bookings b
JOIN Guests g
    ON b.guest_id = g.guest_id
JOIN Rooms r
    ON b.room_id = r.room_id
ORDER BY b.booking_id;

SELECT
    p.payment_id,
    p.booking_id,
    g.guest_name,
    p.amount,
    p.payment_status
FROM Payments p
JOIN Bookings b
    ON p.booking_id = b.booking_id
JOIN Guests g
    ON b.guest_id = g.guest_id
ORDER BY p.payment_id;

SELECT
    bs.booking_service_id,
    bs.booking_id,
    s.service_name,
    bs.quantity,
    s.service_price
FROM Booking_Services bs
JOIN Services s
    ON bs.service_id = s.service_id
ORDER BY bs.booking_service_id;

SELECT MAX(room_id) AS highest_room_id,
       COUNT(*) AS total_rooms
FROM Rooms;

INSERT INTO Rooms
(room_id, room_number, room_type, price_per_night, room_status)
VALUES
(16, 308, 'Single', 1600.00, 'Available'),
(17, 309, 'Single', 1700.00, 'Available'),
(18, 310, 'Double', 2700.00, 'Available'),
(19, 311, 'Double', 2800.00, 'Occupied'),
(20, 312, 'Deluxe', 4300.00, 'Available'),
(21, 313, 'Suite', 6800.00, 'Available'),
(22, 314, 'Single', 1500.00, 'Maintenance'),
(23, 315, 'Double', 2900.00, 'Available'),
(24, 316, 'Deluxe', 4500.00, 'Occupied'),
(25, 317, 'Suite', 7000.00, 'Available'),
(26, 318, 'Single', 1650.00, 'Available'),
(27, 319, 'Double', 2750.00, 'Available'),
(28, 320, 'Deluxe', 4400.00, 'Available'),
(29, 321, 'Suite', 7200.00, 'Occupied'),
(30, 322, 'Single', 1550.00, 'Available'),
(31, 323, 'Double', 2850.00, 'Maintenance'),
(32, 324, 'Deluxe', 4600.00, 'Available'),
(33, 325, 'Suite', 7500.00, 'Available'),
(34, 326, 'Single', 1750.00, 'Occupied'),
(35, 327, 'Double', 3000.00, 'Available'),
(36, 328, 'Deluxe', 4700.00, 'Available'),
(37, 329, 'Suite', 7800.00, 'Available'),
(38, 330, 'Single', 1800.00, 'Available'),
(39, 331, 'Double', 3100.00, 'Occupied'),
(40, 332, 'Deluxe', 4800.00, 'Available'),
(41, 333, 'Suite', 8000.00, 'Available'),
(42, 334, 'Single', 1850.00, 'Available'),
(43, 335, 'Double', 3200.00, 'Available'),
(44, 336, 'Deluxe', 4900.00, 'Maintenance'),
(45, 337, 'Suite', 8200.00, 'Available'),
(46, 338, 'Single', 1900.00, 'Available'),
(47, 339, 'Double', 3300.00, 'Available'),
(48, 340, 'Deluxe', 5000.00, 'Occupied'),
(49, 341, 'Suite', 8500.00, 'Available'),
(50, 342, 'Double', 3400.00, 'Available');

SELECT COUNT(*) AS total_rooms
FROM Rooms;

SELECT
    MIN(guest_id) AS first_guest_id,
    MAX(guest_id) AS highest_guest_id,
    COUNT(*) AS total_guests
FROM Guests;


INSERT INTO Guests
(guest_id, guest_name, phone, email, city, created_at, Gender)
VALUES
(21, 'Guest 21', '9000000021', 'guest21@example.com', 'Pune', '2025-07-03 09:00:00', 'Male'),
(22, 'Guest 22', '9000000022', 'guest22@example.com', 'Mumbai', '2025-07-03 09:15:00', 'Female'),
(23, 'Guest 23', '9000000023', 'guest23@example.com', 'Nashik', '2025-07-03 09:30:00', NULL),
(24, 'Guest 24', '9000000024', 'guest24@example.com', 'Nagpur', '2025-07-03 09:45:00', 'Male'),
(25, 'Guest 25', '9000000025', 'guest25@example.com', 'Pune', '2025-07-03 10:00:00', NULL),
(26, 'Guest 26', '9000000026', 'guest26@example.com', 'Mumbai', '2025-07-03 10:15:00', 'Female'),
(27, 'Guest 27', '9000000027', 'guest27@example.com', 'Nashik', '2025-07-03 10:30:00', 'Male'),
(28, 'Guest 28', '9000000028', 'guest28@example.com', 'Nagpur', '2025-07-03 10:45:00', NULL),
(29, 'Guest 29', '9000000029', 'guest29@example.com', 'Pune', '2025-07-03 11:00:00', 'Female'),
(30, 'Guest 30', '9000000030', 'guest30@example.com', 'Mumbai', '2025-07-03 11:15:00', NULL),
(31, 'Guest 31', '9000000031', 'guest31@example.com', 'Nashik', '2025-07-03 11:30:00', 'Male'),
(32, 'Guest 32', '9000000032', 'guest32@example.com', 'Nagpur', '2025-07-03 11:45:00', 'Female'),
(33, 'Guest 33', '9000000033', 'guest33@example.com', 'Pune', '2025-07-03 12:00:00', NULL),
(34, 'Guest 34', '9000000034', 'guest34@example.com', 'Mumbai', '2025-07-03 12:15:00', 'Male'),
(35, 'Guest 35', '9000000035', 'guest35@example.com', 'Nashik', '2025-07-03 12:30:00', NULL),
(36, 'Guest 36', '9000000036', 'guest36@example.com', 'Nagpur', '2025-07-03 12:45:00', 'Female'),
(37, 'Guest 37', '9000000037', 'guest37@example.com', 'Pune', '2025-07-03 13:00:00', 'Male'),
(38, 'Guest 38', '9000000038', 'guest38@example.com', 'Mumbai', '2025-07-03 13:15:00', NULL),
(39, 'Guest 39', '9000000039', 'guest39@example.com', 'Nashik', '2025-07-03 13:30:00', 'Female'),
(40, 'Guest 40', '9000000040', 'guest40@example.com', 'Nagpur', '2025-07-03 13:45:00', NULL),
(41, 'Guest 41', '9000000041', 'guest41@example.com', 'Pune', '2025-07-03 14:00:00', 'Male'),
(42, 'Guest 42', '9000000042', 'guest42@example.com', 'Mumbai', '2025-07-03 14:15:00', 'Female'),
(43, 'Guest 43', '9000000043', 'guest43@example.com', 'Nashik', '2025-07-03 14:30:00', NULL),
(44, 'Guest 44', '9000000044', 'guest44@example.com', 'Nagpur', '2025-07-03 14:45:00', 'Male'),
(45, 'Guest 45', '9000000045', 'guest45@example.com', 'Pune', '2025-07-03 15:00:00', NULL),
(46, 'Guest 46', '9000000046', 'guest46@example.com', 'Mumbai', '2025-07-03 15:15:00', 'Female'),
(47, 'Guest 47', '9000000047', 'guest47@example.com', 'Nashik', '2025-07-03 15:30:00', 'Male'),
(48, 'Guest 48', '9000000048', 'guest48@example.com', 'Nagpur', '2025-07-03 15:45:00', NULL),
(49, 'Guest 49', '9000000049', 'guest49@example.com', 'Pune', '2025-07-03 16:00:00', 'Female'),
(50, 'Guest 50', '9000000050', 'guest50@example.com', 'Mumbai', '2025-07-03 16:15:00', NULL),
(51, 'Guest 51', '9000000051', 'guest51@example.com', 'Nashik', '2025-07-03 16:30:00', 'Male'),
(52, 'Guest 52', '9000000052', 'guest52@example.com', 'Nagpur', '2025-07-03 16:45:00', 'Female'),
(53, 'Guest 53', '9000000053', 'guest53@example.com', 'Pune', '2025-07-03 17:00:00', NULL),
(54, 'Guest 54', '9000000054', 'guest54@example.com', 'Mumbai', '2025-07-03 17:15:00', 'Male'),
(55, 'Guest 55', '9000000055', 'guest55@example.com', 'Nashik', '2025-07-03 17:30:00', NULL),
(56, 'Guest 56', '9000000056', 'guest56@example.com', 'Nagpur', '2025-07-03 17:45:00', 'Female'),
(57, 'Guest 57', '9000000057', 'guest57@example.com', 'Pune', '2025-07-03 18:00:00', 'Male'),
(58, 'Guest 58', '9000000058', 'guest58@example.com', 'Mumbai', '2025-07-03 18:15:00', NULL),
(59, 'Guest 59', '9000000059', 'guest59@example.com', 'Nashik', '2025-07-03 18:30:00', 'Female'),
(60, 'Guest 60', '9000000060', 'guest60@example.com', 'Nagpur', '2025-07-03 18:45:00', NULL),
(61, 'Guest 61', '9000000061', 'guest61@example.com', 'Pune', '2025-07-03 19:00:00', 'Male'),
(62, 'Guest 62', '9000000062', 'guest62@example.com', 'Mumbai', '2025-07-03 19:15:00', 'Female'),
(63, 'Guest 63', '9000000063', 'guest63@example.com', 'Nashik', '2025-07-03 19:30:00', NULL),
(64, 'Guest 64', '9000000064', 'guest64@example.com', 'Nagpur', '2025-07-03 19:45:00', 'Male'),
(65, 'Guest 65', '9000000065', 'guest65@example.com', 'Pune', '2025-07-03 20:00:00', NULL),
(66, 'Guest 66', '9000000066', 'guest66@example.com', 'Mumbai', '2025-07-03 20:15:00', 'Female'),
(67, 'Guest 67', '9000000067', 'guest67@example.com', 'Nashik', '2025-07-03 20:30:00', 'Male'),
(68, 'Guest 68', '9000000068', 'guest68@example.com', 'Nagpur', '2025-07-03 20:45:00', NULL),
(69, 'Guest 69', '9000000069', 'guest69@example.com', 'Pune', '2025-07-03 21:00:00', 'Female'),
(70, 'Guest 70', '9000000070', 'guest70@example.com', 'Mumbai', '2025-07-03 21:15:00', NULL),
(71, 'Guest 71', '9000000071', 'guest71@example.com', 'Nashik', '2025-07-03 21:30:00', 'Male'),
(72, 'Guest 72', '9000000072', 'guest72@example.com', 'Nagpur', '2025-07-03 21:45:00', 'Female'),
(73, 'Guest 73', '9000000073', 'guest73@example.com', 'Pune', '2025-07-03 22:00:00', NULL),
(74, 'Guest 74', '9000000074', 'guest74@example.com', 'Mumbai', '2025-07-03 22:15:00', 'Male'),
(75, 'Guest 75', '9000000075', 'guest75@example.com', 'Nashik', '2025-07-03 22:30:00', NULL),
(76, 'Guest 76', '9000000076', 'guest76@example.com', 'Nagpur', '2025-07-03 22:45:00', 'Female'),
(77, 'Guest 77', '9000000077', 'guest77@example.com', 'Pune', '2025-07-03 23:00:00', 'Male'),
(78, 'Guest 78', '9000000078', 'guest78@example.com', 'Mumbai', '2025-07-03 23:15:00', NULL),
(79, 'Guest 79', '9000000079', 'guest79@example.com', 'Nashik', '2025-07-03 23:30:00', 'Female'),
(80, 'Guest 80', '9000000080', 'guest80@example.com', 'Nagpur', '2025-07-03 23:45:00', NULL),
(81, 'Guest 81', '9000000081', 'guest81@example.com', 'Pune', '2025-07-04 09:00:00', 'Male'),
(82, 'Guest 82', '9000000082', 'guest82@example.com', 'Mumbai', '2025-07-04 09:15:00', 'Female'),
(83, 'Guest 83', '9000000083', 'guest83@example.com', 'Nashik', '2025-07-04 09:30:00', NULL),
(84, 'Guest 84', '9000000084', 'guest84@example.com', 'Nagpur', '2025-07-04 09:45:00', 'Male'),
(85, 'Guest 85', '9000000085', 'guest85@example.com', 'Pune', '2025-07-04 10:00:00', NULL),
(86, 'Guest 86', '9000000086', 'guest86@example.com', 'Mumbai', '2025-07-04 10:15:00', 'Female'),
(87, 'Guest 87', '9000000087', 'guest87@example.com', 'Nashik', '2025-07-04 10:30:00', 'Male'),
(88, 'Guest 88', '9000000088', 'guest88@example.com', 'Nagpur', '2025-07-04 10:45:00', NULL),
(89, 'Guest 89', '9000000089', 'guest89@example.com', 'Pune', '2025-07-04 11:00:00', 'Female'),
(90, 'Guest 90', '9000000090', 'guest90@example.com', 'Mumbai', '2025-07-04 11:15:00', NULL),
(91, 'Guest 91', '9000000091', 'guest91@example.com', 'Nashik', '2025-07-04 11:30:00', 'Male'),
(92, 'Guest 92', '9000000092', 'guest92@example.com', 'Nagpur', '2025-07-04 11:45:00', 'Female'),
(93, 'Guest 93', '9000000093', 'guest93@example.com', 'Pune', '2025-07-04 12:00:00', NULL),
(94, 'Guest 94', '9000000094', 'guest94@example.com', 'Mumbai', '2025-07-04 12:15:00', 'Male'),
(95, 'Guest 95', '9000000095', 'guest95@example.com', 'Nashik', '2025-07-04 12:30:00', NULL),
(96, 'Guest 96', '9000000096', 'guest96@example.com', 'Nagpur', '2025-07-04 12:45:00', 'Female'),
(97, 'Guest 97', '9000000097', 'guest97@example.com', 'Pune', '2025-07-04 13:00:00', 'Male'),
(98, 'Guest 98', '9000000098', 'guest98@example.com', 'Mumbai', '2025-07-04 13:15:00', NULL),
(99, 'Guest 99', '9000000099', 'guest99@example.com', 'Nashik', '2025-07-04 13:30:00', 'Female'),
(100, 'Guest 100', '9000000100', 'guest100@example.com', 'Nagpur', '2025-07-04 13:45:00', NULL);

SELECT COUNT(*) AS total_guests
FROM Guests;

INSERT INTO Services
(service_id, service_name, service_price)
VALUES
(16, 'Valet Parking', 300.00),
(17, 'Conference Room', 2500.00),
(18, 'Pet Care', 600.00),
(19, 'Car Rental', 2200.00),
(20, 'Yoga Session', 500.00),
(21, 'Doctor on Call', 1000.00),
(22, 'Guided Trek', 1800.00),
(23, 'Kids Play Area', 200.00),
(24, 'Candlelight Dinner', 2500.00),
(25, 'Mini Bar', 750.00),
(26, 'Luggage Storage', 150.00),
(27, 'Shuttle Service', 400.00),
(28, 'Movie Night', 350.00),
(29, 'Birthday Decoration', 3000.00),
(30, 'Business Center', 800.00);

SELECT COUNT(*) AS total_services
FROM Services;

SELECT
    MIN(booking_id) AS first_booking_id,
    MAX(booking_id) AS highest_booking_id,
    COUNT(*) AS total_bookings
FROM Bookings;

INSERT INTO Bookings
    (booking_id, guest_id, room_id,
     check_in_date, check_out_date, booking_status)
WITH RECURSIVE booking_numbers AS (
    SELECT 16 AS id
    UNION ALL
    SELECT id + 1
    FROM booking_numbers
    WHERE id < 150
)
SELECT
    id,
    MOD(id - 1, 100) + 1,
    MOD(id - 1, 50) + 1,
    DATE_ADD('2026-11-01', INTERVAL (id - 16) DAY),
    DATE_ADD(
        DATE_ADD('2026-11-01', INTERVAL (id - 16) DAY),
        INTERVAL (2 + MOD(id, 3)) DAY
    ),
    CASE
        WHEN MOD(id, 10) = 0 THEN 'Cancelled'
        WHEN MOD(id, 10) = 1 THEN 'Checked-Out'
        ELSE 'Confirmed'
    END
FROM booking_numbers;

SELECT COUNT(*) AS total_bookings
FROM Bookings;

select * from Bookings;

SELECT COUNT(*) AS total_bookings
FROM Bookings;

SELECT *
FROM Bookings
ORDER BY booking_id DESC
LIMIT 10;

SELECT COUNT(*) AS total_payments
FROM Payments;

INSERT INTO Payments
    (payment_id, booking_id, payment_date, amount,
     payment_method, payment_status)
WITH RECURSIVE payment_numbers AS (
    SELECT 16 AS id
    UNION ALL
    SELECT id + 1
    FROM payment_numbers
    WHERE id < 150
)
SELECT
    id,
    id,
    DATE_ADD('2026-11-01', INTERVAL (id - 16) DAY),
    CASE
        WHEN MOD(id, 10) = 0 THEN 0.00
        ELSE 3000 + MOD(id * 137, 20000)
    END,
    CASE
        WHEN MOD(id, 3) = 0 THEN 'UPI'
        WHEN MOD(id, 3) = 1 THEN 'Card'
        ELSE 'Cash'
    END,
    CASE
        WHEN MOD(id, 10) = 0 THEN 'Refunded'
        WHEN MOD(id, 4) = 0 THEN 'Pending'
        ELSE 'Completed'
    END
FROM payment_numbers;

SELECT COUNT(*) AS total_payments
FROM Payments;

INSERT INTO Booking_Services
    (booking_service_id, booking_id, service_id, quantity)
WITH RECURSIVE service_numbers AS (
    SELECT 21 AS id
    UNION ALL
    SELECT id + 1
    FROM service_numbers
    WHERE id < 200
)
SELECT
    id,
    MOD(id - 21, 135) + 16,
    MOD(id * 7, 30) + 1,
    MOD(id, 3) + 1
FROM service_numbers;

SELECT COUNT(*) AS total_booking_services
FROM Booking_Services;

SELECT 'Guests' AS table_name, COUNT(*) AS total_rows FROM Guests
UNION ALL
SELECT 'Rooms', COUNT(*) FROM Rooms
UNION ALL
SELECT 'Bookings', COUNT(*) FROM Bookings
UNION ALL
SELECT 'Payments', COUNT(*) FROM Payments
UNION ALL
SELECT 'Services', COUNT(*) FROM Services
UNION ALL
SELECT 'Booking_Services', COUNT(*) FROM Booking_Services;

use HotelManagementDB;

USE HotelManagementDB;

-- Q1. Retrieve all available rooms priced at ₹3,000 or less per night.
select room_number, room_type, price_per_night, room_status
from Rooms
where room_status = 'Available'
and price_per_night <= 3000;

-- Q2. Retrieve all Single rooms or rooms priced above ₹5,000 per night.
select room_number, room_type, price_per_night
from Rooms
where room_type = 'Single'
or price_per_night > 5000;

-- Q3. Retrieve the 5 most expensive rooms, sorted by price in descending order.
select room_number, room_type, price_per_night
from Rooms
order by price_per_night desc
limit 5;

-- Q4. Calculate the minimum, maximum, and average price for each room type.
select room_type,
min(price_per_night) as minimum_price,
max(price_per_night) as maximum_price,
avg(price_per_night) as average_price
from Rooms
group by room_type;

-- Q5. Retrieve room types with an average price greater than ₹3,000 per night.
select room_type,
avg(price_per_night) as average_price
from Rooms
group by room_type
having avg(price_per_night) > 3000;

-- Q6. Count the number of rooms available in each room type.
select room_type,
count(*) as available_rooms
from Rooms
where room_status = 'Available'
group by room_type;

-- Q7. Count the total number of guests in each city.
select city,
count(*) as total_guests
from Guests
group by city
order by total_guests desc;

-- Q8. Count bookings by booking status and display the highest count first.
select booking_status,
count(*) as total_bookings
from Bookings
group by booking_status
order by total_bookings desc;

-- Q9. Calculate the total payment amount for each payment status.
select payment_status,
sum(amount) as total_amount
from Payments
group by payment_status
order by total_amount desc;

-- Q10. Retrieve the list of unique cities represented by hotel guests.
select distinct city 
from Guests
order by city asc;

-- Q11. Retrieve guest names and booking statuses for existing bookings.
select Guests.guest_name, Bookings.booking_status
from Guests
inner join Bookings
on Guests.guest_id = Bookings.guest_id;

 -- Q12. Identify guests who have made more than one booking.
 select Guests.guest_id, Guests.guest_name, 
 count(Bookings.booking_id)as total_bookings
 from Guests
 inner join Bookings
 on Guests.guest_id = Bookings.guest_id
 group by
 Guests.guest_id,
 Guests.guest_name
 having count(Bookings.booking_id) > 1
 order by total_bookings desc;
 
 -- Q13. Retrieve booking statuses and their associated payment amounts.
 select Bookings.booking_id, Bookings.booking_status, Payments.amount
 from Bookings
 inner join Payments
 on Bookings.booking_id = Payments.booking_id;
 
 -- Q14. Retrieve bookings with completed payments and their payment amounts.
 select Bookings.booking_id, Bookings.booking_status, Payments.amount, Payments.payment_status
 from Bookings
 inner join Payments
 on Bookings.booking_id = Payments.booking_id
 where Payments.payment_status = 'Completed';
 
 -- Q15. Retrieve all guests and their booking details, including guests without bookings.
 select Guests.guest_id, Guests.guest_name, Bookings.booking_id, Bookings.booking_status
 from Guests
 left join Bookings
 on Guests.guest_id = Bookings.guest_id
 order by Guests.guest_id;
 
 use HotelManagementDB;
 
 -- Q16. Categorize rooms based on their nightly prices.
 select room_number, room_type, price_per_night,
 case
     when price_per_night < 2000 then 'Budget'
     when price_per_night <= 4000 then 'Standard'
else 'Premium'
end as price_category
from Rooms
order by price_per_night;

-- Q17. Count the number of rooms for each room status.
select room_status,
count(*) as total_rooms
from Rooms
group by room_status
order by total_rooms desc;

-- Q18. Count the number of bookings made by guests from each city.
select Guests.city,
count(Bookings.booking_id) as total_bookings
from Guests
inner join Bookings
on Guests.guest_id = Bookings.guest_id
group by Guests.city
order by total_bookings desc;

-- Q19. Find room types with a combined nightly price above ₹20,000.
select room_type,
sum(price_per_night) as total_nightly_price
from Rooms
group by room_type
having sum(price_per_night) > 20000
order by total_nightly_price desc;

-- Q20. Identify cities with more than five hotel bookings.
select Guests.city,
count(Bookings.booking_id) as total_bookings
from Guests
inner join Bookings
on Guests.guest_id = Bookings.guest_id
group by Guests.city
having count(Bookings.booking_id) > 5
order by total_bookings desc;

-- Q21. Find rooms priced above the overall average nightly price.
select room_number, room_type, price_per_night
from Rooms
where price_per_night > (
select avg(price_per_night) from Rooms
)
order by price_per_night desc;

-- Q22. Find rooms priced above their own room type's average price.

select R1.room_number, R1.room_type, R1.price_per_night
from Rooms as R1
where R1.price_per_night > (
select avg(R2.price_per_night) from Rooms as R2
)
order by R1.room_type, R1.price_per_night desc;

-- Q23. Find guests who have made the maximum number of bookings.
select G.guest_id, G.guest_name,
count(B.booking_id) as total_bookings
from Guests as G
inner join Bookings as B
on G.guest_id = B.guest_id
group by G.guest_id, G.guest_name
having count(B.booking_id) = (
select max(booking_count)
from (
select count(*) as booking_count
from Bookings
group by guest_id) as BookingCounts
)
order by total_bookings desc;

-- Q24. Find rooms priced above the average price of Deluxe rooms.
select room_number, room_type, price_per_night
from Rooms
where price_per_night >(
select avg(price_per_night)
from Rooms
where room_type = 'Deluxe'
)
order by price_per_night desc;


-- Q25. Find bookings with payments above the average payment amount.
select booking_id, amount, payment_status
from Payments
where amount > (
select avg(amount)
from payments
)
order by amount desc;
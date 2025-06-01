CREATE DATABASE Ola;
USE Ola;
select count(*) from bookings;
select * from bookings;

--  1. Retrieve all successful bookings:
Create view Successful_bookings AS 
SELECT * FROM bookings WHERE Booking_Status = 'Success';

--  1. Retrieve all successful bookings:
SELECT * FROM Successful_bookings;   -- ans to share

 -- 2. Find the average ride distance for each vehicle type:
 Create view Avg_ride_distance_for_vehicle as
 SELECT Vehicle_Type, AVG (Ride_Distance) as Avg_Distance from bookings GROUP BY Vehicle_Type;

SELECT * FROM Avg_ride_distance_for_vehicle;   -- ans to share
 
--  3. Get the total number of cancelled rides by customers:
create view Cancelled_rides_by_customers as
SELECT count(*) FROM bookings WHERE Booking_Status = 'Canceled by Customer';

SELECT * FROM Cancelled_rides_by_customers;   -- ans to share

--  4. List the top 5 customers who booked the highest number of rides:
create view Top_5_customers as
SELECT Customer_ID, count( Booking_ID) as total_rides
FROM bookings
GROUP BY Customer_ID
order by Total_rides DESC limit 5;

SELECT * FROM Top_5_customers;   -- ans to share

--  5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view Rides_cancelled_by_drivers_P_C_issues as
select count(*) from bookings 
where Cancelled_Rides_by_Driver =  'Personal and Car related issues';

SELECT * FROM Rides_cancelled_by_drivers_P_C_issues;   -- ans to share


--  6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view Min_max_driver_ratings_for_Prime_Sedan as
select max(Driver_Ratings) as max_rating, 
min(Driver_Ratings) as min_rating
from bookings
where Vehicle_Type = 'Prime Sedan';

SELECT * FROM Min_max_driver_ratings_for_Prime_Sedan;   -- ans to share

--  7. Retrieve all rides where payment was made using UPI:
create view UPI_Payment as
select * from bookings 
where Payment_Method = 'UPI';

SELECT * FROM UPI_Payment;   -- ans to share

--  8. Find the average customer rating per vehicle type:
create view Avg_customer_rating_per_vehicle as
select Vehicle_Type, avg(Customer_Rating) as avg_customer_rating
from bookings
group by Vehicle_Type;

SELECT * FROM Avg_customer_rating_per_vehicle;   -- ans to share

--  9. Calculate the total booking value of rides completed successfully:
create view Total_successful_ride_value as
select sum(Booking_Value) as total_successful_value
from bookings
where Booking_Status = 'Success';

SELECT * FROM Total_successful_ride_value;   -- ans to share

--  10. List all incomplete rides along with the reason:
create view Incomplete_rides_with_reason as
select Booking_ID, Incomplete_Rides_Reason from bookings 
where Incomplete_Rides = 'Yes';

SELECT * FROM Incomplete_rides_with_reason;   -- ans to share

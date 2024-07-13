-- USE hotel_reservation_dataset

-- Q1 : What is the total number of reservations in the dataset?
-- SELECT COUNT(*) AS total_reservations
-- FROM hotel_reservation_dataset;

-- Q2 : Which meal plan is most popular among guests?
-- SELECT type_of_meal_plan, COUNT(*) AS plan_count
-- FROM hotel_reservation_dataset
-- GROUP BY type_of_meal_plan
-- LIMIT 1;

-- Q3 : What is the average price per room for reservations involving children?
-- SELECT AVG(avg_price_per_room) AS avg_price_with_children
-- FROM hotel_reservation_dataset
-- WHERE no_of_children > 0;

-- Q4 : How many reservations were made for the year 20XX (replace XX with the desired year)?
-- SELECT EXTRACT(YEAR FROM arrival_date) AS reservation_year, COUNT(*) AS reservation_count
-- FROM hotel_reservation_dataset
-- GROUP BY reservation_year;

-- Q5 : What is the most commonly booked room type?
-- SELECT room_type_reserved, count(*) AS room_count
-- FROM hotel_reservation_dataset
-- GROUP BY room_type_reserved

-- Q6 : How many reservations fall on a weekend (no_of_weekend_nights > 0)?
-- SELECT COUNT(*) AS weekend_reservations FROM hotel_reservation_dataset
-- WHERE no_of_weekend_nights > 0;

-- Q7 : What is the highest and lowest lead time for reservations?
-- SELECT 
--   MAX(lead_time) AS highest_lead_time,
--   MIN(lead_time) AS lowest_lead_time
-- FROM hotel_reservation_dataset;

-- Q8 : What is the most common market type for reservations?
-- SELECT market_segment_type, COUNT(*) AS segment_count
-- FROM hotel_reservation_dataset
-- GROUP BY market_segment_type
-- ORDER BY segment_count DESC

-- Q9 : How many reservations have a booking status of "Confirmed"?
-- SELECT COUNT(*) AS confirmed_reservations
-- FROM hotel_reservation_dataset
-- WHERE booking_status = 'Not_Canceled';

-- Q10 : What is the total number of adults and children across all reservations?
-- SELECT 
--   SUM(no_of_adults) AS total_adults,
--   SUM(no_of_children) AS total_children
-- FROM hotel_reservation_dataset;

-- Q11 : What is the average number of weekend nights for reservations involving children?
-- SELECT AVG(no_of_weekend_nights) AS avg_weekend_nights_with_children
-- FROM hotel_reservation_dataset
-- WHERE no_of_children > 0;

-- Q12 :  How many reservations were made in each month of the year?
-- SELECT month(arrival_date) AS Month, COUNT(*) AS Reservations
-- FROM hotel_reservation_dataset
-- GROUP BY Month
-- ORDER BY Month;

-- SELECT 
--   MONTH(arrival_date) AS Month,
--   MONTHNAME(arrival_date) AS MonthName,
--   SUM(CASE WHEN YEAR(arrival_date) = 2017 THEN 1 ELSE 0 END) AS 2017_reservations,
--   SUM(CASE WHEN YEAR(arrival_date) = 2018 THEN 1 ELSE 0 END) AS 2018_reservations
-- FROM hotel_reservation_dataset
-- GROUP BY MonthName, Month
-- ORDER BY Month;

-- Q13 : What is the average number of nights (both weekend and weekday) spent by guests for each room type?
-- SELECT room_type_reserved,
-- AVG(no_of_week_nights + no_of_weekend_nights) AS Avg_Total_Nights
-- FROM hotel_reservation_dataset
-- GROUP BY room_type_reserved
-- ORDER BY room_type_reserved;

-- Q14 : For reservations involving children, what is the most common room type, and what is the average price for that room type?
-- SELECT room_type_reserved, COUNT(*) AS room_count,
-- ROUND(AVG(avg_price_per_room),2) AS Avg_Price
-- FROM hotel_reservation_dataset
-- WHERE no_of_children > 0
-- GROUP BY room_type_reserved
-- ORDER BY room_count DESC
-- LIMIT 1;

-- Q15 : Find the market segment type that generates the highest average price per room.
-- SELECT market_segment_type AS Market_Segment,
-- ROUND(AVG(avg_price_per_room),2) AS Avg_Price
-- FROM hotel_reservation_dataset
-- GROUP BY Market_Segment
-- ORDER BY Avg_Price DESC
-- LIMIT 1;

-- SELECT 
--     arrival_date,
--     CASE
--         WHEN arrival_date LIKE '%/%/%' THEN DATE_FORMAT(STR_TO_DATE(arrival_date, '%d/%m/%Y'), '%d-%m-%Y')
--         WHEN arrival_date LIKE '%-%-%' THEN DATE_FORMAT(STR_TO_DATE(arrival_date, '%d-%m-%Y'), '%d-%m-%Y')
--         ELSE arrival_date
--     END AS formatted_date
-- FROM hotel_reservation_dataset;
-- SET SQL_SAFE_UPDATES = 0;
-- UPDATE hotel_reservation_dataset
-- SET arrival_date = CASE
--     WHEN arrival_date LIKE '%/%/%' THEN DATE_FORMAT(STR_TO_DATE(arrival_date, '%d/%m/%Y'), '%d-%m-%Y')
--     WHEN arrival_date LIKE '%-%-%' THEN DATE_FORMAT(STR_TO_DATE(arrival_date, '%d-%m-%Y'), '%d-%m-%Y')
--     ELSE arrival_date
-- END;

-- SELECT COLUMN_NAME, DATA_TYPE, COLUMN_TYPE
-- FROM INFORMATION_SCHEMA.COLUMNS
-- WHERE TABLE_NAME = 'hotel_reservation_dataset'
-- AND COLUMN_NAME = 'arrival_date';
-- SET SQL_SAFE_UPDATES= 0;
-- ALTER TABLE hotel_reservation_dataset ADD temp_date DATE;

-- UPDATE hotel_reservation_dataset
-- SET temp_date = CASE
--     WHEN arrival_date LIKE '%/%/%' THEN STR_TO_DATE(arrival_date, '%d/%m/%Y')
--     WHEN arrival_date LIKE '%-%-%' THEN STR_TO_DATE(arrival_date, '%d-%m-%Y')
--     ELSE NULL
-- END;

-- SELECT arrival_date, temp_date
-- FROM hotel_reservation_dataset;

-- ALTER TABLE hotel_reservation_dataset DROP COLUMN temp_date;

-- ALTER TABLE hotel_reservation_dataset CHANGE COLUMN temp_date arrival_date DATE;

-- DESCRIBE hotel_reservation_dataset;

-- SELECT arrival_date FROM hotel_reservation_dataset LIMIT 10;



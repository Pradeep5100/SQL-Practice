create database swiggy;
use swiggy;
create table RESTAURANTS(
RESTAURANT_ID INT primary key auto_increment,
RESTAURANT_NAME VARCHAR(100),
LOCATION VARCHAR(100),
RATING FLOAT,
TOTAL_ORDERS INT
);

drop table RESTAURANTS;

create table CUSTOMERS(
CUSTOMER_ID INT primary key auto_increment,
CUSTOMER_NAME VARCHAR(100),
CITY VARCHAR(100),
PHONE_NUMBER VARCHAR(15)
);

create table ORDERS(
ORDER_ID INT primary key auto_increment,
CUSTOMER_ID INT,
RESTAURANT_ID INT,
ORDER_AMOUNT DECIMAL(10,2),
ORDER_STATUS VARCHAR(50),
ORDER_DATE DATE,
foreign key (CUSTOMER_ID) references CUSTOMERS(CUSTOMER_ID),
foreign key (RESTAURANT_ID) references RESTAURANTS(RESTAURANT_ID)
);

select * from ORDERS;

CREATE TABLE DELIVERY_PARTNERS(
PARTNER_ID INT PRIMARY KEY AUTO_INCREMENT,
PARTNER_NAME VARCHAR(50),
VEHICLE_TYPE VARCHAR(30),
DELIVERY_RATING FLOAT);

INSERT INTO RESTAURANTS
(RESTAURANT_NAME, LOCATION, RATING, TOTAL_ORDERS)
VALUES
('A2B', 'Chennai', 4.5, 1200),
('Sangeetha', 'Tambaram', 4.2, 950),
('Anjappar', 'Chengalpattu', 4.3, 800),
('Burger King', 'Velachery', 4.1, 1500),
('Dominos', 'OMR', 4.4, 1800);

INSERT INTO CUSTOMERS
(CUSTOMER_NAME, CITY, PHONE_NUMBER)
VALUES
('Roshan', 'Chengalpattu', '9876543210'),
('Arun', 'Chennai', '9876543211'),
('Karthik', 'Tambaram', '9876543212'),
('Priya', 'Velachery', '9876543213'),
('Divya', 'OMR', '9876543214');


INSERT INTO ORDERS
(CUSTOMER_ID, RESTAURANT_ID, ORDER_AMOUNT, ORDER_STATUS, ORDER_DATE)
VALUES
(1, 1, 250.00, 'Delivered', '2022-03-15'),
(2, 2, 450.00, 'Delivered', '2022-07-20'),
(3, 3, 180.00, 'Cancelled', '2023-01-10'),
(4, 4, 550.00, 'Delivered', '2023-06-25'),
(5, 5, 320.00, 'Delivered', '2023-12-05'),
(1, 2, 600.00, 'Delivered', '2024-02-14'),
(2, 3, 150.00, 'Pending', '2024-09-18'),
(3, 4, 750.00, 'Delivered', '2025-04-22'),
(4, 5, 400.00, 'Cancelled', '2025-11-11'),
(5, 1, 850.00, 'Delivered', '2026-10-15');

INSERT INTO DELIVERY_PARTNERS
(PARTNER_NAME, VEHICLE_TYPE, DELIVERY_RATING)
VALUES
('Vijay', 'Bike', 4.5),
('Ajith', 'Scooter', 4.2),
('Surya', 'Bike', 4.8),
('Kamal', 'Electric Bike', 4.6),
('Dhanush', 'Scooter', 4.3);


SELECT * FROM RESTAURANTS;

SELECT * FROM CUSTOMERS;

SELECT * FROM ORDERS;

SELECT * FROM DELIVERY_PARTNERS;


select NOW();
select CURDATE();
select CURTIME(); 
select YEAR(now());
select MONTH(now());
select DAY(now());
select HOUR(now());
select MINUTE(now()); 
select SECOND(now());
select DATE(now());
select TIME(now());
SELECT DATEDIFF(now(),'2022-03-15');
SELECT TIMEDIFF(now(),'10:15:00');
SELECT TIMESTAMPDIFF(YEAR,'2022-03-15','2026-11-25');
select DATE_FORMAT();


SELECT ORDER_ID, ORDER_DATE,
YEAR(ORDER_DATE) AS ORDER_YEAR
FROM ORDERS;

SELECT ORDER_ID, ORDER_DATE,
MONTH(ORDER_DATE) AS ORDER_MONTH
FROM ORDERS;

SELECT ORDER_ID, ORDER_DATE,
DAY(ORDER_DATE) AS ORDER_DAY
FROM ORDERS;

SELECT *
FROM ORDERS
WHERE YEAR(ORDER_DATE) = 2025;

SELECT *
FROM ORDERS
WHERE MONTH(ORDER_DATE) = 1;

SELECT *
FROM ORDERS
WHERE YEAR(ORDER_DATE) >= 2024;

SELECT ORDER_ID, ORDER_DATE,
DATEDIFF(CURDATE(), ORDER_DATE) AS DAYS_SINCE_ORDER
FROM ORDERS;

SELECT ORDER_ID, ORDER_DATE,
TIMESTAMPDIFF(YEAR, ORDER_DATE, CURDATE()) AS YEARS_SINCE_ORDER
FROM ORDERS;

SELECT ORDER_ID, ORDER_DATE,
TIMESTAMPDIFF(MONTH, ORDER_DATE, CURDATE()) AS MONTHS_SINCE_ORDER
FROM ORDERS;

SELECT ORDER_ID, ORDER_DATE,
DATEDIFF(CURDATE(), ORDER_DATE) AS DATE_DIFFERENCE
FROM ORDERS;


USE SWIGGY;

-- 1. Calculate days between two dates
SELECT DATEDIFF('2025-12-31', '2025-01-01') AS TOTAL_DAYS;


-- 2. Days passed since each order
SELECT ORDER_ID, ORDER_DATE,
DATEDIFF(CURDATE(), ORDER_DATE) AS DAYS_PASSED
FROM ORDERS;


-- 3. Months passed since each order
SELECT ORDER_ID, ORDER_DATE,
TIMESTAMPDIFF(MONTH, ORDER_DATE, CURDATE()) AS MONTHS_PASSED
FROM ORDERS;


-- 4. Years passed since each order
SELECT ORDER_ID, ORDER_DATE,
TIMESTAMPDIFF(YEAR, ORDER_DATE, CURDATE()) AS YEARS_PASSED
FROM ORDERS;


-- 5. Difference in days between oldest and newest orders
SELECT DATEDIFF(MAX(ORDER_DATE), MIN(ORDER_DATE)) AS DATE_DIFFERENCE
FROM ORDERS;

-- 1. Display dates in DD-MM-YYYY format
SELECT ORDER_ID,
DATE_FORMAT(ORDER_DATE, '%d-%m-%Y') AS FORMATTED_DATE
FROM ORDERS;


-- 2. Display dates in DD-Month-YYYY format
SELECT ORDER_ID,
DATE_FORMAT(ORDER_DATE, '%d-%M-%Y') AS FORMATTED_DATE
FROM ORDERS;


-- 3. Display dates with weekday names
SELECT ORDER_ID,
DATE_FORMAT(ORDER_DATE, '%W %d-%M-%Y') AS ORDER_DAY
FROM ORDERS;


-- 4. Display dates in YYYY/MM/DD format
SELECT ORDER_ID,
DATE_FORMAT(ORDER_DATE, '%Y/%m/%d') AS FORMATTED_DATE
FROM ORDERS;


-- 5. Display month name and year
SELECT ORDER_ID,
DATE_FORMAT(ORDER_DATE, '%M %Y') AS MONTH_YEAR
FROM ORDERS;


-- 6. Display dates in DD/MM/YYYY format
SELECT ORDER_ID,
DATE_FORMAT(ORDER_DATE, '%d/%m/%Y') AS FORMATTED_DATE
FROM ORDERS;


-- 7. Display full weekday names
SELECT ORDER_ID,
DATE_FORMAT(ORDER_DATE, '%W') AS WEEKDAY_NAME
FROM ORDERS;


-- 8. Display short month names
SELECT ORDER_ID,
DATE_FORMAT(ORDER_DATE, '%b') AS MONTH_NAME
FROM ORDERS;


-- 9. Difference between oldest and newest orders in months
SELECT TIMESTAMPDIFF(MONTH, MIN(ORDER_DATE), MAX(ORDER_DATE))
AS MONTH_DIFFERENCE
FROM ORDERS;

USE SWIGGY;

-- 1. Display order dates in DD-MM-YYYY format
SELECT ORDER_ID,
DATE_FORMAT(ORDER_DATE, '%d-%m-%Y') AS FORMATTED_DATE
FROM ORDERS;


-- 2. Display order dates in DD/MM/YYYY format
SELECT ORDER_ID,
DATE_FORMAT(ORDER_DATE, '%d/%m/%Y') AS FORMATTED_DATE
FROM ORDERS;


-- 3. Display the full month name for every order
SELECT ORDER_ID,
DATE_FORMAT(ORDER_DATE, '%M') AS MONTH_NAME
FROM ORDERS;


-- 4. Display the full weekday name for every order
SELECT ORDER_ID,
DATE_FORMAT(ORDER_DATE, '%W') AS WEEKDAY_NAME
FROM ORDERS;


-- 5. Display order ID and order date in the format 15 August 2025
SELECT ORDER_ID,
DATE_FORMAT(ORDER_DATE, '%d %M %Y') AS FORMATTED_DATE
FROM ORDERS;


-- 6. Display order ID and month and year in the format August 2025
SELECT ORDER_ID,
DATE_FORMAT(ORDER_DATE, '%M %Y') AS MONTH_YEAR
FROM ORDERS;


-- 7. Display order ID and date in the format 15-08-2025
SELECT ORDER_ID,
DATE_FORMAT(ORDER_DATE, '%d-%m-%Y') AS FORMATTED_DATE
FROM ORDERS;


-- 8. Display order date with full month name and weekday
SELECT ORDER_ID,
DATE_FORMAT(ORDER_DATE, '%W, %d %M %Y') AS FORMATTED_DATE
FROM ORDERS;

USE SWIGGY;

-- 1. Display customer name and city together
SELECT CONCAT(CUSTOMER_NAME, ' - ', CITY) AS CUSTOMER_DETAILS
FROM CUSTOMERS;


-- 2. Display restaurant name and location together
SELECT CONCAT(RESTAURANT_NAME, ' - ', LOCATION) AS RESTAURANT_DETAILS
FROM RESTAURANTS;


-- 3. Display customer name and phone number together
SELECT CONCAT(CUSTOMER_NAME, ' - ', PHONE_NUMBER) AS CUSTOMER_CONTACT
FROM CUSTOMERS;


-- 4. Display delivery partner name and vehicle type together
SELECT CONCAT(PARTNER_NAME, ' - ', VEHICLE_TYPE) AS PARTNER_DETAILS
FROM DELIVERY_PARTNERS;


-- 5. Display restaurant name and rating together
SELECT CONCAT(RESTAURANT_NAME, ' - Rating: ', RATING) AS RESTAURANT_RATING
FROM RESTAURANTS;

USE SWIGGY;

-- 1. Display all customer names in uppercase
SELECT UPPER(CUSTOMER_NAME) AS CUSTOMER_NAME
FROM CUSTOMERS;


-- 2. Display all customer names in lowercase
SELECT LOWER(CUSTOMER_NAME) AS CUSTOMER_NAME
FROM CUSTOMERS;


-- 3. Display all restaurant names in uppercase
SELECT UPPER(RESTAURANT_NAME) AS RESTAURANT_NAME
FROM RESTAURANTS;


-- 4. Display all restaurant locations in lowercase
SELECT LOWER(LOCATION) AS RESTAURANT_LOCATION
FROM RESTAURANTS;


-- 5. Display delivery partner names in uppercase
SELECT UPPER(PARTNER_NAME) AS PARTNER_NAME
FROM DELIVERY_PARTNERS;

USE SWIGGY;

-- =====================================
-- C. REPLACE()
-- =====================================

-- 1. Replace Chennai with Madras in customer records
SELECT CUSTOMER_NAME,
REPLACE(CITY, 'Chennai', 'Madras') AS UPDATED_CITY
FROM CUSTOMERS;

-- 2. Replace Bike with Two Wheeler in vehicle type
SELECT PARTNER_NAME,
REPLACE(VEHICLE_TYPE, 'Bike', 'Two Wheeler') AS UPDATED_VEHICLE
FROM DELIVERY_PARTNERS;

-- 3. Replace Kochi with Cochin in restaurant location
SELECT RESTAURANT_NAME,
REPLACE(LOCATION, 'Kochi', 'Cochin') AS UPDATED_LOCATION
FROM RESTAURANTS;

-- 4. Replace Pending with Processing in order status
SELECT ORDER_ID,
REPLACE(ORDER_STATUS, 'Pending', 'Processing') AS UPDATED_STATUS
FROM ORDERS;

-- 5. Replace Pizza with Burger in restaurant names
SELECT REPLACE(RESTAURANT_NAME, 'Pizza', 'Burger') AS UPDATED_RESTAURANT
FROM RESTAURANTS;


-- =====================================
-- D. TRIM()
-- =====================================

-- 1. Remove leading and trailing spaces
SELECT TRIM(' SWIGGY ONLINE FOOD ') AS CLEAN_TEXT;

-- 2. Remove unwanted spaces from customer names
SELECT CUSTOMER_NAME,
TRIM(CUSTOMER_NAME) AS CLEAN_NAME
FROM CUSTOMERS;

-- 3. Remove unwanted spaces from restaurant names
SELECT RESTAURANT_NAME,
TRIM(RESTAURANT_NAME) AS CLEAN_RESTAURANT
FROM RESTAURANTS;


-- =====================================
-- E. LPAD() AND RPAD()
-- =====================================

-- 1. Customer IDs padded with zeros on the left
SELECT CUSTOMER_ID,
LPAD(CUSTOMER_ID, 5, '0') AS PADDED_CUSTOMER_ID
FROM CUSTOMERS;

-- 2. Restaurant IDs padded with * on the left
SELECT RESTAURANT_ID,
LPAD(RESTAURANT_ID, 6, '*') AS PADDED_RESTAURANT_ID
FROM RESTAURANTS;

-- 3. Customer names padded with # on the right
SELECT CUSTOMER_NAME,
RPAD(CUSTOMER_NAME, 15, '#') AS PADDED_NAME
FROM CUSTOMERS;

-- 4. Delivery partner names padded with - on the left
SELECT PARTNER_NAME,
LPAD(PARTNER_NAME, 20, '-') AS PADDED_PARTNER_NAME
FROM DELIVERY_PARTNERS;


-- =====================================
-- F. SUBSTRING()
-- =====================================

-- 1. First 3 characters of customer names
SELECT CUSTOMER_NAME,
SUBSTRING(CUSTOMER_NAME, 1, 3) AS FIRST_THREE_CHARACTERS
FROM CUSTOMERS;

-- 2. First 4 characters of restaurant names
SELECT RESTAURANT_NAME,
SUBSTRING(RESTAURANT_NAME, 1, 4) AS FIRST_FOUR_CHARACTERS
FROM RESTAURANTS;

-- 3. First 5 digits of customer phone numbers
SELECT CUSTOMER_NAME,
SUBSTRING(PHONE_NUMBER, 1, 5) AS FIRST_FIVE_DIGITS
FROM CUSTOMERS;

-- 4. Last 4 characters of customer phone numbers
SELECT CUSTOMER_NAME,
SUBSTRING(PHONE_NUMBER, -4) AS LAST_FOUR_DIGITS
FROM CUSTOMERS;

-- 5. First 3 characters of delivery partner names
SELECT PARTNER_NAME,
SUBSTRING(PARTNER_NAME, 1, 3) AS FIRST_THREE_CHARACTERS
FROM DELIVERY_PARTNERS;

-- 6. Second, third and fourth characters of restaurant names
SELECT RESTAURANT_NAME,
SUBSTRING(RESTAURANT_NAME, 2, 3) AS EXTRACTED_CHARACTERS
FROM RESTAURANTS;
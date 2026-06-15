
create database football_ticket_booking_system;



-- =========================================================================
-- SYSTEM: Football Ticket Booking System Database Setup Template
-- DESCRIPTION: Pseudo-DDL Template for Table Creation & Data Insertion
-- INSTRUCTIONS: Replace 'TYPE' and the constraint placeholders with your own
--               actual data types, relational keys, and check criteria.
-- =========================================================================

-- DROP TABLES IF THEY ALREADY EXIST TO PREVENT CONFLICTS
DROP TABLE IF EXISTS Bookings;
DROP TABLE IF EXISTS Matches;
DROP TABLE IF EXISTS Users;

-- =========================================================================
-- 1. CREATE USERS TABLE
-- =========================================================================
CREATE TABLE Users (
    user_id int not null,
    full_name varchar(50) not null,
    email varchar(50) not null,
    role varchar(20) not null,
    phone_number varchar(20),

  constraint pk_user_id primary key(user_id),
  constraint validation_email unique(email),
  constraint chk_role check(
  role in ('Ticket Manager','Football Fan')
  )
    
    -- Write your constraint to make 'user_id' the Primary Key
    -- Write your constraint to ensure 'email' values are never duplicated
    -- Write your check constraint to restrict 'role' to specific allowed strings
);

-- =========================================================================
-- 2. CREATE MATCHES TABLE
-- =========================================================================
CREATE TABLE Matches (
    match_id int not null,
    fixture varchar(50) not null,
    tournament_category varchar(50) not null,
    base_ticket_price int not null,
    match_status varchar(50) not null,

  constraint pk_match_id primary key(match_id),
  constraint chk_negative_price check(
  base_ticket_price >=0
  ),
  constraint chk_match_status check(
  match_status in ('Available', 'Selling Fast', 'Sold Out', 'Postponed')
  )
    
    -- Write your constraint to make 'match_id' the Primary Key
    -- Write your check constraint to prevent negative ticket prices
    -- Write your check constraint to restrict 'match_status' values
);

-- =========================================================================
-- 3. CREATE BOOKINGS TABLE
-- =========================================================================
CREATE TABLE Bookings (
    booking_id int not null,
    user_id int not null,
    match_id int not null,
    seat_number varchar(20),
    payment_status varchar(20),
    total_cost int not null,

  constraint pk_bookings_id primary key(booking_id),
  constraint fk_user_id foreign key(user_id) references users(user_id),
  constraint fk_match_id foreign key(match_id) references Matches(match_id),
  constraint chk_cost_value check(
  total_cost >= 0
  ),
  constraint chk_payment_status check (
  payment_status in ('Pending', 'Confirmed', 'Cancelled', 'Refunded')
  )
    -- Write your constraint to make 'booking_id' the Primary Key
    -- Write your Foreign Key constraint linking 'user_id' to the Users table
    -- Write your Foreign Key constraint linking 'match_id' to the Matches table
    -- Write your check constraint to ensure 'total_cost' is non-negative
    -- Write your check constraint to restrict 'payment_status' values
);


-- =========================================================================
-- DATA SEEDING: INSERT SAMPLE DATA INTO USERS
-- =========================================================================
INSERT INTO Users (user_id, full_name, email, role, phone_number) VALUES
(1, 'Tanvir Rahman', 'tanvir@mail.com', 'Football Fan', '+8801711111111'),
(2, 'Asif Haque', 'asif@mail.com', 'Football Fan', '+8801722222222'),
(3, 'Sajjad Rahman', 'sajjad@mail.com', 'Ticket Manager', '+8801733333333'),
(4, 'Jannat Ara', 'jannat@mail.com', 'Football Fan', NULL);

-- =========================================================================
-- DATA SEEDING: INSERT SAMPLE DATA INTO MATCHES
-- =========================================================================
INSERT INTO Matches (match_id, fixture, tournament_category, base_ticket_price, match_status) VALUES
(101, 'Real Madrid vs Barcelona', 'Champions League', 150, 'Available'),
(102, 'Man City vs Liverpool', 'Premier League', 120, 'Selling Fast'),
(103, 'Bayern Munich vs PSG', 'Champions League', 130, 'Available'),
(104, 'AC Milan vs Inter Milan', 'Serie A', 90, 'Sold Out'),
(105, 'Juventus vs Roma', 'Serie A', 80, 'Available');

-- =========================================================================
-- DATA SEEDING: INSERT SAMPLE DATA INTO BOOKINGS
-- =========================================================================
INSERT INTO Bookings (booking_id, user_id, match_id, seat_number, payment_status, total_cost) VALUES
(501, 1, 101, 'A-12', 'Confirmed', 150),
(502, 1, 102, 'B-04', 'Confirmed', 120),
(503, 2, 101, 'A-13', 'Confirmed', 150),
(504, 2, 101, NULL, NULL, 150),
(505, 3, 102, 'C-20', 'Pending', 120);


select * from users;
select * from bookings;
select * from matches;


---query 1
select match_id,fixture,base_ticket_price from matches 
where tournament_category = 'Champions League' and match_status = 'Available';

---query 2
select user_id,full_name,email from users 
where full_name ilike 'Tanvir%' or full_name ilike '%Haque%';

---query 3
select booking_id,user_id,match_id,
coalesce(payment_status,'Action Required') as systematic_status
from bookings 
where payment_status is null;

---query 4

select 
b.booking_id,
u.full_name,
m.fixture,
b.total_cost
from bookings b 
inner join users u on b.user_id = u.user_id
inner join matches m on b.match_id = m.match_id;

---query 5
select u.user_id,u.full_name,b.booking_id 
from users u 
left join bookings b on b.user_id = u.user_id;

---query 6
select booking_id,match_id,total_cost from bookings
where total_cost > (
  select avg(total_cost) from bookings
);

---query 7
select match_id,fixture,base_ticket_price
from matches
ORDER BY base_ticket_price DESC
limit 2 offset 1;


# ⚽ Football Ticket Booking System - Database Design & SQL

A relational database project for a **Football Ticket Booking System**, designed to demonstrate database modeling, Entity Relationship Diagram (ERD) design, and intermediate-to-advanced SQL query writing.

---

## 📖 Project Overview

This project simulates a football ticket booking platform where users can browse football matches and book tickets.

The project focuses on:

- Database Design
- Entity Relationship Diagram (ERD)
- SQL Query Writing
- Primary & Foreign Keys
- Referential Integrity
- Relational Database Concepts

---

## 🗄️ Database Schema

The database consists of **3 tables**:

### 👤 Users

Stores registered users and ticket managers.

| Field |
|-------|
| user_id (PK) |
| full_name |
| email |
| role |
| phone_number |

---

### ⚽ Matches

Stores football match information.

| Field |
|-------|
| match_id (PK) |
| fixture |
| tournament_category |
| base_ticket_price |
| match_status |

---

### 🎟️ Bookings

Stores ticket booking records.

| Field |
|-------|
| booking_id (PK) |
| user_id (FK) |
| match_id (FK) |
| seat_number |
| payment_status |
| total_cost |

---

## 🔗 Relationships

- One User ➜ Many Bookings
- Many Bookings ➜ One Match
- Each Booking belongs to exactly one User and one Match

---

## 💻 SQL Concepts Used

- SELECT
- WHERE
- LIKE
- ILIKE
- COALESCE
- NULL Handling
- INNER JOIN
- LEFT JOIN
- Aggregate Functions
- Subqueries
- ORDER BY
- LIMIT
- OFFSET

---

## 📂 Repository Structure

```
football_ticket_booking/
│
├── query.sql
└── README.md
```

---

## 🧠 Business Logic

The system supports:

- User Management
- Match Management
- Ticket Booking
- Seat Allocation
- Payment Status Tracking
- Match Availability

---

## 🛠️ Technologies Used

- PostgreSQL
- SQL
- Lucidchart (ERD)
- Git
- GitHub

---

## 📌 ERD

ERD Link:

https://lucid.app/lucidchart/24ad593c-abbd-41f5-bd3b-86290a33af7e/edit

---

## 👨‍💻 Author

**Harun Hira**

GitHub:
https://github.com/harunhira69

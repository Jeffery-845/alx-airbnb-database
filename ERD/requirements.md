requirements.md
# ER Diagram for ALX Airbnb Database Project

## Project Overview

This ERD is part of the ALX Airbnb Database Module, focusing on database design, normalization, schema creation, and seeding. It models an Airbnb-like application with users, properties, bookings, and payments, ensuring scalability, efficiency, and real-world functionality.

---

## Entities and Attributes

### 1️⃣ User
- `user_id` (PK)
- `first_name`
- `last_name`
- `email`
- `password_hash`
- `phone_number`
- `role` (ENUM: guest, host, admin)
- `created_at`
- `updated_at`

### 2️⃣ Property
- `property_id` (PK)
- `host_id` (FK referencing User.user_id)
- `name`
- `description`
- `address`
- `city`
- `state`
- `country`
- `price_per_night`
- `max_guests`
- `created_at`
- `updated_at`

### 3️⃣ Booking
- `booking_id` (PK)
- `property_id` (FK referencing Property.property_id)
- `guest_id` (FK referencing User.user_id)
- `start_date`
- `end_date`
- `total_price`
- `status` (ENUM: booked, cancelled, completed)
- `created_at`
- `updated_at`

### 4️⃣ Payment
- `payment_id` (PK)
- `booking_id` (FK referencing Booking.booking_id)
- `amount`
- `payment_date`

---

## Relationships

✅ A **User** can:
- Host multiple **Properties** (1:N).
- Make multiple **Bookings** (1:N).

✅ A **Property** can:
- Be hosted by **one User** (N:1).
- Have multiple **Bookings** (1:N).

✅ A **Booking**:
- Belongs to **one User** (guest).
- Is for **one Property**.
- Can have **one Payment** associated.

✅ A **Payment**:
- Is linked to **one Booking**.

---

## ERD Diagram

The ER Diagram visually represents these entities and their relationships.

![ERD](./erd_airbnb.png)

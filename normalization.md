# Normalization - ALX Airbnb Database Project

## Objective

To apply normalization principles to ensure the Airbnb-like database design is in **Third Normal Form (3NF)**, optimizing efficiency, reducing redundancy, and ensuring data integrity.

---

## Normalization Process

### ✅ 1NF (First Normal Form)
- Ensured **atomic values**: all columns contain single, indivisible values.
- Removed repeating groups by splitting multi-valued fields (e.g., address is separated into address, city, state, country).

---

### ✅ 2NF (Second Normal Form)
- Ensured **no partial dependencies**:
    - All non-key attributes fully depend on the table's **primary key**.
    - Since we use **single-column primary keys** (`*_id`), there are no composite keys, ensuring compliance with 2NF.

---

### ✅ 3NF (Third Normal Form)
- Ensured **no transitive dependencies**:
    - Non-key columns depend only on the primary key, not on other non-key columns.
    - Examples:
        - In `User`, fields like `first_name`, `email` depend only on `user_id`.
        - In `Property`, `price_per_night` and `address` depend only on `property_id`.
        - In `Booking`, `start_date`, `end_date`, `status`, `total_price` depend only on `booking_id`.
        - In `Payment`, `amount`, `payment_date` depend only on `payment_id`.

---

## Normalization Summary Table

| Table    | Status | Notes |
|----------|--------|-------|
| User     | ✅ 3NF | All attributes depend on `user_id` |
| Property | ✅ 3NF | All attributes depend on `property_id` |
| Booking  | ✅ 3NF | All attributes depend on `booking_id` |
| Payment  | ✅ 3NF | All attributes depend on `payment_id` |

---

## Outcome

✅ The database design:
- Is in **Third Normal Form (3NF)**.
- Eliminates redundancy.
- Optimizes for query efficiency and scalability.
- Enforces data integrity with clear foreign key relationships.

---

## Next Steps

Proceed to:
- **Task 2: Create SQL Schema Scripts** with primary keys, foreign keys, indexes, and constraints aligned with this normalized design.

---

> **Repository:** `alx-airbnb-database`  
> **File:** `normalization.md`

> **Prepared for ALX Airbnb Database Module – Task: Normalization**

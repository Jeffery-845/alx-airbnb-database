✅ Created `CREATE TABLE` statements for each entity:

* `users`
* `properties`
* `bookings`
* `payments`

✅ Ensured:

* Proper data types aligning with expected data (UUID, VARCHAR, DECIMAL, DATE, TIMESTAMP).
* Primary keys (`*_id` fields) with `UUID` for scalability and uniqueness.
* Foreign keys enforcing relational integrity.
* Constraints including `NOT NULL`, `UNIQUE`, and `CHECK` for ENUM-like fields.

✅ Created necessary indexes to optimize query performance on frequently queried columns:

* `email` (users)
* `host_id` (properties)
* `guest_id`, `property_id` (bookings)
* `booking_id` (payments)

---

### Schema Overview

#### Users Table

Stores user information for guests, hosts, and admins.

#### Properties Table

Stores details about properties listed on the platform.

#### Bookings Table

Stores reservations made by guests for properties.

#### Payments Table

Stores payment transactions linked to bookings.

---

### How to Run

1️⃣ Ensure PostgreSQL is installed and the `uuid-ossp` extension is enabled.

2️⃣ Run the schema script:

```bash
psql -U your_user -d your_database -f schema.sql
```

3️⃣ Confirm that tables are created with the correct constraints and indexes.

---

### File Structure

```
alx-airbnb-database/
└── database-script-0x01/
    ├── schema.sql
    └── README.md
```

---

### Next Steps

* Test table insertions with realistic sample data.
* Seed the database to simulate an Airbnb environment.
* Build query scripts to handle application-level data needs efficiently.

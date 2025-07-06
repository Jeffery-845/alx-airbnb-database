# README.md for database-script-0x01

## ALX Airbnb Database Project – SQL Schema

### Objective

Create SQL `CREATE TABLE` statements defining the database schema for an Airbnb-like application while ensuring proper data types, primary keys, foreign keys, constraints, and performance-optimized indexes.

### Contents

This module contains:

* `schema.sql`: Defines the `users`, `properties`, `bookings`, and `payments` tables with constraints and indexes for efficient relational data handling.

### How to Use

1. Ensure PostgreSQL is installed.
2. Enable the `uuid-ossp` extension:

   ```sql
   CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
   ```
3. Run the schema script to create tables:

   ```bash
   psql -U <username> -d <database> -f schema.sql
   ```
4. Confirm tables and indexes were created:

   ```sql
   \dt
   \di
   ```

### Key Features

✅ Uses UUID as primary keys for scalability and uniqueness.
✅ Enforces data integrity with foreign key constraints.
✅ Uses `CHECK` constraints for controlled ENUM-like fields (`role`, `status`).
✅ Indexes on frequently queried columns for optimal performance.
✅ Structured for clear relational mapping between users, properties, bookings, and payments.

### Directory Structure

```
alx-airbnb-database/
└── database-script-0x01/
    ├── schema.sql
    └── README.md
```

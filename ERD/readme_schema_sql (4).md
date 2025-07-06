# README.md for database-script-0x01

## ALX Airbnb Database Project – SQL Schema Definition

### Objective

Write SQL `CREATE TABLE` statements to define the database schema for an Airbnb-like application, ensuring:

- Proper data types.
- Primary keys and foreign keys.
- Constraints for data integrity.
- Performance-optimized indexes.

### Contents

- `schema.sql`: Contains SQL scripts to create `users`, `properties`, `bookings`, and `payments` tables with all required constraints and indexing for optimal query performance.

### Usage Instructions

1. Ensure PostgreSQL is installed and running.
2. Enable the `uuid-ossp` extension:

```sql
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
```

3. Execute the schema script:

```bash
psql -U <username> -d <database> -f schema.sql
```

4. Verify successful table and index creation:

```sql
\dt
\di
```

### Key Features

- ✅ UUID primary keys for scalability and uniqueness.
- ✅ Foreign key constraints for relational integrity.
- ✅ CHECK constraints for ENUM-like validation.
- ✅ Indexed frequently queried columns for performance.
- ✅ Clear relational design for managing users, properties, bookings, and payments efficiently.

### Repository Structure

```
alx-airbnb-database/
└── database-script-0x01/
    ├── schema.sql
    └── README.md
```

---

Prepared for **ALX Airbnb Database Module – Task: Write SQL Schema**.


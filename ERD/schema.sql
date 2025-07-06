\-- schema.sql for ALX Airbnb Database Project

\-- Enable UUID extension (PostgreSQL)
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

\-- Users table
CREATE TABLE IF NOT EXISTS users (
user\_id UUID PRIMARY KEY DEFAULT uuid\_generate\_v4(),
first\_name VARCHAR(50) NOT NULL,
last\_name VARCHAR(50) NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL,
password\_hash VARCHAR(255) NOT NULL,
phone\_number VARCHAR(20),
role VARCHAR(10) CHECK (role IN ('guest', 'host', 'admin')) NOT NULL,
created\_at TIMESTAMP DEFAULT NOW(),
updated\_at TIMESTAMP DEFAULT NOW()
);

\-- Properties table
CREATE TABLE IF NOT EXISTS properties (
property\_id UUID PRIMARY KEY DEFAULT uuid\_generate\_v4(),
host\_id UUID NOT NULL REFERENCES users(user\_id) ON DELETE CASCADE,
name VARCHAR(100) NOT NULL,
description TEXT,
address VARCHAR(255) NOT NULL,
city VARCHAR(50) NOT NULL,
state VARCHAR(50),
country VARCHAR(50) NOT NULL,
price\_per\_night DECIMAL(10, 2) NOT NULL,
max\_guests INTEGER NOT NULL,
created\_at TIMESTAMP DEFAULT NOW(),
updated\_at TIMESTAMP DEFAULT NOW()
);

\-- Bookings table
CREATE TABLE IF NOT EXISTS bookings (
booking\_id UUID PRIMARY KEY DEFAULT uuid\_generate\_v4(),
property\_id UUID NOT NULL REFERENCES properties(property\_id) ON DELETE CASCADE,
guest\_id UUID NOT NULL REFERENCES users(user\_id) ON DELETE CASCADE,
start\_date DATE NOT NULL,
end\_date DATE NOT NULL,
total\_price DECIMAL(10, 2) NOT NULL,
status VARCHAR(20) CHECK (status IN ('booked', 'cancelled', 'completed')) DEFAULT 'booked',
created\_at TIMESTAMP DEFAULT NOW(),
updated\_at TIMESTAMP DEFAULT NOW()
);

\-- Payments table
CREATE TABLE IF NOT EXISTS payments (
payment\_id UUID PRIMARY KEY DEFAULT uuid\_generate\_v4(),
booking\_id UUID NOT NULL REFERENCES bookings(booking\_id) ON DELETE CASCADE,
amount DECIMAL(10, 2) NOT NULL,
payment\_date TIMESTAMP DEFAULT NOW()
);

\-- Indexes for optimization
CREATE INDEX IF NOT EXISTS idx\_users\_email ON users(email);
CREATE INDEX IF NOT EXISTS idx\_properties\_host\_id ON properties(host\_id);
CREATE INDEX IF NOT EXISTS idx\_bookings\_guest\_id ON bookings(guest\_id);
CREATE INDEX IF NOT EXISTS idx\_bookings\_property\_id ON bookings(property\_id);
CREATE INDEX IF NOT EXISTS idx\_payments\_booking\_id ON payments(booking\_id);

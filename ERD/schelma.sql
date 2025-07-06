-- Enable UUID generation extension for PostgreSQL
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- ======================
-- USERS TABLE
-- ======================
CREATE TABLE IF NOT EXISTS users (
    user_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20),
    role VARCHAR(10) NOT NULL CHECK (role IN ('guest', 'host', 'admin')),
    created_at TIMESTAMP DEFAULT NOW() NOT NULL
);

-- ======================
-- LISTINGS TABLE
-- ======================
CREATE TABLE IF NOT EXISTS listings (
    listing_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    location VARCHAR(255) NOT NULL,
    price_per_night DECIMAL(10, 2) NOT NULL,
    max_guests INTEGER NOT NULL CHECK (max_guests > 0),
    created_at TIMESTAMP DEFAULT NOW() NOT NULL
);

-- ======================
-- BOOKINGS TABLE
-- ======================
CREATE TABLE IF NOT EXISTS bookings (
    booking_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    listing_id UUID NOT NULL REFERENCES listings(listing_id) ON DELETE CASCADE,
    user_id UUID NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL CHECK (total_price >= 0),
    created_at TIMESTAMP DEFAULT NOW() NOT NULL,
    CHECK (start_date < end_date)
);

-- ======================
-- INDEXES FOR PERFORMANCE
-- ======================

-- Users
CREATE INDEX IF NOT EXISTS idx_users_email ON users(email);

-- Listings
CREATE INDEX IF NOT EXISTS idx_listings_user_id ON listings(user_id);
CREATE INDEX IF NOT EXISTS idx_listings_location ON listings(location);

-- Bookings
CREATE INDEX IF NOT EXISTS idx_bookings_user_id ON bookings(user_id);
CREATE INDEX IF NOT EXISTS idx_bookings_listing_id ON bookings(listing_id);
CREATE INDEX IF NOT EXISTS idx_bookings_dates ON bookings(start_date, end_date);
alx-airbnb-database/database-script-0x01/schema.sql
-- Insert sample users
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
(uuid_generate_v4(), 'Alice', 'Johnson', 'alice@example.com', 'hashed_password_1', '+1234567890', 'guest'),
(uuid_generate_v4(), 'Bob', 'Smith', 'bob@example.com', 'hashed_password_2', '+1987654321', 'host'),
(uuid_generate_v4(), 'Clara', 'Williams', 'clara@example.com', 'hashed_password_3', '+1122334455', 'guest'),
(uuid_generate_v4(), 'David', 'Lee', 'david@example.com', 'hashed_password_4', '+1222333444', 'host');

-- Insert sample listings
INSERT INTO listings (listing_id, user_id, title, description, location, price_per_night, max_guests)
VALUES
(uuid_generate_v4(), (SELECT user_id FROM users WHERE email='bob@example.com'), 
 'Cozy Studio in Downtown', 'A cozy and affordable studio in the heart of the city.', 'New York, NY', 85.00, 2),
(uuid_generate_v4(), (SELECT user_id FROM users WHERE email='david@example.com'), 
 'Beachside Apartment', 'Enjoy beautiful ocean views from this two-bedroom apartment.', 'Miami, FL', 150.00, 4),
(uuid_generate_v4(), (SELECT user_id FROM users WHERE email='bob@example.com'),
 'Mountain Cabin Retreat', 'Quiet cabin retreat in the mountains, perfect for a weekend getaway.', 'Denver, CO', 120.00, 3);

-- Insert sample bookings
INSERT INTO bookings (booking_id, listing_id, user_id, start_date, end_date, total_price)
VALUES
(uuid_generate_v4(), 
 (SELECT listing_id FROM listings WHERE title='Cozy Studio in Downtown'),
 (SELECT user_id FROM users WHERE email='alice@example.com'),
 '2025-07-10', '2025-07-15', 425.00),

(uuid_generate_v4(),
 (SELECT listing_id FROM listings WHERE title='Beachside Apartment'),
 (SELECT user_id FROM users WHERE email='clara@example.com'),
 '2025-08-01', '2025-08-07', 900.00),

(uuid_generate_v4(),
 (SELECT listing_id FROM listings WHERE title='Mountain Cabin Retreat'),
 (SELECT user_id FROM users WHERE email='alice@example.com'),
 '2025-09-05', '2025-09-09', 480.00);
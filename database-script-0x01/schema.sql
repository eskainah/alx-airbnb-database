-- ========================================
-- 1. User Table
-- ========================================
CREATE TABLE Users (
    user_id UUID PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20),
    role VARCHAR(10) CHECK (role IN ('guest', 'host', 'admin')) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_users_email ON Users(email);
CREATE INDEX idx_users_role ON Users(role);

-- ========================================
-- 2. Property Table
-- ========================================
CREATE TABLE Properties (
    property_id UUID PRIMARY KEY,
    host_id UUID NOT NULL,
    name VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    pricepernight DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (host_id) REFERENCES Users(user_id)
);

CREATE INDEX idx_properties_host_id ON Properties(host_id);
CREATE INDEX idx_properties_location ON Properties(location);

-- ========================================
-- 3. Booking Table
-- ========================================
CREATE TABLE Bookings (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    status VARCHAR(10) CHECK (status IN ('pending', 'confirmed', 'canceled')) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (property_id) REFERENCES Properties(property_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE INDEX idx_bookings_user_id ON Bookings(user_id);
CREATE INDEX idx_bookings_property_id ON Bookings(property_id);
CREATE INDEX idx_bookings_status ON Bookings(status);

-- ========================================
-- 4. Payment Table
-- ========================================
CREATE TABLE Payments (
    payment_id UUID PRIMARY KEY,
    booking_id UUID NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method VARCHAR(20) CHECK (payment_method IN ('credit_card', 'paypal', 'stripe')) NOT NULL,

    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);

CREATE INDEX idx_payments_booking_id ON Payments(booking_id);
CREATE INDEX idx_payments_method ON Payments(payment_method);

-- ========================================
-- 5. Review Table
-- ========================================
CREATE TABLE Reviews (
    review_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    rating INTEGER CHECK (rating >= 1 AND rating <= 5) NOT NULL,
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (property_id) REFERENCES Properties(property_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE INDEX idx_reviews_property_id ON Reviews(property_id);
CREATE INDEX idx_reviews_user_id ON Reviews(user_id);
CREATE INDEX idx_reviews_rating ON Reviews(rating);

-- ========================================
-- 6. Message Table
-- ========================================
CREATE TABLE Messages (
    message_id UUID PRIMARY KEY,
    sender_id UUID NOT NULL,
    recipient_id UUID NOT NULL,
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (sender_id) REFERENCES Users(user_id),
    FOREIGN KEY (recipient_id) REFERENCES Users(user_id)
);

CREATE INDEX idx_messages_sender ON Messages(sender_id);
CREATE INDEX idx_messages_recipient ON Messages(recipient_id);

-- ========================================
-- Step 1: Drop existing partitioned structures (if needed)
-- ========================================
DROP TABLE IF EXISTS Bookings CASCADE;

-- ========================================
-- Step 2: Create Partitioned Table by start_date
-- ========================================
CREATE TABLE Bookings (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    status VARCHAR(10) CHECK (status IN ('pending', 'confirmed', 'canceled')) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);

-- ========================================
-- Step 3: Create Partitions by Year
-- ========================================
CREATE TABLE Bookings_2023 PARTITION OF Bookings
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE Bookings_2024 PARTITION OF Bookings
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE Bookings_2025 PARTITION OF Bookings
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- Add more as needed...

-- ========================================
-- Step 4: Sample Query to Test Partition Performance
-- (Fetching bookings for March 2024)
-- ========================================
EXPLAIN ANALYZE
SELECT *
FROM Bookings
WHERE start_date BETWEEN '2024-03-01' AND '2024-03-31';

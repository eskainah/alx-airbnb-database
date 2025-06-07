-- ========================================
-- INNER JOIN: Bookings and Users
-- ========================================
SELECT 
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM Bookings b
INNER JOIN Users u ON b.user_id = u.user_id;

-- ========================================
-- LEFT JOIN: Properties and Reviews (include properties with no reviews)
-- ========================================
SELECT 
    p.property_id,
    p.name,
    p.location,
    r.review_id,
    r.rating,
    r.comment,
    r.created_at
FROM Properties p
LEFT JOIN Reviews r ON p.property_id = r.property_id;

-- ========================================
-- FULL OUTER JOIN: Users and Bookings (include unmatched users and bookings)
-- Note: For MySQL, use the UNION-based workaround below since FULL OUTER JOIN is not supported
-- ========================================
-- Use this for PostgreSQL, SQL Server, etc.
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status
FROM Users u
FULL OUTER JOIN Bookings b ON u.user_id = b.user_id;

-- ========================================
-- Alternative FULL OUTER JOIN using UNION (for MySQL)
-- ========================================
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status
FROM Users u
LEFT JOIN Bookings b ON u.user_id = b.user_id

UNION

SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status
FROM Bookings b
LEFT JOIN Users u ON b.user_id = u.user_id;

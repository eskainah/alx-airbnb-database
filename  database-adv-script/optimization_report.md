-- ========================================
-- EXPLAIN Query to Analyze Performance
-- (Use EXPLAIN or EXPLAIN ANALYZE depending on DBMS)
-- ========================================
EXPLAIN 
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.payment_method,
    pay.payment_date
FROM Bookings b
JOIN Users u ON b.user_id = u.user_id
JOIN Properties p ON b.property_id = p.property_id
LEFT JOIN Payments pay ON b.booking_id = pay.booking_id;

-- ========================================
-- Optimization Recommendations:
-- 1. Ensure indexes exist on:
--    - Bookings.user_id
--    - Bookings.property_id
--    - Payments.booking_id
-- 2. Avoid SELECT * if not all columns are needed
-- 3. Refactor unnecessary JOINs if only IDs are needed
-- ========================================

-- ========================================
-- Refactored Query with Optimizations
-- ========================================
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.first_name,
    u.last_name,
    p.name AS property_name,
    pay.amount,
    pay.payment_method
FROM Bookings b
JOIN Users u ON b.user_id = u.user_id
JOIN Properties p ON b.property_id = p.property_id
LEFT JOIN Payments pay ON b.booking_id = pay.booking_id;

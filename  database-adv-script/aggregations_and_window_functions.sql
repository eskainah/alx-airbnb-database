SELECT 
    user_id,
    COUNT(*) AS total_bookings
FROM Bookings
GROUP BY user_id;


SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    COUNT(b.booking_id) AS total_bookings
FROM Users u
JOIN Bookings b ON u.user_id = b.user_id
GROUP BY u.user_id, u.first_name, u.last_name;

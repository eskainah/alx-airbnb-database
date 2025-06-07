SELECT *
FROM Properties
WHERE property_id IN (
    SELECT property_id
    FROM Reviews
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
);


SELECT u.*
FROM Users u
WHERE (
    SELECT COUNT(*)
    FROM Bookings b
    WHERE b.user_id = u.user_id
) > 3;

INSERT INTO Users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
  ('uuid-user-1', 'Alice', 'Johnson', 'alice@example.com', 'hashed_pw1', '1234567890', 'host'),
  ('uuid-user-2', 'Bob', 'Smith', 'bob@example.com', 'hashed_pw2', '0987654321', 'guest'),
  ('uuid-user-3', 'Clara', 'Williams', 'clara@example.com', 'hashed_pw3', '1122334455', 'guest'),
  ('uuid-user-4', 'David', 'Brown', 'david@example.com', 'hashed_pw4', NULL, 'host');

INSERT INTO Properties (property_id, host_id, name, description, location, pricepernight)
VALUES
  ('uuid-prop-1', 'uuid-user-1', 'Modern Loft', 'A cozy modern loft in downtown.', 'New York, NY', 150.00),
  ('uuid-prop-2', 'uuid-user-1', 'Beach Bungalow', 'Relaxing bungalow near the ocean.', 'Santa Monica, CA', 200.00),
  ('uuid-prop-3', 'uuid-user-4', 'Mountain Cabin', 'Secluded cabin in the mountains.', 'Aspen, CO', 250.00);

INSERT INTO Bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
  ('uuid-booking-1', 'uuid-prop-1', 'uuid-user-2', '2025-06-01', '2025-06-05', 600.00, 'confirmed'),
  ('uuid-booking-2', 'uuid-prop-3', 'uuid-user-3', '2025-07-10', '2025-07-15', 1250.00, 'pending'),
  ('uuid-booking-3', 'uuid-prop-2', 'uuid-user-2', '2025-08-01', '2025-08-03', 400.00, 'canceled');

INSERT INTO Payments (payment_id, booking_id, amount, payment_method)
VALUES
  ('uuid-payment-1', 'uuid-booking-1', 600.00, 'credit_card'),
  ('uuid-payment-2', 'uuid-booking-2', 1250.00, 'paypal');
-- Note: No payment for canceled booking (uuid-booking-3)

INSERT INTO Reviews (review_id, property_id, user_id, rating, comment)
VALUES
  ('uuid-review-1', 'uuid-prop-1', 'uuid-user-2', 5, 'Amazing place! Very clean and well-located.'),
  ('uuid-review-2', 'uuid-prop-3', 'uuid-user-3', 4, 'Great stay, but a bit hard to reach by car.');

INSERT INTO Messages (message_id, sender_id, recipient_id, message_body)
VALUES
  ('uuid-msg-1', 'uuid-user-2', 'uuid-user-1', 'Hi, is the Modern Loft available for early check-in?'),
  ('uuid-msg-2', 'uuid-user-1', 'uuid-user-2', 'Yes, you can check in at 1 PM.'),
  ('uuid-msg-3', 'uuid-user-3', 'uuid-user-4', 'Is the cabin pet-friendly?'),
  ('uuid-msg-4', 'uuid-user-4', 'uuid-user-3', 'Yes, pets are welcome!');

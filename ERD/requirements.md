User Relationships
User (host) 1 ⟶ * Property

A host can create multiple properties.

User (guest) 1 ⟶ * Booking

A guest can have multiple bookings.

User 1 ⟶ * Review

A user can leave many reviews (one per booking/property).

User 1 ⟶ * Message (as sender and recipient)

Messaging system between users.

Property Relationships
Property * ⟵ 1 User (host)

Property 1 ⟶ * Booking

Property 1 ⟶ * Review

Booking Relationships
Booking * ⟵ 1 User (guest)

Booking * ⟵ 1 Property

Booking 1 ⟶ 1 Payment

Review Relationships
Review * ⟵ 1 User

Review * ⟵ 1 Property

Payment Relationships
Payment * ⟵ 1 Booking

Message Relationships
Message * ⟵ 1 User (sender)

Message * ⟵ 1 User (recipient)
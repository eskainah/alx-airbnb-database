# Database Normalization Review

## 🧱 Original Schema Overview

The initial schema includes the following entities:

- `User`
- `Property`
- `Booking`
- `Payment`
- `Review`
- `Message`

Each entity was well-structured and used UUIDs for primary keys. However, the schema requires a normalization review to check for:

- Partial dependency violations (2NF)
- Transitive dependency violations (3NF)
- Repetition of values or composite attributes

---

## 🧐 Normalization Issues Identified

### 1. `Property` table
- **Potential issue**: The `location` field is a free-form `VARCHAR`.
- **Why it's a problem**: Locations (city/state/country) could benefit from normalization if reused or referenced (e.g., filters, analytics).

---

### 2. `Booking` table
- **Potential issue**: None. Fields are atomic, and dependencies are fully functional.

---

### 3. `Payment` table
- **Potential issue**: None. Each payment is tied to a single booking. No derived or dependent attributes.

---

### 4. `User` table
- **Potential issue**: None in terms of normalization, though `role` as an `ENUM` might be considered inflexible for future extensibility.

---

### 5. `Review` table
- **Potential issue**: None. Fields are atomic and directly dependent on the primary key.

---

### 6. `Message` table
- **Potential issue**: None. Messaging relationships are direct between sender and recipient.

---

## ✅ Normalization to 3NF

### Step 1: Ensure 1NF (Atomic attributes)
- ✅ All columns hold atomic (indivisible) values.
- No repeating groups or arrays stored in a single field.

### Step 2: Ensure 2NF (Full functional dependency)
- ✅ No partial dependencies on composite keys — all tables have single-column primary keys.

### Step 3: Ensure 3NF (No transitive dependencies)
- ✅ No non-key attributes depend on other non-key attributes in a given table.

---

## 🔧 Suggested Adjustments (Optional but Useful)

### A. Normalize `location` (optional improvement for analytics)

**New Table**: `Location`
```sql
location_id UUID PRIMARY KEY,
city VARCHAR NOT NULL,
state VARCHAR,
country VARCHAR NOT NULL

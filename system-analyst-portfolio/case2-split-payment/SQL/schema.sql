sql
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE loyalty_balance (
    user_id INT PRIMARY KEY REFERENCES users(id),
    points INT NOT NULL DEFAULT 0
);

CREATE TABLE points_reservations (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    order_id INT NOT NULL,
    points_reserved INT NOT NULL,
    expires_at TIMESTAMP DEFAULT NOW() + INTERVAL '15 minutes',
    status VARCHAR(20) DEFAULT 'ACTIVE'
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    total_amount DECIMAL(10,2) NOT NULL,
    status VARCHAR(30) DEFAULT 'PENDING'
);
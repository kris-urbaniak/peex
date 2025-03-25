CREATE TABLE users (
    id SERIAL PRIMARY KEY,                 -- Auto-incrementing primary key
    uname VARCHAR(50) NOT NULL UNIQUE,    -- Unique username, must not be null
    email VARCHAR(100) NOT NULL UNIQUE,      -- Unique email, must not be null
    password_hash VARCHAR(255) NOT NULL,     -- Password hash for user authentication
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Record creation time
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Record last update time
);

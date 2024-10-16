CREATE TABLE public.countries (
    id SERIAL PRIMARY KEY,                 -- Auto-incrementing primary key
    name VARCHAR(100) NOT NULL UNIQUE,     -- Country name, must be unique and not null
    code CHAR(2) NOT NULL UNIQUE,          -- ISO 3166-1 alpha-2 country code, unique and not null
    continent VARCHAR(70),                 -- Continent name
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Record creation timestamp
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP  -- Record last update timestamp
);

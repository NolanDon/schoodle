-- Drop and recreate tables

DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS  polls CASCADE;
DROP TABLE IF EXISTS options CASCADE;
DROP TABLE IF EXISTS choices CASCADE;

CREATE TABLE users (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL
);

CREATE TABLE polls (
  id SERIAL PRIMARY KEY NOT NULL,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  location VARCHAR(255),
  link VARCHAR(500),
  organizer_id INTEGER REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE options (
  id SERIAL PRIMARY KEY NOT NULL,
  date DATE NOT NULL,
  poll_id INTEGER REFERENCES polls(id) ON DELETE CASCADE
);

CREATE TABLE choices (
  id SERIAL PRIMARY KEY NOT NULL,
  option_id INTEGER REFERENCES options(id) ON DELETE CASCADE,
  attendee_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  poll_id INTEGER REFERENCES polls(id) ON DELETE CASCADE
);





CREATE DATABASE makersbnb;
CREATE DATABASE makersbnb_test;
CREATE TABLE users(id SERIAL PRIMARY KEY, username VARCHAR(30), name VARCHAR(50), email VARCHAR(50), password VARCHAR(100));
CREATE TABLE listings(id SERIAL PRIMARY KEY, title VARCHAR(50), description VARCHAR(200), price INTEGER, host_id INTEGER REFERENCES users (id));

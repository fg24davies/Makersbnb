ApeBnb - MakersBnB Group Project
=================

![image](https://user-images.githubusercontent.com/30720508/124908762-94ae0400-dfe1-11eb-890e-b9980602ef87.png)

This project was completed in week 6 of the Makers bootcamp. It was done over a week in a team of 4, using **XP values** to guide our behaviour.
The project tech stack is **Ruby, Sinatra, Capybara for feature testing, RSpec for unit testing, CSS and HTML.**

Project Specification
------------
To build a simple web app based on AirBnB and include the following functionality:

- [x] Sign up as a user
- [x] See a list of spaces
- [x] Username and email are unique
- [x] User is welcomed after signing up
- [x] Encryping password
- [x] CSS
- [x] Logout
- [x] List a space as a user
- [x] Listing page includes information about listings and to request a booking

User stories
------------
* We created the following user stories
```
As a user
So I can use the site
I would like to be able to navigate to the homepage

As a user
So I can use the site
I would like to be able to sign up on the homepage  

As a registered user
So I can use the site
I would like to be able to sign in

As a person who wants to rent a room
So I can see my options
I would like to be able to see the list of rooms 

As a person with a room to rent
So others can look at it
I want to be able to list it
```

How to setup:
-----

* Clone this repo
* Run `bundle install`
* Run the following SQL commands to setup the databases:
```
CREATE DATABASE makersbnb;
CREATE DATABASE makersbnb_test;
\c makersbnb
CREATE TABLE users(id SERIAL PRIMARY KEY, username VARCHAR(30), name VARCHAR(50), email VARCHAR(50), password VARCHAR(100));
CREATE TABLE listings(id SERIAL PRIMARY KEY, title VARCHAR(50), description VARCHAR(200), price INTEGER, host_id INTEGER REFERENCES users (id));
```
* The following databases are sufficicent for testing, if you would like to use the website, register a user, login (ADD STUFF)!
* `rackup` to run ruby server when in root directory
* `http://127.0.0.1:9292/` in browser to view app

Testing:
----
* Run `rspec` to view tests
* Coverage snapshot shown below:

![image](https://user-images.githubusercontent.com/30720508/124908598-629ca200-dfe1-11eb-9f08-36cdeae10a0d.png)

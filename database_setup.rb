require './lib/database_connection'
require './lib/user'

if ENV['RACK_ENV'] == 'test'
  DatabaseConnection.setup('makersbnb_test')
else
  DatabaseConnection.setup('makersbnb')
end

def setup_test_database
  DatabaseConnection.setup('makersbnb_test')
  DatabaseConnection.query('DROP TABLE IF EXISTS listings;')
  DatabaseConnection.query('DROP TABLE IF EXISTS users;')
  DatabaseConnection.query('CREATE TABLE users(id SERIAL PRIMARY KEY, username VARCHAR(30), name VARCHAR(50), email VARCHAR(50), password VARCHAR(100));')
  DatabaseConnection.query('CREATE TABLE listings(id SERIAL PRIMARY KEY, title VARCHAR(50), description VARCHAR(200), price INTEGER, host_id INTEGER REFERENCES users (id));')
  User.add(name: 'Taran', username: 'taran_1', email: 'taran@bnb.com', password: 'password123')
  DatabaseConnection.query("INSERT INTO listings(title, description, price, host_id) VALUES('Spare Room',	'sofa bed in living area',	'10',	'1');")
  DatabaseConnection.query("INSERT INTO listings(title, description, price, host_id) VALUES('Master Bedroom',	'ensuite available',	'999',	'1');")
end

require './lib/database_connection'

if ENV['RACK_ENV'] == 'test'
  DatabaseConnection.setup('makersbnb_test')
else
  DatabaseConnection.setup('makersbnb')
end

def setup_test_database
  DatabaseConnection.setup('makersbnb_test')
  DatabaseConnection.query("DROP TABLE IF EXISTS listings;")
  DatabaseConnection.query("DROP TABLE IF EXISTS users;")
  DatabaseConnection.query("CREATE TABLE users(id SERIAL PRIMARY KEY, username VARCHAR(30), name VARCHAR(50), email VARCHAR(50), password VARCHAR(30));")
  DatabaseConnection.query("CREATE TABLE listings(id SERIAL PRIMARY KEY, title VARCHAR(50), description VARCHAR(200), price INTEGER, host_id INTEGER REFERENCES users (id));")
  DatabaseConnection.query("INSERT INTO users(username, name, email, password) VALUES('taran_1', 'Taran', 'taran@bnb.com', 'password123');")
  DatabaseConnection.query("INSERT INTO users(username, name, email, password) VALUES('flora_2',	'Flora', 'flora@bnb.com', 'password123');")
  DatabaseConnection.query("INSERT INTO users(username, name, email, password) VALUES('inbar_3',	'Inbar',	'inbar@bnb.com', 'password123');")
  DatabaseConnection.query("INSERT INTO users(username, name, email, password) VALUES('alec_4',	'Alec',	'alec@bnb.com', 'password123');")
  DatabaseConnection.query("INSERT INTO listings(title, description, price, host_id) VALUES('Spare Room',	'sofa bed in living area',	'10',	'1');")
  DatabaseConnection.query("INSERT INTO listings(title, description, price, host_id) VALUES('Master Bedroom',	'ensuite available',	'999',	'1');")
  DatabaseConnection.query("INSERT INTO listings(title, description, price, host_id) VALUES('Room of Alec',	'my room while i stay at my parents',	'30',	'4');")
end

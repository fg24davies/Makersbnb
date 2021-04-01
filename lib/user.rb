require 'bcrypt'
require_relative 'database_connection'

class User
  def initialize
    # 
  end

  def self.authenticate?(password:, username:)
    data = DatabaseConnection.query("SELECT username, password FROM users WHERE username = '#{username}';")
    if data.ntuples.positive?
      BCrypt::Password.new(data[0]['password']) == password
    else
      false
    end 
  end

  def self.find_username?(username:)
    data = DatabaseConnection.query("SELECT username FROM users WHERE username = '#{username}';")
    data.ntuples.positive?
  end

  def self.find_email?(email:)
    data = DatabaseConnection.query("SELECT username FROM users WHERE email = '#{email}';")
    data.ntuples.positive?
  end

  def self.add(name:, username:, email:, password:)
    encrypted_password = BCrypt::Password.create(password)
    data = DatabaseConnection.query("INSERT INTO users (name, username, email, password) VALUES ('#{name}', '#{username}', '#{email}', '#{encrypted_password}');")
  end

  def self.find_id(username:)
    data = DatabaseConnection.query("SELECT id FROM users WHERE username = '#{username}';")
    data[0]['id']
  end
end

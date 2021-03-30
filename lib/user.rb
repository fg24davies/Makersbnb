require_relative 'database_connection'

class User
  def initialize
    # 
  end

  def self.authenticate?(password:, username:)
    data = DatabaseConnection.query("SELECT username, password FROM users WHERE username = '#{username}' AND password = '#{password}';")
    data.ntuples.positive?
  end

  def self.find_username?(username:)
    data = DatabaseConnection.query("SELECT username FROM users WHERE username = '#{username}';")
    data.ntuples.positive?
  end
end
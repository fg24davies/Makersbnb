require 'user'
require 'pg'

describe User do
  describe '.add' do
    it 'saves user data to database' do
      expect(DatabaseConnection).to receive(:query).with("INSERT INTO users (name, username, email, password) VALUES ('Alec', 'alecrox', 'alecrox@yoursox.com', 'orangerangytangies');").and_call_original
      User.add(name: 'Alec', username: 'alecrox', email: 'alecrox@yoursox.com', password: 'orangerangytangies')
    end
  end
end

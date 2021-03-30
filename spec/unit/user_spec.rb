require 'user'

describe User do 

  describe '.authenticate?' do
    it 'checks username and password are correct' do 
      expect(User.authenticate?(password: 'password123',username: 'taran_1')).to eq true
    end
  end

  describe '.find_username?' do
    it 'checks if username is in database' do 
      expect(User.find_username?(username: 'taran_1')).to eq true
      expect(User.find_username?(username: 'taran51')).to eq false
    end
  end

  describe '.add' do
    it 'saves user data to database' do
      expect(DatabaseConnection).to receive(:query).with("INSERT INTO users (name, username, email, password) VALUES ('Alec', 'alecrox', 'alecrox@yoursox.com', 'orangerangytangies');").and_call_original
      User.add(name: 'Alec', username: 'alecrox', email: 'alecrox@yoursox.com', password: 'orangerangytangies')
    end
  end
end

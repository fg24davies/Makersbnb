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

  describe '.find_email?' do
    it 'checks if email is in database' do
      expect(User.find_email?(email: 'taran@bnb.com')).to eq true
      expect(User.find_email?(email: 'taranimpostor@bnb.com')).to eq false
    end
  end

  describe '.find_id' do
    it 'returns the users id, given their username' do
      expect(User.find_id(username: "taran_1")).to eq('1')
    end
  end

  describe '.add' do
    it 'saves user data to database' do
      User.add(name: 'Alec', username: 'alecrox', email: 'alecrox@yoursox.com', password: 'orangytangies')
      expect(User.authenticate?(password: 'orangytangies', username: 'alecrox')).to eq(true)
    end
  end
end

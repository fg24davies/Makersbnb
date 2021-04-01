require 'listing'

describe Listing do
  describe '.all' do
    it 'get all listings from the database as Listing objects' do
      listing = Listing.all.first
      expect(listing).to be_a(Listing)
      expect(listing.title).to eq "Spare Room"
      expect(listing.price).to eq "10"
    end
  end
  describe '.add' do
    it 'adds a new listing to the database and returns a Listing object' do
      listing = Listing.add(title: 'room', price: '20', description: 'swanky', host_id: '1')
      expect(listing).to be_a(Listing)
      expect(listing.title).to eq "room"
      expect(listing.price).to eq "20"
      expect(listing.description).to eq "swanky"
    end
  end
end

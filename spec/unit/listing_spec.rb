require 'listing'

describe Listing do
  describe '.all' do
    it 'get all listings from the database as Listing objects' do
      expect(Listing.all.first).to be_a(Listing)
      listing = Listing.all.first
      expect(listing.title).to eq "Spare Room"
      expect(listing.price).to eq "10"
    end
  end
end

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
# 'Spare Room',	'sofa bed in living area',	'10',	'1');")
# 'Master Bedroom',	'ensuite available',	'999',	'1');")
# 'Room of Alec',	'my room while i stay at my parents',	'30',	'4');")

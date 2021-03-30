require_relative 'database_connection'

class Listing

  attr_reader :title, :price

  def initialize(title:, price:)
    @title = title
    @price = price
  end 

  def self.all
    data = DatabaseConnection.query("SELECT * FROM listings;")
    data.map { |listing| Listing.new(title: listing['title'], price: listing['price'])}
  end

  def self.display_listings
    all.map { |listing| "#{listing.title}: £#{listing.price}" }.join("<br><br>")
  end

end 

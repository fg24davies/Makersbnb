require_relative 'database_connection'

class Listing

  attr_reader :title, :price, :description

  def initialize(title:, price:, description:)
    @title = title
    @price = price
    @description = description
  end 

  def self.all
    data = DatabaseConnection.query("SELECT * FROM listings;")
    data.map { |listing| Listing.new(title: listing['title'], price: listing['price'], description: listing['description'])}
  end

  def self.display_listings
    all.map { |listing| "#{listing.title}: £#{listing.price} <br> #{listing.description}" }.join("<br><br>")
  end

  def self.add(title:, price:, description:, id:)
    data = DatabaseConnection.query("INSERT INTO listings(title, description, price, host_id) 
      VALUES('#{title}',	'#{description}',	'#{price}',	'#{id}')
      RETURNING title, description, price;")
    Listing.new(title: data[0]['title'], price: data[0]['price'], description: data[0]['description'])
  end

end 

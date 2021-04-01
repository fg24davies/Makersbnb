require_relative 'database_connection'

class Listing

  attr_reader :id, :title, :price, :description, :host_id

  def initialize(id:, title:, price:, description:, host_id:)
    @id = id
    @title = title
    @price = price
    @description = description
    @host_id = host_id
  end 

  def self.all
    data = DatabaseConnection.query("SELECT * FROM listings;")
    data.map { |listing| Listing.new(id: listing['id'], title: listing['title'], price: listing['price'], description: listing['description'], host_id: listing['host_id'])}
  end

  def self.find(id:)
    data = DatabaseConnection.query("SELECT * FROM listings 
      WHERE id = '#{id}';")
    Listing.new(id: id, title: data[0]['title'], price: data[0]['price'], description: data[0]['description'], host_id: data[0]['host_id'])
  end

  # def self.display_listings
  #   all.map { |listing| "#{listing.title}: £#{listing.price} <br> #{listing.description}" }.join("<br><br>")
  # end

  def self.add(title:, price:, description:, host_id:)
    data = DatabaseConnection.query("INSERT INTO listings(title, description, price, host_id) 
      VALUES('#{title}', '#{description}', '#{price}', '#{host_id}')
      RETURNING id, title, description, price, host_id;")
    Listing.new(id: data[0]['id'], title: data[0]['title'], price: data[0]['price'], description: data[0]['description'], host_id: data[0]['host_id'])
  end
end 

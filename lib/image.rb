

class Image

  def initialize 
    @image
  end

  def self.random_image
    @listing_images = ["../images/treemonk.jpg", "../images/listing1.jpeg", 
      "../images/listing2.jpeg", "../images/listing3.jpeg",
       "../images/listing4.jpeg", "../images/listing5.jpeg", 
       "../images/listing6.jpeg", "../images/listing7.jpeg",
       "../images/listing8.jpg", "../images/listing9.jpg", 
       "../image/listing10.jpg", "../images/listing11.jpg" ]
    @listing_images.sample
  end

end
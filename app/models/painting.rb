class Painting

  attr_reader :title, :price, :artist
  attr_accessor :gallery

  @@all = []

  def initialize(title, price, gallery, artist)
    @title = title
    @price = price
    @gallery = gallery
    @artist = artist
    @@all << self
  end

  def self.all
    @@all
  end

  def self.total_price
    price = Painting.all.map {|painting|painting.price}.reduce(:+).to_s.reverse.scan(/\d{3}|.+/).join(",").reverse
   "$" + "#{price}"
  end

end


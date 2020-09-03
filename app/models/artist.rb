class Artist


  @@all = []
  attr_reader :name, :years_experience

  def initialize(name, years_experience)
    @name = name
    @years_experience = years_experience
    @@all << self
  end

  def self.all
    @@all
  end

  def paintings
    Painting.all.select {|painting| painting.artist == self }
  end

  def galleries
    self.paintings.map {|painting| painting.gallery}
  end

  def cities
    self.galleries.map {|gallery| gallery.city }
  end

  def self.total_experience
    Artist.all.map{|artist| artist.years_experience}.reduce(:+)
  end

  def self.most_prolific 
    artist_to_years_experience = {}
    Painting.all.each {|painting| artist_to_years_experience[painting.artist.name] = (painting.artist.paintings.count).to_f/(painting.artist.years_experience)}
      artist_to_years_experience.max_by {|k, v| v}[0]
  end
 
  def create_painting(title, price, gallery)
    Painting.new(title, price, gallery, self)

  end

end

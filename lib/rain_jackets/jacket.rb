class RainJackets::Jacket
  attr_accessor :name, :url, :price, :description, :pros, :cons, :overall_rating, :water_resistance_rating, :breathability_rating, :comfort_rating, :weight_rating, :durability_rating, :packed_size_rating
  
  @@all = []
  
  # Take in an argument of an array and sets new jacket's attributes
  def initialize
    @@all << self
  end
  
  def self.all
    return @@all
  end
  
  def self.sort_rating_desc(rating_cat)
    ranking = @@all.sort{|left, right| right.water_resistance_rating <=> left.water_resistance_rating}
  end
  
end
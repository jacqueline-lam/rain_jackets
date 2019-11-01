class RainJackets::Jacket
  attr_accessor :name, :url, :price, :description, :pros, :cons, :overall_rating
  attr_accessor :water_resistance_rating, :breathability_rating, :comfort_rating, :weight_rating, :durability_rating, :packed_size_rating, :rating_category
  
  @@all = []
  
  # Take in an argument of an array and sets new jacket's attributes
  def initialize
    @@all << self
  end
  
  def self.all # Class method to expose variable @@all
    @@all
  end
  
end
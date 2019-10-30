class RainJackets::Jacket
  attr_accessor :name, :url, :price, :description, :pros, :cons, :overall_rating, :water_resistance_rating, :breathability_rating, :comfort_rating, :weight_rating, :durability_rating, :packed_size_rating
  
  @@all = []
  
  def initialize
    @@all << self
  end
  
  def self.all 
    @all
  end
end
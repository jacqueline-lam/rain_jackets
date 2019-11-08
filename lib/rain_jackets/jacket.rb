class RainJackets::Jacket
  attr_accessor :name, :url, :price, :description, :pros, :cons, :overall_rating
  attr_accessor :water_resistance_rating, :breathability_rating, :comfort_rating, :weight_rating, :durability_rating, :packed_size_rating, :rating_category

  @@all = []

  # Set class varibale @@all equal to jackets array created by Scraper
  def self.all=(jackets)
    @@all = jackets.uniq
  end

  # Class method to expose variable @@all
  def self.all
    @@all
  end
end

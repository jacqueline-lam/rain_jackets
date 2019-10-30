class RainJackets::Jacket
  attr_accessor :name, :url, :price, :description, :pros, :cons, :overall_rating, :water_resistance_rating, :breathability_rating, :comfort_rating, :weight_rating, :durability_rating, :packed_size_rating
  attr_accessor :cli
  
  @@all = []
  
  # Take in an argument of an array and sets new jacket's attributes
  def initialize(cli_ref)
    @cli = cli_ref
    @@all << self
  end

  # Uses Scraper class to create new jacket
  # def self.create_from_collection(jackets_array)
  # ## Iterate over array of jackets and create a 
  #   # new individual jacket using each index
  #   jackets_array.each do |jacket_instance|
  #     jacket_instance = RainJackets::Jacket.new
  #   end
  # end
  
  def self.all
    return @@all
  end
  
end
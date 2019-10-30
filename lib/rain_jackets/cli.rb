class RainJackets::CLI
  attr_accessor :jackets
  
  def initialize
    @jackets = RainJackets::Scraper.initialize_jacket_objects(self)
  end
 
  def call #test
    puts "Welcome to the Best Rain Jackets Rater!"
  end

end
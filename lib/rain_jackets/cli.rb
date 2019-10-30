class RainJackets::CLI
  attr_accessor :jackets
  
  def initialize
    @jackets = RainJackets::Scraper.initialize_jacket_objects(self)
    puts "Welcome to the Best Rain Jackets Rater!"
  end
 
  def call 
    input = ""
    while input != "exit"
      puts "To see all the best rain jackets, enter 'list all'."
      puts "To list rain jackets by overall rating, enter 'list jackets by rating'."
      puts "To see all info about a specific jacket, enter jacket by '1-5'."
        # pros
        # cons
        # description 
        # url
        # rating categories 
    end
  end

end
class RainJackets::CLI
 
  def call #test
    puts "Welcome to the Best Rain Jackets Rater!"
  end

  # Uses Scraper class to create new jackets
  def make_jackets
    jackets_array = RainJackets::Scraper.initialize_jacket_objects
    RainJackets::Jacket.create_from_collection(jackets_array)
  end

end
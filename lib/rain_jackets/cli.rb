class RainJackets::CLI
 
  def call 
    RainJackets::Scraper.new
    puts "Welcome to the Best Rain Jackets Rater!"
  end

end
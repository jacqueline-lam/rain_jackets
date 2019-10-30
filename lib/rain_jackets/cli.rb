class RainJackets::CLI
  attr_accessor :jackets
  
  def initialize
    @jackets = RainJackets::Scraper.initialize_jacket_objects(self)
    puts "Welcome to the Best Rain Jackets Rater!"
  end
 
  def call 
    input = ""
    while input != "exit"
      puts "========================================================="
      puts "MENU:"
      puts "To see all the best rain jackets, enter 'list all'."
      puts "To list rain jackets by overall rating, enter 'list by ratings'."
      puts "To see all info about a specific jacket, enter jacket by '1-5'."
        # pros
        # cons
        # description 
        # url
        # rating categories 
      puts "========================================================="
    
      input = gets.strip
      if input.downcase == "list all"
        puts "Best Rain Jackets of 2019:"
        @jackets.each_with_index do |jacket, i|
          puts "#{(i+1).to_s}. #{jacket.name} — #{jacket.price} - #{jacket.overall_rating}/100 Overall Rating"
        end
      #elsif input = 'list by ratings'
      #elsif input = '1' #jacket 1
      #elsif input = '2' #jacket 2
      #elsif input = '3' #jacket 3
      #elsif input = '4' #jacket 4
      #elsif input = '5' #jacket 5

      end
    end    
  end
end
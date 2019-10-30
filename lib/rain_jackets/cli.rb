class RainJackets::CLI
  attr_accessor :jackets
  
  def initialize
    @jackets = RainJackets::Scraper.initialize_jacket_objects(self)
    puts "Welcome to the Best Rain Jackets Rater!"
  end
 
  def call 
    input = nil
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
    
      input = gets.strip.downcase
      case input
      when "list all"
        puts "Best Rain Jackets of 2019:"
        @jackets.each_with_index do |jacket, i|
          puts "#{(i+1).to_s}. #{jacket.name} — #{jacket.price} - #{jacket.overall_rating}/100 Overall Rating"
        end
        
      # when 'list by ratings'
        # list Overall Score
          # Sort list by overall rating
          # prompt user to input specific rating categories: "water resistance, breathability, comfort, weight, durability, packed_size_rating"
          
      when (1..5).include?(input.to_i) 
        puts "- Jacket Description: #{@jackets[input-1].description}"
        puts "- Pros: #{@jackets[input-1].pros}"
        puts "- Cons: #{@jackets[input-1].cons}"
        puts "- URL: #{@jackets[input-1].url}"
        puts - "Rating Categories: Water Resistance: #{@jackets[input-1].water_resistance_rating}; Breathability: #{@jackets[input-1].breathability_rating}; Comfort: #{@jackets[input-1].comfort_rating}; Weight: #{@jackets[input-1].weight_rating}; Durability: #{@jackets[input-1].:durability_rating}; Packed_Size: #{@jackets[input-1].packed_size_rating}"
        
        
      #when '2' - '5' #jacket 1-5 specified
        # list pros
        # list cons
        # list description
        # list url
        # list rating categories 
      
      #else - make sure that the program doesn't break when user's input is unexpected
      end
    end    
  end
end
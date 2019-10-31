class RainJackets::CLI
  attr_accessor :jackets
  
  def initialize
    @jackets = RainJackets::Scraper.initialize_jacket_objects
    puts "Welcome to the Best Rain Jackets Rater!"
    print_menu
  end
 
  # Initiates call procedure to get user input 
  def call 
    input = gets.chomp
    handle_input(input)
  end    
  
  # Handles the user pint
  def handle_input(input)  
    if input == "list all"
      print_list_all
      
    # elsif 'list by ratings'
      # list Overall Score
        # Sort list by overall rating
        # prompt user to input specific rating categories: "water resistance, breathability, comfort, weight, durability, packed_size_rating"
        
    elsif (1..5).include?(input.to_i) 
      print_selected_jacket(input.to_i)
      
    elsif input == "exit"
      exit
      
    else #- make sure that the program doesn't break when user's input is unexpected
      puts "I don't understand that answer. Please try again" 
    end
    
    print_menu 
    call #reinitiate call loop at the end of non-exited handle_input logic
  end
  
  def print_list_all
    puts "Best Rain Jackets of 2019:"
      @jackets.each_with_index do |jacket, i|
        puts "#{(i+1).to_s}. #{jacket.name} — #{jacket.price} - #{jacket.overall_rating}/100 Overall Rating"
        puts ""
      end
  end
  
  def print_selected_jacket(jacket_number)
    jacket = @jackets[jacket_number - 1]
    puts "--------------- #{jacket.name} --------------------"
    puts "Jacket Description: #{jacket.description}"
    puts "Pros: #{jacket.pros}"
    puts "Cons: #{jacket.cons}"
    puts "URL: #{jacket.url}"
    puts "Rating Categories:"
    puts "  - Water Resistance: #{jacket.water_resistance_rating}"
    puts "  - Breathability: #{jacket.breathability_rating}"
    puts "  - Comfort: #{jacket.comfort_rating}"
    puts "  - Weight: #{jacket.weight_rating}"
    puts "  - Durability: #{jacket.durability_rating}"
    puts "  - Packed Size: #{jacket.packed_size_rating}"
    puts ""
  end
  
  def print_menu 
     puts "============================ MENU ============================="
      puts "List all jackets: enter 'list all'."
      puts "More information about a specific jacket, enter jacket by '1-5'."
      puts "List ranking by speific rating category: enter "
      puts "==============================================================="
  end
end
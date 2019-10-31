class RainJackets::CLI
  attr_accessor :jackets
  
  def initialize
    @jackets = RainJackets::Scraper.initialize_jacket_objects
    puts "Welcome to the Best Rain Jackets Rater!"
    prompt_user_input
  end
 
  def prompt_user_input
    puts "What would you like to do?"
    puts "Enter 'menu': to see more commands / 'exit' to exit program."
    call
  end
  
  # Initiates call procedure to get and handle user input
  def call 
    input = gets.chomp.strip
    handle_input(input)
  end    
  
  # Handles the user pint
  def handle_input(input)  
    if input == "all"
      print_list_all
      
    # elsif 'list by ratings'
      # list Overall Score
        # Sort list by overall rating
        # prompt user to input specific rating categories: "water resistance, breathability, comfort, weight, durability, packed_size_rating"
        
    elsif (1..5).include?(input.to_i) 
      print_selected_jacket(input.to_i)
      
    elsif input == "menu"
      print_menu
    
    elsif input == "exit"
      exit
      
    else #- make sure that the program doesn't break when user's input is unexpected
      puts "I don't understand that answer. Please try again" 
    end
    
    prompt_user_input 
    call #reinitiate call loop at the end of non-exited handle_input logic
  end
  
  def print_list_all
    puts "Best Rain Jackets of 2019:"
      @jackets.each_with_index do |jacket, i|
        puts "#{(i+1).to_s}. #{jacket.name.split(" - ").first} — #{jacket.price} - #{jacket.overall_rating}/100 Overall Rating"
      end
  end
  
  def print_selected_jacket(jacket_number)
    jacket = @jackets[jacket_number - 1]
    puts "--------------- #{jacket.name} ---------------"
    puts "• Jacket Description: #{jacket.description}"
    puts "• Pros: #{jacket.pros}"
    puts "• Cons: #{jacket.cons}"
    puts "• URL: #{jacket.url}"
    puts "• Rating Categories:"
    puts "   - Water Resistance: #{jacket.water_resistance_rating}"
    puts "  - Breathability: #{jacket.breathability_rating}"
    puts "  - Comfort: #{jacket.comfort_rating}"
    puts "  - Weight: #{jacket.weight_rating}"
    puts "  - Durability: #{jacket.durability_rating}"
    puts "  - Packed Size: #{jacket.packed_size_rating}"
    puts "--------------------------------------------------------------"
  end
  
  def print_menu 
    puts "========================== MENU ==============================="
    puts "• List all jackets -> enter 'all'"
    puts "• More information on specific jacket -> enter jacket #'1-5'"
    puts "• List jackets by speific rating category -> enter:"
    puts "  'wr' for Water Resistance"
    puts "  'b' for Brethability"
    puts "  'c' for Comfort"
    puts "  'w' for Weight"
    puts "  'd' for Durability"
    puts "  'ps' for Packed Size" 
    puts "• Exit program -> enter 'exit'"
    puts "==============================================================="
  end
end
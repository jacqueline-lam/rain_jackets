class RainJackets::CLI
  attr_accessor :jackets
  
  def initialize
    @jackets = RainJackets::Scraper.initialize_jacket_objects
    puts "Welcome to the Best Rain Jackets Rater!"
    prompt_user_input
  end
 
  def prompt_user_input
    puts "► What would you like to do?"
    puts "► Enter: 'menu' to see all commands / 'exit' to exit program."
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
      
    elsif (1..5).include?(input.to_i) 
      print_selected_jacket(input.to_i)
      
    elsif ['wr', 'b', 'c', 'w', 'd', 'ps'].include(input.downcase)
      print_ratings(input.downcase)
    
    elsif input == "menu"
      print_menu
      call
    
    elsif input == "exit"
      puts "Goodbye! Have a great day!"
      exit
      
    else #- make sure that the program doesn't break when user's input is unexpected
      puts "I don't understand that answer. Please try again" 
    end
    
    prompt_user_input 
    call #reinitiate call loop at the end of non-exited handle_input logic
  end
  
  def print_list_all
    puts "---------------------------- Best Rain Jackets of 2019: ------------------------"
      @jackets.each_with_index do |jacket, i|
        puts " #{(i+1).to_s}. #{jacket.name.split(" - ").first} — #{jacket.price} - #{jacket.overall_rating}/100 Overall Rating"
      end
    puts "--------------------------------------------------------------------------------"
  end
  
  def print_selected_jacket(jacket_number)
    jacket = @jackets[jacket_number - 1]
    puts "---------------- #{jacket_number}. #{jacket.name} ----------------"
    puts "• Jacket Description: #{jacket.description}"
    puts "• Price: #{jacket.price}"
    puts "• Pros: #{jacket.pros}"
    puts "• Cons: #{jacket.cons}"
    puts "• URL: #{jacket.url}"
    puts "• Overall Rating: #{jacket.overall_rating}/100"
    puts "• Rating Categories:"
    puts "  - Water Resistance: #{jacket.water_resistance_rating}/10"
    puts "  - Breathability: #{jacket.breathability_rating}/10"
    puts "  - Comfort: #{jacket.comfort_rating}/10"
    puts "  - Weight: #{jacket.weight_rating}/10"
    puts "  - Durability: #{jacket.durability_rating}/10"
    puts "  - Packed Size: #{jacket.packed_size_rating}/10"
    puts "-----------------------------------------------------------------"
  end
  
  def print_rating_category(rating_input)
    if rating_input == 'wr'
      rating_category = "water_resistance_rating"
    elsif rating_input == 'b'
      rating_category = "'br'"
    elsif rating_input == 'c'
      rating_category = "comfort_rating"
    elsif rating_input == 'w'
      rating_category = "weight_rating"
    elsif rating_input == 'd'
      rating_category = "durability_rating"
    elsif rating_input == 'ps'
      rating_category = "packed_size_rating"
    else
      puts "Please try again. Input 1 - 6"
      rating_input = gets.chomp.to_i
    end

  end
  
  # Display all menu commands
  def print_menu 
    puts "========================== MENU ==============================="
    puts "• List all jackets -> enter 'all'"
    puts "• More information on specific jacket -> enter jacket #'1-5'"
    puts "• List jackets by speific rating category -> enter:"
    puts "  'wr' — Water Resistance"
    puts "  'b' — Brethability"
    puts "  'c' — Comfort"
    puts "  'w' — Weight"
    puts "  'd' — Durability"
    puts "  'ps' — Packed Size" 
    puts "• Exit program -> enter 'exit'"
    puts "==============================================================="
    puts "► What would you like to do?"
  end
end
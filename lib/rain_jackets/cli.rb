class RainJackets::CLI
  attr_accessor :jackets

  def call
    # Calls Scraper class method that will return array of all jacket objects
    # Store all Jacket instances in CLI's instance variable @jackets
    RainJackets::Scraper.initialize_jacket_objects
    @jackets = RainJackets::Jacket.all
    # Greet user with text input
    puts ""
    puts "Welcome to the Best Women's Rain Jackets Rater!"
    prompt_input
  end

  # Print instructions to screen and prompts user for input
  def prompt_input
    puts "► What would you like to do?"
    puts "► Enter: 'menu' to see all commands / 'exit' to exit program."
    get_input
  end

  def get_input
    input = gets.strip.downcase
    handle_input(input)
  end

  # Handles the user pint
  def handle_input(input)
    if input == "all"
      print_list_all

    elsif (1..5).include?(input.to_i)
      print_selected_jacket(input.to_i)

    elsif ['wr', 'b', 'c', 'w', 'd', 'ps'].include?(input)
      print_ratings(input)

    elsif input == "menu"
      print_menu
      get_input

    elsif input == "exit"
      puts "Goodbye! Hope you found your favorite jacket!"
      exit

    else # Make sure that the program doesn't break with unexpected user input
      puts ""
      puts "I don't understand that answer. Please try again!"
    end

    prompt_input # Reinitiate program loop at the end of non-exited handle_input logic
  end

  # Display all best rain jackets
  def print_list_all
    puts ""
    puts "----------------------- Best Women's Rain Jackets of 2019: -----------------------------"
      @jackets.each_with_index do |jacket, i|
        ranking = (i+1).to_s
        puts " #{ranking}. #{jacket.name.split(" - ").first} — #{jacket.price} - #{jacket.overall_rating}/100 Overall Rating"
      end
    puts "-----------------------------------------------------------------------------------"
  end

  # Display details of chosen jacket
  def print_selected_jacket(jacket_number)
    jacket = @jackets[jacket_number - 1]
    puts ""
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

  # Convert user input to jacket attribute name string
  def read_rating_input(input)
    # case statement to run multiple conditions against input value
    case input
      when 'wr'
        rating_category = "water_resistance_rating"
      when 'b'
        rating_category = "breathability_rating"
      when 'c'
        rating_category = "comfort_rating"
      when 'w'
        rating_category = "weight_rating"
      when 'd'
        rating_category = "durability_rating"
      when 'ps'
        rating_category = "packed_size_rating"
    end
    rating_category
  end

  # Display ranked list based on chosen rating category
  def print_ratings(input)
    rating_attribute = read_rating_input(input)
    # Dynamically access specified attribute reader and
    # Sort all jacket instances in descending order of the rating attribute's value
    jackets_sorted_by_rating = @jackets.sort_by { |jacket| jacket.send(rating_attribute)}.reverse

    # Convert rating attribute name to readable capitalized title
    rating_category_name = rating_attribute.split('_').map(&:capitalize).join(' ')

    puts ""
    puts "-------------Best Jackets Ranked by #{rating_category_name} ------------------"
    jackets_sorted_by_rating.each_with_index do |jacket, idx|
      puts " #{idx + 1}. #{jacket.name} — #{jacket.send(rating_attribute)}/10"
    end
    puts "---------------------------------------------------------------------"
  end

  # Display all menu commands/ Define input interface
  def print_menu
    puts ""
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
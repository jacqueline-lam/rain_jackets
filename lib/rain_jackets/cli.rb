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
      puts "To list rain jackets by overall rating, enter 'list by ratings'."
      puts "To see all info about a specific jacket, enter jacket by '1-5'."
        # pros
        # cons
        # description 
        # url
        # rating categories 
    
      input = gets.chomp
      if input == "list all"
        @jackets.each_with_index(1) do |jacket, i|
          puts "#{i}. #{jacket.name} - Price: #{jacket.price} - Overall Rating: #{jacket.overal_rating}"
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
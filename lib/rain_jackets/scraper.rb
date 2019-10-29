class RainJackets::Scraper

  def get_page
    Nokogiri::HTML(open("https://www.outdoorgearlab.com/topics/clothing-womens/best-rain-jacket-womens"))
  end
  
  def scrape_jackets_table
    self.get_page.css("div.content_table_xwide tr")
  end
  
  def initialize_jacket_objects
    all_jackets = []
    # Determines which row you're on, hence which property you're trying to populate
    scrape_jackets_table.each_with_index do |tr_element, tr_index|

      # Product name and URL
      if tr_index == 0
        # td_value = td_element
        product_name_row = tr_element.css("div.compare_product_name")
        
        product_name_row.each do |td_element|
          new_jacket = Jacket.new
          new_jacket.name = td_element.text
          new_jacket.url = td_element.css("a").first.attributes["href"].value
          all_jackets << new_jacket
        end
      end
    end 
  end #ends initialize_jacket_objects
  
end #ends Scraper class
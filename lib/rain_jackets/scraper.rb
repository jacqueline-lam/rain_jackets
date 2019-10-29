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
      
      # Product Price
      elsif tr_index == 2
        product_price_row = tr_element.css("td.compare_items span").each_wtih_index do |td_element, td_index|
          td_value = td_element.text
          all_jackets[td_index].price = td_value #price in string "$149.93"
        end
  
      # Overall score
      elsif tr_index == 3
        overall_rating_row = tr_element.css("div.rating_score")
        overall_rating_row.each_with_index do |rating_score, rating_row_index|
          # rating_score.text is an Intergerç
          all_jackets[rating_row_index].overall_score = rating_score.text
        end
      
      # Pros
      elsif tr_index == 5
        pros_row = tr_element.css("td.compare_items").each_with_index do |td_element, td_index|
          td_value = td_element.text
          all_jackets[td_index].pros = td_value
        end
  
      # Cons
      elsif tr_index == 6
        pros_row = tr_element.css("td.compare_items").each_with_index do |td_element, td_index|
          td_value = td_element.text
          all_jackets[td_index].cons = td_value
        end
      
      # Desciption
      elsif tr_index == 7
        description_row = tr_element.css("td.compare_items").each_with_index do |td_element, td_index|
          td_value = td_element.text
          all_jackets[td_index].description = td_value
        end
      
      # Rating categories (tr_index 11-14): water_resistance_rating, breathability_rating, comfort_rating, weight_rating, packed_size_rating
      elsif tr_index == 9
        tr_element.css("div.rating_score").each_with_index do |rating_score, rating_row_index|
          all_jackets[rating_row_index].water_resistance_rating = rating_score.text
        end
      elsif tr_index == 10
        tr_element.css("div.rating_score").each_with_index do |rating_score, rating_row_index|
          all_jackets[rating_row_index].breathability_rating = rating_score.text
        end
      elsif tr_index == 11
        tr_element.css("div.rating_score").each_with_index do |rating_score, rating_row_index|
          all_jackets[rating_row_index].comfort_rating = rating_score.text
        end
      elsif tr_index == 12
        tr_element.css("div.rating_score").each_with_index do |rating_score, rating_row_index|
          all_jackets[rating_row_index].weight_rating = rating_score.text
        end
      elsif tr_index == 13
        tr_element.css("div.rating_score").each_with_index do |rating_score, rating_row_index|
          all_jackets[rating_row_index].durability_rating = rating_score.text
        end
      elsif tr_index == 14
        tr_element.css("div.rating_score").each_with_index do |rating_score, rating_row_index|
          all_jackets[rating_row_index].packed_size_rating = rating_score.text
        end    
      end # elsif statement
      
      
    end # scrape_jacket_table enumerator 
  end # initialize_jacket_objects
end # ends Scraper class

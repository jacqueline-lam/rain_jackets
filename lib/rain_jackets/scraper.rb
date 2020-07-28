class RainJackets::Scraper

  # Take HTML string returned by open-uri's open method
  # and convert it into a NodeSet
  def get_page
    Nokogiri::HTML(open("https://www.outdoorgearlab.com/topics/clothing-womens/best-rain-jacket-womens"))
  end

  def scrape_jackets_table
    # Use CSS selector to grab all HTML elements that contain a table
    # return array of Nokogiri XML elements representing
    # table described on scraped webpage
    get_page.css("div.content_table_xwide tr")
  end

  # Instantiate jacket objects and assign attributes to each instance
  def initialize_jacket_objects
    all_jackets = []

    # Determines which row you're on, hence which property you're trying to populate
    # Iterate through collection of table rows

    scrape_jackets_table.each_with_index do |tr_element, tr_index|

      # Scrape product Name and URL
      if tr_index == 0
        # Grab the element that contains our desired data
        product_name_row = tr_element.css("div.compare_product_name")

        # Iterate through each of td element and instantiate new jacket
        product_name_row.each do |td_element|
          # Create a new Jacket instance out of each aray element
          # instantiating Jacket objects and giving each jacket object the correct attributes
          new_jacket = RainJackets::Jacket.new
          new_jacket.name = td_element.text #access text content inside an element scraped by Nokogiri
          new_jacket.url = "https://www.outdoorgearlab.com" + td_element.css("a").first.attributes["href"].value
          all_jackets << new_jacket
        end

      # Scrape Price
      elsif tr_index == 2
        product_price_row = tr_element.css("td.compare_items span")
        # Iterate through each td_element (column) and
        # Populate each jacket's price attribute
        product_price_row.each_with_index do |td_element, td_index|
          td_value = td_element.text
          all_jackets[td_index].price = td_value # Price in string "$149.93"
        end

      # Scrape Overall Rating
      elsif tr_index == 3
        overall_rating_row = tr_element.css("div.rating_score")
        # Iterate through each rating_score (column) and
        # Populate each jacket's overall_rating attribute
        overall_rating_row.each_with_index do |rating_score, rating_row_index|
          all_jackets[rating_row_index].overall_rating = rating_score.text #an integer
        end

      # Scrape Pros
      elsif tr_index == 5
        pros_row = tr_element.css("td.compare_items").each_with_index do |td_element, td_index|
          td_value = td_element.text
          all_jackets[td_index].pros = td_value
        end

      # Scrape Cons
      elsif tr_index == 6
        pros_row = tr_element.css("td.compare_items").each_with_index do |td_element, td_index|
          td_value = td_element.text
          all_jackets[td_index].cons = td_value
        end

      # Scrape Description
      elsif tr_index == 7
        description_row = tr_element.css("td.compare_items").each_with_index do |td_element, td_index|
          td_value = td_element.text
          all_jackets[td_index].description = td_value
        end

      # Scrape rating categories if tr_index is between 9-14
      elsif (9..14).include?(tr_index)
        tr_element.css("div.rating_score").each_with_index do |rating_score, rating_row_index|
          jacket = all_jackets[rating_row_index]
          rating_score = rating_score.text

          if tr_index == 9
            jacket.water_resistance_rating = rating_score
          elsif tr_index == 10
            jacket.breathability_rating = rating_score
          elsif tr_index == 11
            jacket.comfort_rating = rating_score
          elsif tr_index == 12
            jacket.weight_rating = rating_score
          elsif tr_index == 13
            jacket.durability_rating = rating_score
          elsif tr_index == 14
            jacket.packed_size_rating = rating_score
          end
        end
      end
    end
    # Store all_jackets array in Jacket class variable @@all
    RainJackets::Jacket.all = all_jackets
  end
end

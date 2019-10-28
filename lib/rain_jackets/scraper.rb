class RainJackets::Scraper

  def get_page
    Nokogiri::HTML(open("https://www.outdoorgearlab.com/topics/clothing-womens/best-rain-jacket-womens"))
  end
  
  def scrape_jackets_table
    self.get_page.css("div.content_table_xwide.compare_table tbody")
  end
  
end
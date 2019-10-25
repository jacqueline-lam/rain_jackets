class BestJackets::Scraper
  def get_page
    doc = Nokogiri::HTML(open("https://www.outdoorgearlab.com/topics/clothing-womens/best-rain-jacket-womens"))
    puts doc
    
  end

end
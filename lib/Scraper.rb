class Scraper

  def self.scrape_page(clinic_url)
    html = open(clinic_url)
    doc = Nokogiri::HTML(html)


    attr_hash = Hash.new

    #doc.css('.')

  end

end

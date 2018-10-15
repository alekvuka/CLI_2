require 'pry'
require 'nokogiri'
require 'open-uri'


class Scraper

  def self.scrape_page(clinic_url)
    html = open(clinic_url)
    doc = Nokogiri::HTML(html)

    




    binding.pry


    attr_hash = Hash.new

    #doc.css('.')

  end

end

Scraper.scrape_page("http://callen-lorde.org/meet-our-providers/")

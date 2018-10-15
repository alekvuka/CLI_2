require 'pry'
require 'nokogiri'
require 'open-uri'


class Scraper

  def self.scrape_page(clinic_url)
    html = open(clinic_url)
    doc = Nokogiri::HTML(html)

    name_title = doc.css(".middleColumn_three").css('h3').first.text
    name =
    titile =

    #team
    #specialties
    #languages

    binding.pry


    attr_hash = Hash.new

    #doc.css('.')

  end

end

Scraper.scrape_page("http://callen-lorde.org/meet-our-providers/")

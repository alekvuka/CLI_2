require 'pry'
require 'nokogiri'
require 'open-uri'


class Scraper

  def self.scrape_page(clinic_url)
    html = open(clinic_url)
    doc = Nokogiri::HTML(html)

    name_qualifications_title = doc.css(".middleColumn_three").css('h3').first.text.split(",")

    name = name_qualifications_title[0]
    qualification = name_qualifications_title[1]
    title = name_qualifications_title[2]

    team_specialties_languages = doc.css(".middleColumn_three").css('ul').first.text.split("\n")
    t_s_l = team_specialties_languages.delete("")



    #specialties
    #languages

    binding.pry


    attr_hash = Hash.new

    #doc.css('.')

  end

end

Scraper.scrape_page("http://callen-lorde.org/meet-our-providers/")

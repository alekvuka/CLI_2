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

    team_specialties_languages = doc.css(".middleColumn_three").css('ul').first.text
    t_s_l_array = team_specialties_languages.split("\n").reject { |n| n == "" }
    #sorted_t_s_l_array
    sorted_t_s_l_array = t_s_l_array.map do |ele|
      ele.gsub(/\w+[:]/, "").strip
      #ele.reject(/\w+[:]/, "").strip
    end



    #specialties
    #languages

    binding.pry


    attr_hash = Hash.new

    #doc.css('.')

  end

end

Scraper.scrape_page("http://callen-lorde.org/meet-our-providers/")

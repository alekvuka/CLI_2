require 'pry'
require 'nokogiri'
require 'open-uri'

require_relative "Providers.rb"


class Scraper

  def self.scrape_page(clinic_url = "http://callen-lorde.org/meet-our-providers/")
    html = open(clinic_url)
    doc = Nokogiri::HTML(html)

    #name_qualifications_title = doc.css(".middleColumn_three").css('h3').first.text.split(",")
    #name = name_qualifications_title[0]
    #qualification = name_qualifications_title[1]
    #title = name_qualifications_title[2]

    #team_specialties_languages = doc.css(".middleColumn_three").css('ul').first.text
    #t_s_l_array = team_specialties_languages.split("\n").reject { |n| n == "" }

    #cleaned_t_s_l_array = t_s_l_array.map do |ele|
    #  ele.gsub(/\w+[:]/, "").strip
    #end

    #team = cleaned_t_s_l_array[0]
    #specialties = cleaned_t_s_l_array[1]
    #languages = cleaned_t_s_l_array[2]


    attr_hash = Hash.new
    array_of_providers = Array.new


    #getting name, qualification and title attributes for a secific provider
    doc.css(".middleColumn_three").css('h3').each do |provider|
      new_hash = Hash.new
      name_qualification_title = provider.text.split(",")
      new_hash[:name] = name_qualification_title[0].gsub(/\w+[MD]/, "").strip
      new_hash[:qualification] = name_qualification_title[1].strip
      if name_qualification_title[2] != nil
        new_hash[:title] = name_qualification_title[2].strip
      end
      array_of_providers << new_hash
    end

    #getting the team, specialties and languages attributes for a specific provider
    i = 0
    doc.css(".middleColumn_three").css('ul').each do |provider|
      team_specialties_languanges = provider.text.split("\n").reject { |n| n == "" }

      #remove words that end with ":"
      team_specialties_languanges = team_specialties_languanges.map do |ele|
        ele.gsub(/\w+[:]/, "").strip
      end

      #accointing for use case where attribute team is missing
      if team_specialties_languanges.size == 2
        array_of_providers[i][:specialties] = team_specialties_languanges[0].strip
        array_of_providers[i][:languages] = team_specialties_languanges[1]

      else
        array_of_providers[i][:team] = team_specialties_languanges[0]
        array_of_providers[i][:specialties] = team_specialties_languanges[1]
        array_of_providers[i][:languages] = team_specialties_languanges[2]

      end

      if i < 46
        i += 1
      end

    end

    #creatign instances from our array of hashes
    array_of_providers.each do |provider|
      Providers.new(provider)

    end

  end
  
end

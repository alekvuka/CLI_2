#this is the class that is responsible for interacting with the user

require_relative "Scraper.rb"
require_relative "Providers.rb"

class CLI


  def initialize(clinic_url = "http://callen-lorde.org/meet-our-providers/")
    Scraper.scrape_page(clinic_url)
  end


  def start

    puts "Choose from the following menu:"
    puts "1) List of all providers"
    puts "2) Details on a specific provider"
    puts "3) List of providers by their team"
    puts "4) List of providers by specialties (Adolescent Health, Family Practice, HIV, Adult Primary Care, Internal Medicine)"

    user_input = gets.strip.to_i


    if valid?(user_input) == true
      if user_input == 1
        choice_1
      elsif user_input == 2
        choice_2
      else
        choice_3
      end
    end
    start

  end

  def valid?(user_input)
    if user_input == 1 || user_input == 2 || user_input == 3
      true
    else
      false
    end
  end


  def choice_1
    puts "=========================="
    all_providers = Providers.all
    all_providers.each do |provider|
      puts provider.name
    end
    puts "=========================="
  end


  def choice_2

    puts "Which provider would you like to know more about?"
    user_input = gets.strip

    all_providers = Providers.all
    req_provider = all_providers.detect do |provider|
      user_input == provider.name
      end

    puts "=============================="
    puts "#{req_provider.name}'s team: #{req_provider.team}"
    puts "#{req_provider.name}'s specialties: #{req_provider.specialties}"
    puts "#{req_provider.name}'s languages: #{req_provider.languages}"
    puts "#{req_provider.name}'s qualifications: #{req_provider.qualifications}"
    puts "=============================="

  end

  def choice_3
    puts "From what team would you like to get a list of providers (Orange, Green, Purple, Blue)"
    user_input = gets.strip

    all_providers = Providers.all

    all_providers.each do |provider|
      if provider.team == user_input
        puts provider.name
      end
    end
  end


end

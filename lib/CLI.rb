#this is the class that is responsible for interacting with the user

require_relative "Scraper.rb"
require_relative "Providers.rb"

class CLI


  def initialize(clinic_url = "http://callen-lorde.org/meet-our-providers/")
    Scraper.scrape_page(clinic_url)
    #self.start
  end


  def start

    Scraper.scrape_page

    puts "Choose from the following menu:"
    puts "1) List of all providers"
    puts "2) Details on a specific provider"

    user_input = gets.strip.to_i

    #binding.pry



    if valid?(user_input) == true
      if user_input == 1
        choice_1
      else
        choice_2
      end
    end
    self.start

  end

  def valid?(user_input)
    if user_input == 1 || user_input == 2
      true
    else
      false
    end
  end


  def choice_1
    all_providers = Providers.all
    all_providers.each do |provider|
      puts provider.name
    end
  end


  def choice_2

    puts "Which provider would you like to know more about?"
    user_input = gets.strip

    all_providers = Providers.all
    req_provider = all_providers.select do |provider|
      user_input == provider.name
      end

      binding.pry

    puts "------------------------------"
    puts req_provider.name
    puts req_provider.team
    puts req_provider.specialties
    puts provider.languages
    puts "------------------------------"

  end

end

#this is the class that is responsible for interacting with the user

class CLI


  def initialize(clinic_url)
    Scraper.scrape_page(clinic_url)
    self.start
  end


  def self.start
    puts "Choose from the following menu:"
    puts "1) List of all providers"
    puts "2) Details on a specific provider"

    user_input = gets.strip

    if valid?(user_input.to_i) == true
      if user_input == 1
        input_1(user_input)
      else
        input_2(user_input)
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

  def input_1(user_input)
    all_providers = Providers.all
    all_providers.each do |provider|
      puts provider.name
    end
  end


  def input_2(user_input)
    all_providers = Providers.all
    req_provider = all_providers.map do |provider|
      user_input == provider.name
      end

    puts "------------------------------"
    puts req_provider.name
    puts req_provider.team
    puts req_provider.specialties
    puts provider.languages
    puts "------------------------------"

  end

end

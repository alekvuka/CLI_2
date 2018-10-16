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
    puts "4) List of providers by their specialty"

    user_input = gets.strip.to_i


    if valid?(user_input) == true
      if user_input == 1
        choice_1
      elsif user_input == 2
        choice_2
      elsif user_input == 3
        choice_3
      else
        choice_4
      end
    end
    start

  end

  def valid?(user_input)
    if user_input == 1 || user_input == 2 || user_input == 3 || user_input == 4
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

    hash_empty?(req_provider)

    binding.pry

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

    return_array = Array.new

    all_providers.each do |provider|
      if provider.team == user_input
        return_array << provider.name
      end
    end

  

    hash_empty?(return_array)

    i = 0
    while i < return_array.size
      puts return_array[i]
      i+=1
    end




  end

  def choice_4
    puts "From what specialty: Adolescent Health, Family Practice, HIV, Adult Primary Care or Internal Medicine"
    user_input = gets.strip

    all_providers = Providers.all

    return_array = Array.new

    all_providers.each do |provider|
      temp_arr = provider.specialties.split(",")
      i = 0
      while i < temp_arr.size
        if temp_arr[i] = user_input
          return_array << provider.name
        end
        i+=1
      end
    end

    hash_empty?(return_array)

    return_array = return_array.uniq

    i = 0
    while i < return_array.size
      puts return_array[i]
      i+=1
    end
  end


  def hash_empty?(test_hash)
    if test_hash == nil || test_hash.empty?
      puts "======================================================================================================"
      puts "!!!!!!!!   The doctor, team or specialty that you have choosen does not exit in this clinic   !!!!!!!!"
      puts "======================================================================================================"
      start
    end
  end


end

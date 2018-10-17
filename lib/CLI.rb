#this is the class that is responsible for interacting with the user

require_relative "Scraper.rb"
require_relative "Providers.rb"
require_relative "Languages.rb"
require_relative "Teams.rb"
require_relative "Printer.rb"


include Printer

class CLI

  def initialize(clinic_url = "http://callen-lorde.org/meet-our-providers/")
    Scraper.scrape_page(clinic_url)
  end

  def start(clinic_url = "http://callen-lorde.org/meet-our-providers/")


    puts "Choose from the following menu:"
    puts "1) List of all providers"
    puts "2) Details on a specific provider"
    puts "3) List of providers by their team"
    puts "4) List of providers by their specialty"
    puts "5) List of providers by their languages"
    puts "6) Get a specific provider's team?"

    user_input = gets.strip.to_i


    valid?(user_input)

    if user_input == 1
      choice_1
    elsif user_input == 2
      choice_2
    elsif user_input == 3
      choice_3
    elsif user_input == 4
      choice_4
    elsif user_input == 5
      choice_5
    else
      choice_6
    end

    start

  end


  #==========================executing on the choice the user made===========================#
  def choice_1

    name_array = Providers.all.map do |provider|
              provider.name
            end
    printer(name_array)

  end


  def choice_2

    puts "Which provider would you like to know more about?"
    user_input = gets.strip

    req_provider = Providers.all.detect do |provider|
      user_input == provider.name
      end

    binding.pry

    return_validator(req_provider)

    puts "=============================="
    if Teams.team_by_provider_name(req_provider.name) != nil
      puts "#{req_provider.name}'s team: #{Teams.team_by_provider_name(req_provider.name)}"
    end
    puts "#{req_provider.name}'s specialties: #{req_provider.specialties}"
    puts "#{req_provider.name}'s languages: #{Languages.languages_by_provider(req_provider)}"
    puts "#{req_provider.name}'s qualifications: #{req_provider.qualifications}"
    if req_provider.title != nil
      puts "#{req_provider.name}'s title: #{req_provider.title}"
    end
    puts "=============================="

  end

  def choice_3

    instances_of_teams = Teams.all

    puts "These are all the current teams:"
    instances_of_teams.each do |team|
      #binding.pry
      puts team.name
    end

    puts "For which team would you like a list of providers?"
    user_input = gets.strip

    puts "Here is the list of providers for providers that are part of #{user_input} team:"
    printer(Teams.providers_by_team(user_input))

  end

  def choice_4

    puts "From what specialty: Adolescent Health, Family Practice, HIV, Adult Primary Care or Internal Medicine"
    user_input = gets.strip

    return_array = Array.new

    Providers.all.each do |provider|
      temp_arr = provider.specialties.split(",")
      i = 0
      while i < temp_arr.size
        if temp_arr[i].strip == user_input
          return_array << provider.name
        end
        i+=1
      end
    end

    return_validator(return_array)
    printer(return_array.uniq)

  end

  def choice_5

    instances_of_languages = Languages.all

    puts "These are all the languages that the current providers speak:"
    instances_of_languages.each do |language|
      puts language.name
    end

    puts "For which one would you like a list of providers?"
    user_input = gets.strip

    puts "Here is the list of providers for providers that speak #{user_input}:"
    instances_of_languages.each do |language|
      if language.name == user_input
        language.providers.each do |provider|
          puts provider.name
        end
      end
    end

  end

  def choice_6

    puts "The provider's name?"
    user_input = gets.strip

    puts "#{user_input}'s team is #{Teams.team_by_provider_name(user_input)}'"


  end

#=================== Helper Methods ====================

  def valid?(user_input)
    if user_input >= 1 && user_input <= 6
      true
    else
      list_right_options
      start
    end
  end

  def return_validator(array_or_hash)

    if array_or_hash == nil
      warning_message
      start

    elsif array_or_hash.instance_of?(Array) && array_or_hash.any? == false
      warning_message
      start

    end
  end

  def printer(arry_to_print)

    puts "<<<<<<<<<<<<                HERE IS THE LIST:                             >>>>>>>>>>>"
    i = 0
    while i < arry_to_print.size
      puts arry_to_print[i]
      i+=1
    end
    puts "^^^^^^               THE PROVIDERS ARE LISTED ABOVE                         ^^^^^^^"
    puts "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"

  end

end

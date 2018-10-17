#this is the class that is responsible for interacting with the user

require_relative "Scraper.rb"
require_relative "Providers.rb"
require_relative "Languages.rb"
require_relative "Teams.rb"
require_relative "Printer.rb"
require_relative "UserInputExe.rb"


include Printer
include UserInputExe

class CLI

  def initialize(clinic_url = "http://callen-lorde.org/meet-our-providers/")
    Scraper.scrape_page(clinic_url)
  end

  def start(clinic_url = "http://callen-lorde.org/meet-our-providers/")

    menu_screen

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

end

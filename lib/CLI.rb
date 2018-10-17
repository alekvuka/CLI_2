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

    Printer::menu_screen

    user_input = gets.strip.to_i

    valid?(user_input)

    if user_input == 1
      UserInputExe::choice_1
    elsif user_input == 2
      UserInputExe::choice_2
    elsif user_input == 3
      UserInputExe::choice_3
    elsif user_input == 4
      UserInputExe::choice_4
    elsif user_input == 5
      UserInputExe::choice_5
    else
      UserInputExe::choice_6
    end

    start

  end

  def valid?(user_input)
    if user_input >= 1 && user_input <= 6
      true
    else
      list_right_options
      start
    end
  end

end


class CLI


  def initialize(clinic_url = "http://callen-lorde.org/meet-our-providers/")
    Scraper.scrape_page(clinic_url)
  end


  def start

    Printer.menu_screen

    user_input = gets.strip.to_i

    valid?(user_input)

    if user_input == 1
      UserInputExe.choice_1
    elsif user_input == 2
      UserInputExe.choice_2
    elsif user_input == 3
      UserInputExe.choice_3
    elsif user_input == 4
      UserInputExe.choice_4
    elsif user_input == 5
      UserInputExe.choice_5
    elsif user_input == 6
      UserInputExe.choice_6
    else
      UserInputExe.choice_7
    end

    start

  end


  def valid?(user_input)
    if user_input >= 1 && user_input <= 7
      true
    else
      Printer.list_right_options
      start
    end
  end

end

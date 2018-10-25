
class CLI


  def initialize(clinic_url = "http://callen-lorde.org/meet-our-providers/")
    Scraper.scrape_page(clinic_url)
  end


  def start

    Printer.menu_screen

    user_input = gets.strip.to_i

    valid?(user_input)

    if user_input == 1
      Printer.print_from_arr_of_o(Provider.all)


    elsif user_input == 2
      puts "Which provider?"
      user_input = gets.strip

      if Provider.all.detect{|provider| user_input.upcase == provider.name.upcase} == nil
        Printer.warning_message
      else
        Printer.print_whole_profile(Provider.all.detect{|provider| user_input.upcase == provider.name.upcase})
      end

    elsif user_input == 3
      array_of_teams = Provider.all.map {|provider| provider.team}.uniq.compact

      Printer.print_from_arr_of_s(array_of_teams)

      puts "Which team?"
      user_input = gets.strip

      Printer.print_from_arr_of_o(Provider.find_by_team(user_input))

    elsif user_input == 4
      array_of_specialties = Provider.all.map {|provider| provider.specialites}.join(",").split(",")
      Printer.print_from_arr_of_s(array_of_specialties.map {|specialty| specialty.strip}.uniq)

      puts "Which specialty?"
      user_input = gets.strip

      Printer.print_from_arr_of_o(Provider.find_by_specialty(user_input))

    elsif user_input == 5
      array_of_languages = Provider.all.map {|provider| provider.languages}.join(",").split(",")
      Printer.print_from_arr_of_s(array_of_languages.map {|language| language.strip}.uniq)

      puts "Which language?"
      user_input = gets.strip

      Printer.print_from_arr_of_o(Provider.find_by_language(user_input))

    elsif user_input == 6
      puts "Which provider?"
      user_input = gets.strip

      provider = Provider.find_by_name(user_input)

      if  provider == nil
        Printer.warning_message_team
      else
        if provider.team == nil
          Printer.warning_message_team
        else
          Printer.print_this(provider.team)
        end
      end

    else
      abort("Thanks so much for using Health Clinic Scraper!")
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

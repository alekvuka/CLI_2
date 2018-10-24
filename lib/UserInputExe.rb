class UserInputExe



  def self.choice_1
    Printer.print_from_arr_of_o(Providers.all)
  end



  def self.choice_2

    puts "Which provider?"
    user_input = gets.strip

    req_provider = Providers.all.detect do |provider|
                        user_input == provider.name
                      end

    if req_provider == nil
      Printer.warning_message
      choice_2
    else
      Printer.print_whole_profile(req_provider)
    end

  end



  def self.choice_3

    array_of_teams = Providers.all.map {|provider| provider.team}.uniq.compact

    Printer.print_from_arr_of_s(array_of_teams)

    puts "Which team?"
    user_input = gets.strip

    Printer.print_from_arr_of_o(Providers.find_by_team(user_input))

  end



  def self.choice_4

    array_of_specialties = Providers.all.map {|provider| provider.specialites}.join(",").split(",")
    Printer.print_from_arr_of_s(array_of_specialties.map {|specialty| specialty.strip}.uniq)

    puts "Which specialty?"
    user_input = gets.strip

    Printer.print_from_arr_of_o(Providers.find_by_specialty(user_input))

  end



  def self.choice_5

    array_of_languages = Providers.all.map {|provider| provider.languages}.join(",").split(",")
    Printer.print_from_arr_of_s(array_of_languages.map {|language| language.strip}.uniq)

    puts "Which language?"
    user_input = gets.strip

    Printer.print_from_arr_of_o(Providers.find_by_language(user_input))

  end



  def self.choice_6

    puts "Which provider?"
    user_input = gets.strip

    provider = Providers.find_by_name(user_input)

    if  provider == nil
      Printer.warning_message_team
    else
      Printer.print_this(provider.team)
    end

  end

end

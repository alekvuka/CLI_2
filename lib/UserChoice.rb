
class UserChoice


  def self.choice_1
    Printer.print_from_arr_of_o(Provider.all)
  end



  def self.choice_2

    puts "Which provider?"
    user_input = gets.strip

    req_provider = Provider.all.detect do |provider|
                        user_input.upcase == provider.name.upcase
                      end

    if req_provider == nil
      Printer.warning_message
    else
      Printer.print_whole_profile(req_provider)
    end

  end



  def self.choice_3

    array_of_teams = Provider.all.map {|provider| provider.team}.uniq.compact

    Printer.print_from_arr_of_s(array_of_teams)

    puts "Which team?"
    user_input = gets.strip

    Printer.print_from_arr_of_o(Provider.find_by_team(user_input))

  end



  def self.choice_4

    array_of_specialties = Provider.all.map {|provider| provider.specialites}.join(",").split(",")
    Printer.print_from_arr_of_s(array_of_specialties.map {|specialty| specialty.strip}.uniq)

    puts "Which specialty?"
    user_input = gets.strip

    Printer.print_from_arr_of_o(Provider.find_by_specialty(user_input))

  end



  def self.choice_5

    array_of_languages = Provider.all.map {|provider| provider.languages}.join(",").split(",")
    Printer.print_from_arr_of_s(array_of_languages.map {|language| language.strip}.uniq)

    puts "Which language?"
    user_input = gets.strip

    Printer.print_from_arr_of_o(Provider.find_by_language(user_input))

  end



  def self.choice_6

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

  end

end

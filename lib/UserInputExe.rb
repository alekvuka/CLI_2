module UserInputExe

  def choice_1

    Printer::print_from_arr_of_o(Providers.all)

  end



  def choice_2

    user_input = Printer::get_provider_name

    req_provider = Providers.all.detect do |provider|
                        user_input == provider.name
                      end

    if req_provider == nil
      Printer::warning_message
      choice_2
    else
      Printer::print_whole_profile(req_provider)
    end

  end



  def choice_3

    instances_of_teams = Teams.all

    Printer::print_from_arr_of_o(instances_of_teams)

    user_input = Printer::get_choice_from_above
    Printer::print_from_arr_of_s(Teams.providers_by_team(user_input))

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

    Printer::print_from_arr_of_s(return_array)

  end



  def choice_5

    instances_of_languages = Languages.all

    Printer::print_from_arr_of_o(instances_of_languages)

    user_input = Printer::get_choice_from_above

    instances_of_languages.each do |language|
      if language.name == user_input
        Printer::print_from_arr_of_o(language.providers)
      end
    end

  end



  def choice_6

    user_input = Printer::get_provider_name

    if Teams.team_by_provider_name(user_input) == nil
      Printer::warning_message_team
    else
      Printer::print_this(Teams.team_by_provider_name(user_input))
    end

  end

end

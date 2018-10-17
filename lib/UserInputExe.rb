module UserInputExe

  def choice_1

    Printer::print_from_arr_of_o(Providers.all)

  end



  def choice_2

    puts "Which provider would you like to know more about?"
    user_input = gets.strip

    req_provider = Providers.all.detect do |provider|
      user_input == provider.name
      end

    return_validator(req_provider)

    Printer::print_whole_profile(req_provider)



  end



  def choice_3

    instances_of_teams = Teams.all

    puts "These are all the current teams:"
    Printer::print_from_arr_of_o(instances_of_teams)

    puts "For which team would you like a list of providers?"
    user_input = gets.strip

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

    #return_validator(return_array)
    Printer::print_from_arr_of_s(return_array)

  end



  def choice_5

    instances_of_languages = Languages.all

    puts "These are all the languages that the current providers speak:"
    Printer::print_from_arr_of_o(instances_of_languages)

    puts "The languages that the current providers speak are listed above."
    puts "For which language would you like a list of providers?"
    user_input = gets.strip
    instances_of_languages.each do |language|
      if language.name == user_input
        Printer::print_from_arr_of_o(language.providers)
      end
    end

  end



  def choice_6

    puts "The provider's name?"
    user_input = gets.strip

    if Teams.team_by_provider_name(user_input) == nil
      puts "The provider does not have a team"
    else
      puts "#{user_input}'s team is #{Teams.team_by_provider_name(user_input)}"
    end

  end


  def return_validator(array_or_hash)

    if array_or_hash == nil
      warning_message
      choice_2


    elsif array_or_hash.instance_of?(Array) && array_or_hash.any? == false
      warning_message
      choice_2

    end
  end


end

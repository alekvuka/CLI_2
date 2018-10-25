
class Printer



  def self.warning_message
    puts "======================================================================================================"
    puts "!!!!!!!!!   The doctor, team or specialty or language that you have choosen does not exit    !!!!!!!!!"
    puts "======================================================================================================"
  end



  def self.warning_message_team
    puts "======================================================================================================"
    puts "!!!!!!!!     You've chosen a doctor that either does not exist or is not part of any team     !!!!!!!!"
    puts "======================================================================================================"
  end



  def self.print_from_arr_of_s(array_to_print)

    if array_to_print.length == 0 || array_to_print == nil
      warning_message
    else
      puts "<<<<<<<<<<<<                HERE IS THE LIST:                             >>>>>>>>>>>"
      i = 0
      while i < array_to_print.size
        puts array_to_print[i]
        i+=1
      end
      puts "^^^^^^                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                       ^^^^^^^"
      puts "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    end

  end



  def self.list_right_options
    puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    puts "!!!!!!  Please enter either 1, 2, 3, 4, 5, 6 or 7  !!!!!!!!!!"
    puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
  end



  def self.menu_screen
    puts "Choose from the following menu:"
    puts "1) List of all providers"
    puts "2) Details on a specific provider"
    puts "3) List of providers by their team"
    puts "4) List of providers by their specialty"
    puts "5) List of providers by their languages"
    puts "6) Get a specific provider's team?"
    puts "7) Exit the program"
  end



  def self.print_from_arr_of_o(instances_of_objects)
    if instances_of_objects == nil || instances_of_objects.size == 0
      warning_message
    else
      puts "<<<<<<<<<<<<                HERE IS THE LIST:                             >>>>>>>>>>>"
      instances_of_objects.each do |object|
        puts object.name
      end
      puts "^^^^^^                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                       ^^^^^^^"
      puts "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    end
  end



  def self.print_whole_profile(provider_instance)

    puts "=============================="
    if provider_instance.team != nil
      puts "#{provider_instance.name}'s team: #{provider_instance.team}"
    end

    specialties_list = ""
    provider_instance.specialites.each {|specialty| specialties_list = "#{specialties_list} #{specialty}"}
    specialties_list = specialties_list.strip.gsub(" ", ", ")

    languages_list = ""
    provider_instance.languages.each {|languages| languages_list = "#{languages_list} #{languages}"}
    languages_list = languages_list.strip.gsub(" ", ", ")


    puts "#{provider_instance.name}'s specialties: #{specialties_list}"
    puts "#{provider_instance.name}'s languages: #{languages_list}"
    puts "#{provider_instance.name}'s qualifications: #{provider_instance.qualifications}"
    if provider_instance.title != nil
      puts "#{provider_instance.name}'s title: #{provider_instance.title}"
    end
    puts "=============================="

  end


  def self.get_choice_from_above
    puts "Please choose from the list above to get the relevant providers:"
    user_input = gets.strip
  end


  def self.print_this(for_printing)
    puts "*****************************************************"
    puts "                #{for_printing}                      "
    puts "*****************************************************"
  end

end

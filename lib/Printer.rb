module Printer

  def warning_message
    puts "======================================================================================================"
    puts "!!!!!!!!   The doctor, team or specialty that you have choosen does not exit in this clinic   !!!!!!!!"
    puts "======================================================================================================"
  end


  def print_from_arr_of_s(array_to_print)

    puts "<<<<<<<<<<<<                HERE IS THE LIST:                             >>>>>>>>>>>"
    i = 0
    while i < array_to_print.size
      puts array_to_print[i]
      i+=1
    end
    puts "^^^^^^                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                       ^^^^^^^"
    puts "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"

  end


  def list_right_options
    puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    puts "!!!!!!!!!!!!!  Please enter either 1, 2, 3 or 4  !!!!!!!!!!!!"
    puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
  end

  def menu_screen
    puts "Choose from the following menu:"
    puts "1) List of all providers"
    puts "2) Details on a specific provider"
    puts "3) List of providers by their team"
    puts "4) List of providers by their specialty"
    puts "5) List of providers by their languages"
    puts "6) Get a specific provider's team?"
  end

  def print_from_arr_of_o(instances_of_objects)

    puts "<<<<<<<<<<<<                HERE IS THE LIST:                             >>>>>>>>>>>"
    instances_of_objects.each do |object|
      puts object.name
    end
    puts "^^^^^^                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                       ^^^^^^^"
    puts "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"

  end




end

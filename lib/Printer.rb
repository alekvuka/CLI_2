module Printer

  def warning_message
    puts "======================================================================================================"
    puts "!!!!!!!!   The doctor, team or specialty that you have choosen does not exit in this clinic   !!!!!!!!"
    puts "======================================================================================================"
  end

  def print_lists(array_to_print)

    puts "<<<<<<<<<<<<                HERE IS THE LIST:                             >>>>>>>>>>>"
    i = 0
    while i < arry_to_print.size
      puts arry_to_print[i]
      i+=1
    end
    puts "^^^^^^               THE PROVIDERS ARE LISTED ABOVE                         ^^^^^^^"
    puts "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"

  end

  def list_right_options
    puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    puts "!!!!!!!!!!!!!  Please enter either 1, 2, 3 or 4  !!!!!!!!!!!!"
    puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
  end

end

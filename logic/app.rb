class App
  def run_app
    choose_a_number
  end

  def choose_a_number
    puts
    puts 'Please choose an option by entering a number:'
    puts '1 - Work with book'
    puts '2 - Work with music album'
    puts '3 - Work with Game'
    puts '4 - Exit'

    user_selection = gets.chomp
    action_based_on_number_choosed user_selection
  end

  def action_based_on_number_choosed(option)
    case option
    when '1'
      puts 'work with book'
    when '2'
      puts 'work with music album'
    when '3'
      puts 'work with Game'
    else
      exit
    end
  end
end

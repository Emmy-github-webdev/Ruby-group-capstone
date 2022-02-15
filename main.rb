Dir['./classes/*.rb'].sort.each { |file| require file}
require_relative 'logic/app'

def main
  optionselected = DisplayMenuOption.new
  loop do
    optionselected.menu
    user_choice = gets.chomp.to_i
    optionselected.option(user_choice)
    break if user_choice == 4
  end
end

main

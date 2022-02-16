require 'colorize'
require_relative 'editorial'

class BookLogic
  def initialize
    @editorial = Editorial.new
  end

  def show_menu
    puts 'What do you wish to do? Please enter the number of your choice'.blue
    puts '--------------------------------------------------------------------'.white
    puts '1.- List all books'.green
    puts '2.- List all Labels'.green
    puts '3.- Add a book'.green
    puts '0.- Close App'.light_green
  end

  def start
    show_menu
    response = gets.chomp
    @editorial.fetch_books
    case response
    when '1'
      @editorial.list_books
      start
    when '2'
      @editorial.list_labels
      start
    when '3'
      @editorial.add_book
      puts 'Book Created Successfully'.light_blue
      start
    when '0'
      puts 'GoodBye'.blue
    else
      puts 'Not a valid option, please try again'.red
      start
    end
  end
end

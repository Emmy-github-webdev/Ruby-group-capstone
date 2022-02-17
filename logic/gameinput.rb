require_relative './addgame'

class GameInput
  def initialize
    @add_game = AddGame.new
  end

  def show_menu
    puts 'Choice the game operation you want to perform'
    puts '1.- List all games'
    puts '2.- List all authors'
    puts '3.- Add a game'
    puts '4.- Close App'
  end

  def start
    show_menu
    response = gets.chomp
    @add_game.fetch_games
    case response
    when '1'
      @add_game.list_games
      start
    when '2'
      @add_game.list_authors
      start
    when '3'
      @add_game.add_game
      puts 'Game Created Succesfully'
      start
    when '4'
      puts 'GoodBye'
    else
      puts 'Not a valid option, please try again'
      start
    end
  end
end
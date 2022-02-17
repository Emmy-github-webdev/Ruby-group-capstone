require_relative './addgame.rb'
require_relative './listauthor.rb'

class GameInput
    def initialize
        @add_game = AddGame.new
    end

    def show_menu
        puts 'Would you like to add a game, fetch all games, list authors?'
        puts '1.- List all games'
        puts '2.- Add a game'
        puts '3.- List all authors'
        puts '4.- Exit'
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
          @add_game.add_game
          puts 'Game Created Succesfully'
          start
        when '3'
          @add_game.fetch_games
          @add_game.list_games
          start
        when '4'
          puts 'Exiting...'
        else
          puts 'Not a valid option, please try again'
          start
        end
    end
end
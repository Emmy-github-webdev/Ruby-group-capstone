require_relative '../classes/game.rb'
require 'json'
require 'date'

class AddGame
    attr_accessor :game_item

    def initialize
        @game_items = []
    end

    def add_game
        print 'First Name: '
        first_name = gets.chomp.capitalize!
        print 'Last Name'
        last_name = gets.chomp.capitalize!
        author = first_name + last_name
        print 'Genre'
        genre = gets.chomp.capitalize!
        print 'Multiplayer: true or false'
        multi_player = gets.chomp
        print 'Publish Date'
        publish_date = gets.chomp

        new_game = Game.new(first_name, last_name, author, genre, multi_player, publish_date)
        @game_items << new_game
        save_game
    end

    def save_game
        games_array = @game_items.map do |game_item|
            if defined? (game_item['genre'])
                {
                    genre: game_item['genre'],
                    first_name: game_item['first_name'],
                    last_name: game_item['last_name'],
                    author: game_item['author'],
                    multi_player: game_item['multi_player'],
                    publish_date: game_item['publish_date']
                }
            else {
                genre: game_item.genre,
                first_name: game_item.first_name,
                last_name: game_item.last_name,
                author: game_item.author,
                multi_player: game_item.multi_player,
                publish_date: game_item.publish_date
            }
            end
        end
        File.write('./data/game.json', games_array.to_json)
    end

    def list_games
        puts 'list of games'
        @game_items.each_with_index do |game_name, game_index|
            puts "#{game_index + 1} author #{game_name['author']} + #{game_name['multi_player']} + publish date #{game_name['publish_date']}"
        end
    end

    def list_authors
        puts 'list of authors'
        @game_items.each_with_index do |game_name, game_index|
            puts "#{game_index + 1} #{game_name['author']} "
        end
    end

    def fetch_games
        exists = false
        exists = true if File.exist? ('./data/game.json')
        unless f = File.open('./data/game.json', 'w+')
            f.write(JSON.generate([]))
            f.close
        end
        game_file = File.open('./data/game.json', 'r+')
        data = game_file.read
        @game_items = JSON.parse(data)
    end
end

require_relative '../classes/game'
require 'json'
require 'date'

class AddGame
  def initialize
    @games = []
  end
  attr_accessor :games

  def add_game
    puts 'Author: '
    author = gets.chomp.capitalize!
    puts 'Is this game Multiplayer? [True/False]: '
    multiplayer = gets.chomp.downcase
    puts 'When was the last time you played this game (yyyy): '
    last_played_at = gets.chomp
    puts 'Whats the publish year of the game?'
    publish_date = gets.chomp.to_i(10)
    new_game = Game.new(multiplayer, last_played_at, publish_date, author)
    @games << new_game
    save_games
  end

  def list_games
    @games.each do |game|
      puts "Author: #{game['author']},
        Multiplayer: #{game['multiplayer']},
        Last_played_at: #{game['last_played_at']},
        Publish_date: #{game['publish_date']}"
    end
  end

  def list_authors
    @games.each do |author|
      puts (author['author']).to_s
    end
  end

  def save_games
    arr = @games.map do |game|
      if defined?(game.author)
        { author: game.author,
          multiplayer: game.multiplayer,
          last_played_at: game.last_played_at,
          publish_date: game.publish_date }
      else
        { author: game['author'],
          multiplayer: game['multiplayer'],
          last_played_at: game['last_played_at'],
          publish_date: game['publish_date'] }
      end
    end
    File.write('./data/game.json', arr.to_json)
  end

  def fetch_games
    exists = false
    exists = true if File.exist?('./data/game.json')
    unless exists
      f = File.open('./data/game.json', 'w+')
      f.write(JSON.generate([]))
      f.close
    end
    game_file = File.open('./data/game.json', 'r+')
    data = game_file.read
    @games = JSON.parse(data)
  end
end

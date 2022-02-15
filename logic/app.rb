Dir['../classes/*.rb'].sort.each { |file| require file}
require_relative 'logic_app'

class MusicAlbumCreation
  def initialize
    @appData = Logic.new
    @musicalbs = @appData.fetch_musicalbum
  end

  attr_reader :musicalbs

  def addMusicAlbum(name, on_spotify, publish_date, genre, author, label)
    @musicalbs << MusicAlbum.new(name, on_spotify, publish_date, genre, author, label)    
  end

  def create_musicalbum
    puts 'Do you want to add new music album, list music album, or list all genres?'
    user_option = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'On spotify (true or false)?: '
    on_spotify = gets.chomp
    print 'Publised date (dd/mm/yyyy): '
    publish_date = gets.chomp
    print 'Genre: '
    genre = gets.chomp
    print 'Author: '
    author = gets.chomp
    print 'label: '
    label = gets.chomp

    addMusicAlbum(name, on_spotify, publish_date, genre, author, label)
  end
  
  def list_musicalbums
    @musicalbs.each_with_index do |musicalb, i|
      puts "#{i} - Genre: #{musicalb.genre}, Published Date: #{musicalb.publish_date}, On Spotify: #{musicalb.on_spotify}"
    end
  end 
  
end















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

require 'json'
Dir['../classes/*.rb'].sort.each { |file| require file}
require_relative 'logic_app'

class MusicAlbumCreation
  def initialize
    @appdata = Logic.new
    @musicalbums = @appdata.fetch_musicalbum
  end

  attr_reader :musicalbums

  def addmusicalbum(genre, author, publish_date, on_spotify)
    new_musicalbum = MusicAlbum.new(genre, author, publish_date, on_spotify)
    @musicalbums.push(new_musicalbum)
    puts 'Album created successfully'
  end

  def create_musicalbum
    print 'Genre: '
    genre = gets.chomp
    genre.capitalize!
    print 'Author: '
    author = gets.chomp
    print 'Publised date (dd/mm/yyyy): '
    publish_date = gets.chomp
    print 'On spotify (true or false)?: '
    on_spotify = gets.chomp
    addmusicalbum(genre, author, publish_date, on_spotify)
  end
  
  def list_musicalbums
    @musicalbums.each_with_index do |musicalb, i|
      puts "#{i} - Genre: #{musicalb.genre}, Author: #{musicalb.author}, Published Date: #{musicalb.publish_date}, On Spotify: #{musicalb.on_spotify}"
    end
  end 

  def add_musicalbum_or_list_musicalbum
    puts 'Do you want to add new music album (1), list music album (2), or list all genres?'
    user_option = gets.chomp
    user_option == '1' ? create_musicalbum : list_musicalbums
  end
end

class GenreList
  def initialize
    @appdata = Logic.new
    @genredata = @appdata.fetch_genre
  end

  attr_reader :genredata 

  def list_genres
    @genredata.each_with_index do |genredat, i|
      puts "#{i} - #{genredat.name}"
    end
  end
  
end

class NoteOperation
  def initialize
    @add_musicalbum = MusicAlbumCreation.new
    @appdata = Logic.new(@add_musicalbum)
  end

  def work_with_music(user_input)
    case user_input
    when 2
      @add_musicalbum.add_musicalbum_or_list_musicalbum
    end
  end

  def exit_operation(user_input)
    case user_input
    when 4
      @appdata.save_data_to_file
      puts 'Exiting...'
    else
      puts 'Incorrect selection'
    end
  end
  
end

class DisplayMenuOption

  def initialize
    @choices = ['Work with book', 'Work with music album', 'Work with Game', 'Exit']
    @noteoperation = NoteOperation.new
  end

  def menu
    puts 'Please choose an option by entering a number:'
    @choices.each_with_index { |choice, i| puts "#{i + 1}. #{choice}"}
  end

  def option(user_choice)
    case user_choice
    when 1
      puts 'Work with book'
    when 2
      @noteoperation.work_with_music(user_choice)
    when 3
      puts 'Work with game'
    else
      @noteoperation.exit_operation(user_choice)
    end
  end
  
end

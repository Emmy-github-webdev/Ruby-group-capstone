require_relative './add_music_album'
require_relative './list_genre'

class AlbumInput
  def initialize
    @add_album = AddMusicAlbum.new
  end

  def show_menu
    puts 'Would you like to add a music ablum, fetch all ablums, or genres?'
    puts '1.- List all albums'
    puts '2.- Add a music album'
    puts '3.- List all Genres'
    puts '4.- Exit'
  end

  def start
    show_menu
    response = gets.chomp
    @add_album.fetch_albums
    case response
    when '1'
      @add_album.list_albums
      start
    when '2'
      @add_album.add_albums
      puts 'Book Created Succesfully'
      start
    when '3'
      @add_album.fetch_albums
      @add_album.list_genres
      start
    when '4'
      puts 'Exiting...'
    else
      puts 'Not a valid option, please try again'
      start
    end
  end
end
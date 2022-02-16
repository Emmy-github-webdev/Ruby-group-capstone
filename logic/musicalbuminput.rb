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

  
end
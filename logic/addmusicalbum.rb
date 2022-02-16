require_relative './classes/musicalbum'
require 'json'
require 'date'

class AddMusicAlbum
  def initialize
    @albums = []
  end
  attr_accessor :albums

  def list_albums
    puts 'List of all albums: '
    @albums.each_with_index do |album, indx|
      puts " #{indx + 1}). Author: #{album['author']},
        Genre: #{album['genre']},
        Publish date: #{album['publish_date']},
        On Spotify?: #{album['on_spotify']}".light_blue
    end
  end

end
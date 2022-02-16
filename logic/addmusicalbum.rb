require_relative '../classes/musicalbum'
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
        On Spotify?: #{album['on_spotify']}"
    end
  end

  def list_genres
    puts 'List of all Genre:'
    @albums.each_with_index do |album, indx|
      puts " #{indx + 1}) #{album['genre']}"
    end
  end

  def add_albums
   
    print 'Published_Date(dd/mm/yyyy): '
    publish_date = gets.chomp
    print 'Author: '
    author = gets.chomp.capitalize!
    print 'On spotify?: '
    on_spotify = gets.chomp.capitalize!
    print 'Genre: '
    genre = gets.chomp.capitalize!
    

    temp_album = MusicAlbum.new(publish_date, genre, author, on_spotify)

    @albums << temp_album
    save_albums
  end

  def save_albums
    arr = @albums.map do |album|
      if defined?(album['genre'])
        {
          genre: album['genre'],
          publish_date: album['publish_date'],
          author: album['author'],
          on_spotify: album['on_spotify']
        }
      else
        {
          genre: album.genre,
          publish_date: album.publish_date,
          author: album.author,
          on_spotify: album.on_spotify
        }
      end
    end
    File.write('./data/musicalbum.json', arr.to_json)
  end

  def fetch_albums
    exists = false
    exists = true if File.exist?('./data/musicalbum.json')
    unless exists
      f = File.open('./data/musicalbum.json', 'w+')
      f.write(JSON.generate([]))
      f.close
    end
    album_file = File.open('./data/musicalbum.json', 'r+')
    data = album_file.read
    @albums = JSON.parse(data)
  end
end
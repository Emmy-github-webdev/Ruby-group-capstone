class Logic
  def initialize(add_musicalbum = {})
    @add_musicalbum = add_musicalbum
    @musicalbum_array = []
  end

  def save_data_to_file
    add_new_musicalbum
  end

  def fetch_musicalbum
    musicalbums = []
    return [] unless File.exist?('./data/musicalbum.json')
    
    musicalbum_array = JSON.parse(File.read('./data/musicalbum.json'))
    musicalbum_array.each { |musicalbum_items| 
      musicalbums << MusicAlbum.new(
        musicalbum_items['genre'],
        musicalbum_items['author'],
        musicalbum_items['published_date'],
        musicalbum_items['on_spotify']
      ) 
    }
    musicalbums
  end

  def fetch_genre(genres)
    puts 'Genre list is empty' if genres.empty?
    genres.each_with_index do |album, index|
      puts "#{index + 1} - Genre: #{album['genre']}"
    end
  end
  
  def add_new_musicalbum
    @add_musicalbum.musicalbums.each { |musicalbum|
      @musicalbum_array << {
        'genre' => musicalbum.genre,
        'author' => musicalbum.author,
        'publish_date' => musicalbum.publish_date,
        'on_spotify' => musicalbum.on_spotify
      }
    }
    File.write('./data/musicalbum.json', JSON.dump(@musicalbum_array))
  end
end

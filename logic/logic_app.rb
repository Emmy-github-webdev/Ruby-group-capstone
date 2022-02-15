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
        musicalbum_items['name'],
        musicalbum_items['genre'],
        musicalbum_items['on_spotify'],
        musicalbum_items['published_date'],
        musicalbum_items['author'],
        musicalbum_items['label']
      ) 
    }
    musicalbums
  end

  def fetch_genre(genres)
    puts 'Genre list is empty' if genres.empty?
    genres.each_with_index do |genre, index|
      puts "#{index} - class: #{genre['class']}, #{genre['name']}"
    end
  end
  
  def add_new_musicalbum
    @add_musicalbum.musicalbums.each { |musicalbum|
      @musicalbum_array << {
        'name' => musicalbum.name,
        'on_spotify' => musicalbum.on_spotify,
        'publish_date' => musicalbum.publish_date,
        'genre' => musicalbum.genre,
        'author' => musicalbum.author,
        'label' => musicalbum.label
      }
    }
    File.write('./data/musicalbum.json', JSON.dump(@musicalbum_array))
  end
end

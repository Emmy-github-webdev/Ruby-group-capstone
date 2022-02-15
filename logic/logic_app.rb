class Logic
  def initialize(add_musicalbum = {})
    @add_musicalbum = add_musicalbum
    @musicalbum_array = []
  end

  def fetch_musicalbum
    musicalbums = []
    return [] unless musicalbum.exist?

    musicalbum
  end

  def self.fetch_genre(genres)
    puts 'Genre list is empty' if genres.empty?
    genres.each_with_index do |genre, index|
      puts "#{index} - class: #{genre['class']}, #{genre['name']}"
    end
  end
  

  def add_new_musicalbum
    @add_musicalbum.musicalbums.each do |musicalbum|
      @musicalbum_array << {
        'name' => musicalbum.name,
        'on_spotify' => musicalbum.on_spotify,
        'publish_date' => musicalbum.publish_date,
        'genre' => musicalbum.genre,
        'author' => musicalbum.author,
        'label' => musicalbum.label
      }
    end
  end
end

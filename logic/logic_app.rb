class Logic
  def initialize(add_musicalbum = {})
    @add_musicalbum = add_musicalbum
    @musicalbum_array = []
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
  end 
end

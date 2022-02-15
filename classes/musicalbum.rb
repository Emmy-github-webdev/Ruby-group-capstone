require_relative 'item'

class MusicAlbum < Item
  def initialize(genre, publish_date, on_spotify: false)
    @on_spotify = on_spotify
    super(publish_date, genre: genre)
  end

end


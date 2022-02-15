require_relative 'item'

class MusicAlbum < Item
  def initialize(genre, publish_date, on_spotify: false)
    @on_spotify = on_spotify
    super(publish_date, genre: genre)
  end

  def can_be_archived?
    @publish_date > 10 && @on_spotify
  end
end

#p MusicAlbum.new('2Face', '2/10/2010', on_spotify: true)

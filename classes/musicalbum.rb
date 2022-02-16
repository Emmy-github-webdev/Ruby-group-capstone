require_relative 'item'

class MusicAlbum < Item
  attr_accessor :archive, :publish_date, :author, :on_spotify

  def initialize(genre, publish_date, author, on_spotify)
    @on_spotify = on_spotify
    super(genre, publish_date, author )
  end

  def can_be_archived?
    return true if super && @on_spotify == true

    false
  end
end

# p MusicAlbum.new('Comedy', '2Face', '2/10/2010', on_spotify: true)

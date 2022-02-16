require 'date'

class Item
  attr_accessor :genre
  attr_reader :archived, :author, :publish_date
  attr_writer :label

  def initialize(publish_date, genre = nil, label = 'undefined', author)
    @id = Random.rand(1...10_000_000)
    @archived = false
    @publish_date = publish_date
    @genre = genre
    @author = author
    @label = label
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def add_genre(genre)
    @genre = genre
    @genre.item.push(self) unless @genre.include?(genre)
  end

  def can_be_archived?
    date = DateTime.now.year
    return true if date - @publish_date > 10

    false
  end
end

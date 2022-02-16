require_relative 'item'

class Book < Item
  def initialize(publish_date, publisher, cover_state, author = 'unknown')
    super(publish_date, author)
    @publisher = publisher
    @cover_state = cover_state
    @label = nil
  end
  attr_accessor :label
  attr_reader :publish_date, :publisher, :cover_state

  def can_be_archived?
    return true if super || @cover_state == 'bad'

    false
  end
end

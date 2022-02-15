require 'date'

class Item
  def initialize(publish_date)
    @id = Random.rand(1...10_000_000)
    @archived = false
    @publish_date = publish_date
  end
  attr_reader :archived

  def can_be_archived?
    date = DateTime.now.year
    return true if date - @publish_date > 10

    false
  end

  def move_to_archive
    @archived = can_be_archived?
  end
end

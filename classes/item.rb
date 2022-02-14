require 'date'

class Item
  def initialize(publish_date)
    @id = Random.rand(1...10_000_000)
    @archived = false
    @publish_date = publish_date
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    date = DateTime.now.year
    p date, @publish_date, date - @publish_date
    return true if date - @publish_date > 10

    false
  end
end
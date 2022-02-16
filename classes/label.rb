class Label
  def initialize(title, color)
    @title = title.capitalize
    @color = color.capitalize
    @label_id = Random.rand(0...10_000_000)
    @items = []
  end

  attr_reader :title, :color

  def add_item(book)
    book.label = { label_id: @label_id, title: @title, color: @color }
    @items << book
  end
end

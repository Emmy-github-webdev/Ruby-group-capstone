class Genre
  attr_accessor :name
  attr_reader :items

  def initialize(name)
    @name = name
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.gnre = self
  end
    
end

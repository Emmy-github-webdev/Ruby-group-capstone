class Genre
  attr_accessor :name
  attr_reader :items

  def initialize(name)
    @name = name
    @items = []
  end
end

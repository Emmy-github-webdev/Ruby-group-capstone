require_relative 'item'

class Author < Item
    attr_accessor :first_name, :last_name, :items

    def initialize(first_name, last_name)
        @first_name = first_name
        @last_name = last_name
        @items = []
    end

    def add_item(item)
        @items.push(item)
        item.author = self
    end
end


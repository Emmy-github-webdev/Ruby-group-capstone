require_relative 'item'

class Game < Item
    attr_accessor :archive, :publish_date, :author, :last_played_at, :multiplayer, :genre

    def initialize(last_played_at, multiplayer, author, publish_date, genre)
        @last_played_at = last_played_at
        @multiplayer = multiplayer
        super(publish_date, author, genre)
    end

    def can_be_archived?
        return true if super && last_played_at == true
        false
    end

end
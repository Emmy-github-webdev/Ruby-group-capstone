require_relative 'item'
require 'date'

class Game < Item
  attr_accessor :last_played_at, :multiplayer, :publish_date

  def initialize(author, multiplayer, last_played_at, publish_date)
    super(author, publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  private

  def can_be_achived?()
    date = DateTime.now.year
    return true if super && date - @last_played_at > 2

    false
  end
end

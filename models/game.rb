require_relative 'item'
require_relative 'date'

class Game < Item
  attr_accessor :multiplayer :last_played_at

  def initialize(multiplayer, last_played_at, genre, source, author, label, publish_date)
    super(genre, author, source, label, publish_date)
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)
  end
end
require 'date'
require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(options)
    super(options[:genre], options[:author], options[:label], options[:publish_date])
    @multiplayer = options[:multiplayer]
    @last_played_at = Date.parse(options[:last_played_at])
  end

  def can_be_archived?
    super || (Date.today - @last_played_at) > (2 * 365)
  end
end

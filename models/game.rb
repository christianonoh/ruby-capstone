require 'date'
require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :id

  def initialize(options)
    super(options[:genre], options[:author], options[:label], options[:publish_date])
    @multiplayer = options[:multiplayer]
    @last_played_at = Date.parse(options[:last_played_at])
  end

  def can_be_archived?
    super || (Date.today - @last_played_at) > (2 * 365)
  end

  def to_hash
    {
      genre: @genre.to_hash,
      author: @author.to_hash,
      label: @label.to_hash,
      publish_date: @publish_date.to_s,
      multiplayer: @multiplayer,
      last_played_at: @last_played_at.to_s
    }
  end
end

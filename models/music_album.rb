require 'date'
require_relative 'item'

class MusicAlbum < Item
  attr_accessor :genre, :on_spotify

  def initialize(options)
    super(options[:genre], options[:author], options[:label], options[:publish_date], archived: options[:archived])
    @on_spotify = options[:on_spotify] || false
  end

  def can_be_archived?
    super && @on_spotify
  end

  def to_hash
    {
      id: @id,
      genre: @genre.to_hash,
      author: @author.to_hash,
      label: @label.to_hash,
      publish_date: @publish_date.to_s,
      archived: @archived,
      on_spotify: @on_spotify
    }
  end
end

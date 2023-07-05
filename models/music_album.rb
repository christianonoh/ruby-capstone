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
end

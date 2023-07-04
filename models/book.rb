require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(options)
    super(options[:genre], options[:author], options[:label], options[:publish_date], archived: options[:archived])
    @publisher = options[:publisher]
    @cover_state = options[:cover_state]
  end

  def can_be_archived?
    super || @cover_state.downcase == 'bad'
  end
end

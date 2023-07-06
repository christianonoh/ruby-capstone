require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state, :title, :publish_date

  def initialize(options)
    super(options[:genre], options[:author], options[:label], options[:publish_date], archived: options[:archived])
    @title = options[:title]
    @author = options[:author]
    @publisher = options[:publisher]
    @cover_state = options[:cover_state]
  end

  def can_be_archived?
    super || (@cover_state && @cover_state.downcase == 'bad')
  end

  def to_hash
    {
      id: @id,
      genre: @genre.to_hash,
      author: @author.to_hash,
      label: @label.to_hash,
      publish_date: @publish_date.to_s,
      publisher: @publisher,
      cover_state: @cover_state
    }
  end
end

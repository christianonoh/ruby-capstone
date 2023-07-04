require_relative 'item'

class Author
  attr_reader :id, :first_name, :last_name, :items

  def initialize(first_name, last_name)
    @id = Random.rand(1...1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    if item.instance_of?(Item)
      unless @items.include?(item)
        @items << item
        item.author = self
      end
    else
      raise ArgumentError, 'Invalid item provided.'
    end
  end
end

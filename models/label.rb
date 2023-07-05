require_relative 'item'

class Label
  attr_reader :title, :color, :items, :id

  def initialize(title, color, id = nil)
    @id = id || Random.rand(1..1_000_000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    return unless item.is_a?(Item) && !@items.include?(item)

    item.label = self
    @items << item
  end

  def to_hash
    {
      id: @id,
      title: @title,
      color: @color,
      items: @items.map(&:to_hash)
    }
  end
end

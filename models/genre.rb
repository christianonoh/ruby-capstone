class Genre
  attr_accessor :id, :name, :items

  def initialize(name)
    @id = Random.rand(1..10_000)
    @name = name
    @items = []
  end

  def add_item(item)
    return unless item.is_a?(Item) && !@items.include?(item)

    item.genre = self
    @items << item
  end

  def to_hash
    {
      id: @id,
      name: @name
    }
  end
end

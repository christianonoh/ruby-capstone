class Genre

    attr_accessor :id, :name, :items

    def initialize(name)
        @id = Random.rand(1..10_000)
        @name = name
        @items = []
    end

    def add_item(item)
        @items << item
    end
end
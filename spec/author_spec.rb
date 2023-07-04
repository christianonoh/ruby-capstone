require_relative '../models/author'
require_relative '../models/item'

describe Author do
  describe '#add_item' do
    let(:author) { Author.new('John', 'Doe') }

    context 'when adding a valid item' do
      it 'adds the item to the author\'s list of items' do
        item = Item.new('Fantasy', nil, 'Book 1', '2020-01-01')

        author.add_item(item)

        expect(author.items).to include(item)
      end

      it 'sets the item\'s author to the current author instance' do
        item = Item.new('Mystery', nil, 'Book 2', '2021-06-01')

        author.add_item(item)

        expect(item.author).to eq(author)
      end
    end

    context 'when adding an invalid item' do
      it 'raises an ArgumentError' do
        invalid_item = 'Invalid item'

        expect { author.add_item(invalid_item) }.to raise_error(ArgumentError)
      end
    end

    context 'when adding the same item multiple times' do
      it 'adds the item only once' do
        item = Item.new('Sci-Fi', nil, 'Book 3', '2019-03-01')

        author.add_item(item)
        author.add_item(item)

        expect(author.items.size).to eq(1)
      end
    end
  end
end

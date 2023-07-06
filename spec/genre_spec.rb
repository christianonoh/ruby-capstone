require './models/genre'
require './models/item'

describe Genre do
  let(:genre) { Genre.new('Rock') }
  let(:item) { Item.new(genre, 'John Doe', 'Album', '2023-01-01') }

  describe '#new' do
    it 'returns a new Genre object' do
      expect(genre).to be_an_instance_of(Genre)
    end
  end

  describe '#name' do
    it 'returns the correct name' do
      expect(genre.name).to eq('Rock')
    end
  end

  describe '#add_item' do
    context 'when adding an instance of Item' do
      it 'adds the item to the items array and assigns the genre' do
        genre.add_item(item)
        expect(genre.items).to include(item)
        expect(item.genre).to eq(genre)
      end
    end

    context 'when adding an object that is not an instance of Item' do
      it 'does not add the item to the items array' do
        genre.add_item('punk')
        expect(genre.items).to be_empty
      end
    end
  end
end

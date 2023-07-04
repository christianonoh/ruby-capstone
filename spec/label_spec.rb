require 'rspec'
require_relative '../models/label'

RSpec.describe Label do
  describe '#add_item' do
    let(:label) { Label.new('Fantasy', 'blue') }

    context 'when item is an instance of Item and not already in items' do
      it 'adds the item to the label' do
        item = Item.new('Fiction', 'John Doe', 'Book 1', '2022-01-01')
        label.add_item(item)
        expect(label.items).to include(item)
      end
    end

    context 'when item is not an instance of Item' do
      it 'does not add the item to the label' do
        item = 'Not an item object'
        label.add_item(item)
        expect(label.items).to be_empty
      end
    end

    context 'when item is already in items' do
      it 'does not add the item to the label' do
        item = Item.new('Fiction', 'John Doe', 'Book 1', '2022-01-01')
        label.add_item(item)
        label.add_item(item) # Adding the same item again
        expect(label.items.count(item)).to eq(1)
      end
    end
  end
end

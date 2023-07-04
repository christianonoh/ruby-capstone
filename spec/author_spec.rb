require_relative '../models/author'
require_relative '../models/item'

RSpec.describe Author do
  let(:author) { Author.new("John", "Doe") }
  let(:item) { Item.new("Fiction", author, "Book", "2022-01-01") }

  describe "#initialize" do
    it "sets the first name, last name, id, and initializes an empty items array" do
      expect(author.first_name).to eq("John")
      expect(author.last_name).to eq("Doe")
      expect(author.id).to be_a(Integer)
      expect(author.items).to eq([])
    end
  end

  describe "#add_item" do
    context "when a valid item is provided" do
      it "adds the item to the items array and sets the author property of the item" do
        author.add_item(item)
        expect(author.items).to contain_exactly(item)
        expect(item.author).to eq(author)
      end
    end

    context "when an invalid item is provided" do
      it "raises an ArgumentError" do
        expect { author.add_item("Invalid Item") }.to raise_error(ArgumentError, "Invalid item provided.")
      end
    end

    context "when the same item is added multiple times" do
      it "does not add duplicates to the items array" do
        author.add_item(item)
        author.add_item(item)
        expect(author.items).to contain_exactly(item)
      end
    end
  end
end

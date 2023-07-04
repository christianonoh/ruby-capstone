require './models/genre'

describe Genre do
    let(:genre) { Genre.new("Rock") }
        
    describe '#new' do
        it "returns a new Genre object" do
        expect(genre).to be_an_instance_of(Genre)
        end
    end
    
    describe '#name' do
        it "returns the correct name" do
        expect(genre.name).to eq("Rock")
        end
    end
    
    
    describe '#add_item' do
        it "adds an item to the items array" do
        genre.add_item("punk")
        expect(genre.items).to eq(["punk"])
        end
    end
    end
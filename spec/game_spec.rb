require_relative '../models/game'

RSpec.describe Game do
  let(:author) { Author.new("John", "Doe") }
  let(:options) do
    {
      genre: "Action",
      author: author,
      label: "Game of the Year",
      publish_date: "2022-01-01",
      multiplayer: true,
      last_played_at: "2023-06-30"
    }
  end

  subject(:game) { described_class.new(options) }

  describe "#initialize" do
    it "sets the genre, author, label, publish date, multiplayer, and last played date" do
      expect(game.genre).to eq("Action")
      expect(game.author).to eq(author)
      expect(game.label).to eq("Game of the Year")
      expect(game.publish_date).to eq(Date.parse("2022-01-01"))
      expect(game.multiplayer).to eq(true)
      expect(game.last_played_at).to eq(Date.parse("2023-06-30"))
    end
  end

  describe "#can_be_archived?" do
    context "when the game is eligible for archiving based on publish date" do
      it "returns true" do
        expect(game.can_be_archived?).to be_truthy
      end
    end

    context "when the game is eligible for archiving based on last played date" do
      it "returns true" do
        game.last_played_at = Date.today - (2 * 365 + 1)
        expect(game.can_be_archived?).to be_truthy
      end
    end

    context "when the game is not eligible for archiving" do
      it "returns false" do
        game.last_played_at = Date.today - (2 * 365 - 1)
        expect(game.can_be_archived?).to be_falsey
      end
    end
  end
end

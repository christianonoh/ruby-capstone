require_relative '../models/game'

describe Game do
  describe '#can_be_archived?' do
    context 'when the game is older than 2 years and has not been played recently' do
      it 'returns true' do
        options = {
          genre: 'Action',
          author: 'John Doe',
          label: 'Game 1',
          publish_date: '2019-01-01',
          multiplayer: true,
          last_played_at: '2021-01-01'
        }
        game = Game.new(options)

        expect(game.can_be_archived?).to be true
      end
    end
    context 'when the game is newer than 2 years' do
      it 'returns false' do
        options = {
          genre: 'Adventure',
          author: 'Jane Smith',
          label: 'Game 2',
          publish_date: '2022-05-01',
          multiplayer: false,
          last_played_at: '2023-04-01'
        }
        game = Game.new(options)

        expect(game.can_be_archived?).to be false
      end
    end

    context 'when the game has been played recently' do
      it 'returns false' do
        options = {
          genre: 'RPG',
          author: 'Sam Johnson',
          label: 'Game 3',
          publish_date: '2018-07-01',
          multiplayer: true,
          last_played_at: Date.today.to_s
        }
        game = Game.new(options)

        expect(game.can_be_archived?).to be false
      end
    end
  end
end

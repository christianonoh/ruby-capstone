require './models/music_album'

describe MusicAlbum do
  let(:music_album) do
    MusicAlbum.new(genre: 'Rock', author: 'The Beatles', label: 'Apple', publish_date: '1968-11-22', on_spotify: true)
  end

  describe '#new' do
    it 'returns a new MusicAlbum object' do
      expect(music_album).to be_an_instance_of(MusicAlbum)
    end
  end

  describe '#genre' do
    it 'returns the correct genre' do
      expect(music_album.genre).to eq('Rock')
    end
  end

  describe '#spotify' do
    it "returns true/false if it's on Spotify" do
      expect(music_album.on_spotify).to eq(true)
    end
  end

  describe '#can_be_archived?' do
    context 'when the album is on Spotify and can be archived' do
      it 'returns true' do
        music_album.on_spotify = true
        allow(music_album).to receive(:super).and_return(true)
        expect(music_album.can_be_archived?).to eq(true)
      end
    end
    context 'when the album is not on Spotify and can be archived' do
      it 'returns false' do
        music_album.on_spotify = false
        allow(music_album).to receive(:super).and_return(true)
        expect(music_album.can_be_archived?).to eq(false)
      end
    end
  end
end

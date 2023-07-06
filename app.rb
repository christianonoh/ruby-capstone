require './managers/music_album_manager'
require './managers/book_manager'
require './managers/game_manager'

class App
  def initialize
    @music_album_manager = MusicAlbumManager.new
    @book_manager = BookManager.new
    @game_manager = GameManager.new
  end

  def list_all_books
    @book_manager.list_all_books
  end

  def list_all_music_albums

    @music_album_manager.list_all_music_albums
    puts 'Listing all music albums'
  end

  def list_all_games
    @game_manager.list_all_games
    puts 'Listing all games'
  end

  def list_all_genres
    @music_album_manager.list_all_genres
    puts 'Listing all genres'
  end

  def list_all_labels
    @book_manager.list_all_labels
    puts 'Listing all labels'
  end

  def list_all_authors
    @game_manager.list_all_authors
    puts 'Listing all authors'
  end

  def add_book
    @book_manager.add_book
    puts 'Adding a book'
  end

  def add_music_album

    @music_album_manager.add_music_album
    puts 'Adding a music album'
  end

  def add_game
    @game_manager.add_game
    puts 'Adding a game'
  end

  def add_genre
    # @genre_manager.add_genre
    puts 'Adding a genre'
  end

  def quit
    puts 'Exiting the application...'
    exit
  end
end

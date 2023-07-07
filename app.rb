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
    puts 'Listing all Books...'
    @book_manager.list_all_books
  end

  def list_all_music_albums
    puts 'Listing all music albums'
    @music_album_manager.list_all_music_albums
  end

  def list_all_games
    puts 'Listing all games'
    @game_manager.list_all_games
  end

  def list_all_genres
    puts 'Listing all genres'
    @music_album_manager.list_all_genres
  end

  def list_all_labels
    puts 'Listing all Title from labels'
    @book_manager.list_all_labels
  end

  def list_all_authors
    puts 'Listing all authors'
    @game_manager.list_all_authors
  end

  def add_book
    puts 'Add a book'
    @book_manager.add_book
  end

  def add_music_album
    puts 'Add a music album'
    @music_album_manager.add_music_album
  end

  def add_game
    puts 'Add a game'
    @game_manager.add_game
  end

  def quit
    puts 'Exiting the application...'
    exit
  end
end

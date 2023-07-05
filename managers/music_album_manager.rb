require './models/music_album'
require './models/genre'

class MusicAlbumManager
  def initialize
    @music_albums = []
    @genres = []
  end

  def list_all_music_albums
    @music_albums.each_with_index do |music_album, index|
      puts "#{index + 1}. Music Album #{index + 1}:"
      puts "  Genre: #{music_album.genre.name}"
      puts "  Author: #{music_album.author}"
      puts "  Label: #{music_album.label}"
      #puts "  Published Date: #{music_album.publish_date}"
      puts "  On Spotify: #{music_album.on_spotify}"
      puts "------------"
    end
  end

  def list_all_genres
    @genres.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end
  end

  def add_music_album
    puts 'Enter the genre of the music album:'
    genre = gets.chomp
    puts 'Enter the author of the music album:'
    author = gets.chomp
    puts 'Enter the label of the music album:'
    label = gets.chomp
    puts 'Enter the published date of the music album (YYYY-MM-DD):'
    publish_date = gets.chomp
    puts 'Enter if it\'s on Spotify (y/n):'
    on_spotify_input = gets.chomp.downcase

    on_spotify = on_spotify_input == 'y' ? true : false

    options = {
      genre: Genre.new(genre),
      author: author,
      label: label,
      publish_date: publish_date,
      on_spotify: on_spotify
    }

    genre_obj = options[:genre]
    @genres << genre_obj unless @genres.include?(genre_obj)
    puts 'Music album was added successfully!'
    music_album = MusicAlbum.new(options)
    @music_albums << music_album
  end
end

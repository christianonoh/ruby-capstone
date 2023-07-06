require 'json'
require_relative 'json_files'

require './models/music_album'
require './models/genre'
require './models/author'
require './models/label'

class MusicAlbumManager
  def initialize
    @music_albums = []
    @genres = []
  end

  def list_all_music_albums
    @music_albums.each_with_index do |music_album, index|
      puts "#{index + 1}. Music Album #{index + 1}:"
      puts "  Genre: #{music_album.genre.name}"
      puts "  Author: #{music_album.author.first_name} #{music_album.author.last_name}"
      puts "  Label: #{music_album.label.title}"
      # puts "  Published Date: #{music_album.publish_date}"
      puts "  On Spotify: #{music_album.on_spotify}"
      puts '------------'
    end
  end

  def list_all_genres
    @genres.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end
  end

  def add_music_album
    puts 'Enter the name of author of the music album:'
    name_author = gets.chomp

    puts 'Enter the last name of author of the music album:'
    last_name_author = gets.chomp

    puts 'Enter the title of the music album:'
    title = gets.chomp

    puts 'Enter the genre of the music album:'
    genre = gets.chomp

    puts 'Enter the published date of the music album (YYYY-MM-DD):'
    publish_date = gets.chomp

    puts 'Enter if it\'s on Spotify (y/n):'
    on_spotify_input = gets.chomp.downcase

    on_spotify = on_spotify_input == 'y'

    options = {
      genre: Genre.new(genre),
      author: Author.new(name_author, last_name_author),
      label: Label.new(title, color: nil),
      publish_date: publish_date,
      on_spotify: on_spotify
    }

    genre_obj = options[:genre]
    @genres << genre_obj unless @genres.include?(genre_obj)

    music_album = MusicAlbum.new(options)
    @music_albums << music_album

    puts 'Music album was added successfully!'
    JsonHandler.write_to_json(@music_albums, MusicAlbum)
  end
end

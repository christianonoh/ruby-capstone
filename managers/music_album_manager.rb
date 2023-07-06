require 'json'
require './managers/utils'
require_relative 'json_files'

require './models/music_album'
require './models/genre'
require './models/author'
require './models/label'

class MusicAlbumManager
  def initialize
    @music_albums = []
    @genres = []
    @utils = Utils.new
  end

  def list_all_music_albums
    @music_albums.each_with_index do |music_album, index|
      puts "#{index + 1}. Music Album #{index + 1}:"
      puts "  Genre: #{music_album.genre.name}"
      puts "  Author: #{music_album.author.first_name} #{music_album.author.last_name}"
      puts "  Label: #{music_album.label.title}"
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
    title = @utils.prompt_user_input('Enter game title: ')
    author_first_name = @utils.prompt_user_input('Enter first name of author: ')
    author_last_name = @utils.prompt_user_input('Enter last name of author: ')
    genre = @utils.prompt_user_input('Enter game genre: ')
    publish_date = @utils.prompt_user_input('Enter the published date (YYYY-MM-DD): ')
    color = nil
    on_spotify_input = @utils.prompt_user_input('Enter if it\'s on Spotify (y/n):')
    on_spotify = on_spotify_input.downcase == 'y'

    general = @utils.build_options(title, author_first_name, author_last_name, genre, color)
    options = { **general, publish_date: publish_date, on_spotify: on_spotify }

    genre_obj = options[:genre]
    @genres << genre_obj unless @genres.include?(genre_obj)

    music_album = MusicAlbum.new(options)
    @music_albums << music_album

    puts 'Music album was added successfully!'
    JsonHandler.write_to_json(@music_albums, MusicAlbum)
  end
end

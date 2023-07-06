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
    @authors = []
    @labels = []
    @utils = Utils.new
    read_music_albums_from_json
    read_genres_from_json
  end

  def list_all_music_albums
    read_music_albums_from_json
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
    read_genres_from_json
    @genres.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end
  end

  def add_music_album
    title = @utils.prompt_user_input('Enter music album title: ')
    author_first_name = @utils.prompt_user_input('Enter first name of author: ')
    author_last_name = @utils.prompt_user_input('Enter last name of author: ')
    genre = @utils.prompt_user_input('Enter music album genre: ')
    publish_date = @utils.prompt_user_input('Enter the published date (YYYY-MM-DD): ')
    color = nil
    on_spotify_input = @utils.prompt_user_input('Enter if it\'s on Spotify (y/n):')
    on_spotify = on_spotify_input.downcase == 'y'

    general = @utils.build_options(title, author_first_name, author_last_name, genre, color)
    options = { **general, publish_date: publish_date, on_spotify: on_spotify }

    genre_obj = options[:genre]
    @genres << genre_obj unless @genres.include?(genre_obj)

    author_obj = options[:author]
    @authors << author_obj

    label_obj = options[:label]
    @labels << label_obj

    music_album = MusicAlbum.new(options)
    @music_albums << music_album

    puts 'Music album was added successfully!'

    save_to_json
  end

  def save_to_json
    JsonHandler.write_to_json(@genres, Genre)
    JsonHandler.write_to_json(@authors, Author)
    JsonHandler.write_to_json(@labels, Label)
    JsonHandler.write_to_json(@music_albums, MusicAlbum)
    puts 'Saved to JSON'
  end


  def read_music_albums_from_json
    data = JsonHandler.read_from_json('./database/MusicAlbums.json')
    if data.is_a?(Array)
      @music_albums = data.map do |item|
        genre = Genre.new(item[:genre][:name])
        genre.instance_variable_set(:@id, item[:genre][:id])
        author = Author.new(item[:author][:first_name], item[:author][:last_name])
        author.instance_variable_set(:@id, item[:author][:id])
        label = Label.new(item[:label][:title], color: nil)
        label.instance_variable_set(:@id, item[:label][:id])
        
        music_album = MusicAlbum.new(
            genre: genre, 
            author: author, 
            label: label, 
            publish_date: item[:publish_date],
            on_spotify: item[:on_spotify])

        music_album.instance_variable_set(:@id, item[:id])
        music_album
      end
    else
      @music_albums = []
    end


    def read_genres_from_json
        data = JsonHandler.read_from_json('./database/genres.json')
        if data.is_a?(Array)
            @genres = data.map do |item|
            genre = Genre.new(item[:name])
            genre.instance_variable_set(:@id, item[:id])
            genre
            end
        else
            @genres = []
        end
        end

  end


end

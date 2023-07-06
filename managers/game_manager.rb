require 'json'
require './managers/utils'
require_relative 'json_files'

require './models/game'
require './models/genre'
require './models/author'
require './models/label'

class GameManager
  attr_accessor :games

  def initialize
    @games = []
    @authors = []
    @labels = []
    @genres = []
    @utils = Utils.new
  end

  def list_all_games
    @games.each_with_index do |game, index|
      puts "#{index + 1}. Game #{index + 1}:"
      puts "Genre: #{game.genre.name}"
      puts " Author: #{game.author.first_name} #{game.author.last_name}"
      puts " Label: #{game.label.title}"
      puts " Last Played: #{game.last_played_at}"
    end
    puts '-----------------------------------'
  end

  def list_all_authors
    @authors.each_with_index do |author, index|
      puts "#{index + 1}. #{"#{author.first_name} #{author.last_name}"}"
    end
  end

  def add_game
    title = @utils.prompt_user_input('Enter game title: ')
    author_first_name = @utils.prompt_user_input('Enter first name of author: ')
    author_last_name = @utils.prompt_user_input('Enter last name of author: ')
    genre = @utils.prompt_user_input('Enter game genre: ')
    publish_date = @utils.prompt_user_input('Enter the published date (YYYY-MM-DD): ')
    color = nil
    last_played_at = @utils.prompt_user_input('Enter last played date (YYYY-MM-DD):')
    multiplayer = @utils.prompt_user_input('Enter if Multiplayer(type yes/no):')

    general = @utils.build_options(title, author_first_name, author_last_name, genre, color)
    options = { **general, publish_date: publish_date, last_played_at: last_played_at, multiplayer: multiplayer }

    author_obj = options[:author]
    @authors << author_obj

    genre_obj = options[:genre]
    @genres << genre_obj

    label_obj = options[:label]
    @labels << label_obj

    game = Game.new(options)
    @games << game
    puts 'Game added successfully!'
    save_to_json
  end

  def save_to_json
    JsonHandler.write_to_json(@genres, Genre)
    JsonHandler.write_to_json(@authors, Author)
    JsonHandler.write_to_json(@labels, Label)
    JsonHandler.write_to_json(@games, Game)
    puts 'Saved to JSON'
  end
end

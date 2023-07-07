require 'json'
require './managers/utils'
require_relative 'json_files'
require_relative 'data_parser'

require './models/game'
require './models/genre'
require './models/author'
require './models/label'

class GameManager
  include DataParser
  attr_accessor :games

  def initialize
    @games = []
    @authors = []
    @labels = []
    @genres = []
    @utils = Utils.new
    read_games_from_json
    read_authors_from_json
  end

  def list_all_games
    read_games_from_json

    @games.each_with_index do |game, index|
      puts "#{index + 1}. Game #{index + 1} (ID: #{game.id}):"
      puts "   Genre: #{game.genre.name}"
      puts "   Author: #{game.author.first_name} #{game.author.last_name}"
      puts "   Label: #{game.label.title}"
      puts "   Last Played: #{game.last_played_at}"
      puts '-------------------'
    end
  end

  def list_all_authors
    read_authors_from_json

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
  end

  def read_games_from_json
    data = JsonHandler.read_from_json('./database/games.json')
    @games = if data.is_a?(Array)
               parse_games(data)
             else
               []
             end
  end

  def read_authors_from_json
    data = JsonHandler.read_from_json('./database/authors.json')
    @authors = if data.is_a?(Array)
                 data.map do |item|
                   author = Author.new(item[:first_name], item[:last_name])
                   author.instance_variable_set(:@id, item[:id])
                   author
                 end
               else
                 []
               end
  end
end

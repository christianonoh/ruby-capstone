require 'json'
require './models/game'
require './models/genre'
require './models/author'
require './models/label'

class GameManager
  attr_accessor :games

  def initialize
    @games = []
    @authors = []
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
    puts 'Add genre of the game:'
    genre = gets.chomp
    puts 'Enter game author first name:'
    name_author = gets.chomp
    puts 'Enter game author last name:'
    last_name = gets.chomp
    puts 'Enter game label:'
    title = gets.chomp
    puts 'Enter the publish date (YYYY-MM-DD):'
    publish_date = gets.chomp
    puts 'Enter the date game was last played (YYYY-MM-DD):'
    last_played_at = gets.chomp
    puts 'Enter if multiplayer'
    multiplayer = gets.chomp

    options = {
      genre: Genre.new(genre),
      author: Author.new(name_author, last_name),
      label: Label.new(title, color: nil),
      publish_date: publish_date,
      last_played_at: last_played_at,
      multiplayer: multiplayer
    }

    author_obj = options[:author]
    @authors << author_obj
    game = Game.new(options)
    @games << game
    puts 'Game added successfully!'
  end
end

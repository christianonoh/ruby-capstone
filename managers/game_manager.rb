require_relative 'game'

class GameManager
  attr_accessor :game

  def initialize
    @game = []
  end

  def add_game
    puts 'Add genre of the game:'
    genre = gets.chomp
    puts 'Enter game author:'
    author = gets.chomp
    puts 'Enter game label:'
    label = gets.chomp
    puts 'Enter the publish date (YYYY-MM-DD):'
    publish_date = gets.chomp
    puts 'Enter the date game was last played (YYYY-MM-DD):'
    last_played_at = gets.chomp
    puts 'Enter if multiplayer'
    multiplayer = gets.chomp

    options = {
      game: game,
      author: author,
      label: label,
      publish_date: publish_date,
      last_played_at: last_played_at,
      multiplayer: multiplayer
    }

    game = Game.new(options)
    @game << game
    puts 'Game added successfully!'
  end
end
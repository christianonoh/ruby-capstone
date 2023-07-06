require 'json'
require_relative 'json_files'
require_relative 'data_parser'

require './models/book'
require './managers/utils'

class BookManager
    include DataParser
  def initialize
    @books = []
    @authors = []
    @genres = []
    @labels = []
    @utils = Utils.new
    read_music_albums_from_json
  end

  def add_book
    title = @utils.prompt_user_input('Enter book title: ')
    author_first_name = @utils.prompt_user_input('Enter first name of author: ')
    author_last_name = @utils.prompt_user_input('Enter last name of author: ')
    genre = @utils.prompt_user_input('Enter book genre: ')
    publish_date = @utils.prompt_user_input('Enter the published date (YYYY-MM-DD): ')
    color = @utils.prompt_user_input('Enter book color: ')
    publisher = @utils.prompt_user_input('Enter book publisher: ')
    cover_state = @utils.prompt_user_input('Is the book cover state "Good" or "Bad"?: ')

    general = @utils.build_options(title, author_first_name, author_last_name, genre, color)
    options = { **general, publish_date: publish_date, publisher: publisher, cover_state: cover_state }

    label_obj = options[:label]
    @labels << label_obj
    puts "#{title} by #{author_first_name} #{author_last_name} was added successfully!"

    genre_obj = options[:genre]
    @genres << genre_obj

    author_obj = options[:author]
    @authors << author_obj

    book = Book.new(options)
    @books << book
    save_to_json
  end

  def save_to_json
    JsonHandler.write_to_json(@genres, Genre)
    JsonHandler.write_to_json(@authors, Author)
    JsonHandler.write_to_json(@labels, Label)
    JsonHandler.write_to_json(@books, Book)
    puts 'Saved to JSON'
  end

  def list_all_books
    read_music_albums_from_json

    @books.each_with_index do |book, index|
      puts "#{index + 1}. Book #{index + 1}, (ID: #{book.id}):"
      puts "  Title: #{book.label.title}"
      puts "  Author: #{book.author.first_name} #{book.author.last_name}"
      puts "  Genre: #{book.genre.name}"
      puts "  Published Date: #{book.publish_date}"
      puts "  Publisher: #{book.publisher}"
      puts "  Cover state: #{book.cover_state}"
      puts '------------'
    end
  end

  def list_all_labels
    @labels.each_with_index do |label, index|
      puts "#{index + 1}. #{label.title}"
    end
  end

  def read_music_albums_from_json
    data = JsonHandler.read_from_json('./database/books.json')
    @books = if data.is_a?(Array)
                    parse_books(data)
                    else
             []
        end
  end

  private

  def add_label(label)
    existing_label = @labels.find { |l| l.title == label.title && l.color == label.color }
    @labels << label unless existing_label
  end
end

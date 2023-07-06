require 'json'
require './models/book'
require './managers/utils'

class BookManager
  def initialize
    @books = []
    @labels = []
    @utils = Utils.new
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
    book = Book.new(options)
    @books << book
  end

  def list_all_books
    @books.each_with_index do |book, index|
      puts "#{index + 1}. Book #{index + 1}:"
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

  private

  def add_label(label)
    existing_label = @labels.find { |l| l.title == label.title && l.color == label.color }
    @labels << label unless existing_label
  end
end

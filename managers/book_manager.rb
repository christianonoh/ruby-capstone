require 'json'
require './models/book'
require './models/genre'
require './models/author'
require './models/label'


class BookManager
  def initialize
    @books = []
    @labels = []
  end

  def add_book
    print 'Enter book title: '
    title = gets.chomp
    print 'Enter first name of author: '
    author_first_name = gets.chomp
    print 'Enter last name of author: '
    author_last_name = gets.chomp
    print 'Enter book genre: '
    genre = gets.chomp
    print 'Enter the published date (YYYY-MM-DD): '
    publish_date = gets.chomp
    print 'Enter book color: '
    color = gets.chomp
    print 'Enter book publisher: '
    publisher = gets.chomp
    print 'Is the book cover state "Good" or "Bad"?: '
    cover_state = gets.chomp

    options = {
      genre: Genre.new(genre),
      author: Author.new(author_first_name, author_last_name),
      label: Label.new(title, color: nil),
      publish_date: publish_date,
      publisher: publisher,
      cover_state: cover_state
    }
    label_obj = options[:label]
    @labels << label_obj unless @labels.include?(label_obj)
    puts "#{title} by #{author_first_name + ' ' + author_last_name} was added successfully!"
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
      puts "------------"
    end
  end
end

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
end

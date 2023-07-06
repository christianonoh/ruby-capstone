require './models/genre'
require './models/author'
require './models/label'

class Utils
  def prompt_user_input(prompt)
    print prompt
    gets.chomp
  end

  def build_options(title, author_first_name, author_last_name, genre, color)
    {
      genre: Genre.new(genre),
      author: Author.new(author_first_name, author_last_name),
      label: Label.new(title, color: color)
    }
  end
end

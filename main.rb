require_relative 'app'

@app = App.new

class Menu
  def initialize(app)
    @app = app
  end

  def display_menu
   
    puts 'Welcome to the App Please select an option:'
    puts '1. List all Books'
    puts '2. List all Music Albums'
    puts '3. List all Games'
    puts '4. List all Genres '
    puts '5. List all Labels'
    puts '6. List all Authors'
    puts '7. Add a Book'
    puts '8. Add a Music Album'
    puts '9. Add a Game'
    puts '10. Quit'
    run_menu_loop
  end

  private

  def run_menu_loop
    loop do
      choice = prompt_choice
      handle_choice(choice)
      break if choice == 10
    end
  end
  

  def prompt_choice
    print 'Enter your choice (1-10): '
    gets.chomp.to_i
  end

  def handle_choice(choice)
    case choice
    when 1
      @app.list_all_books
    when 2
      @app.list_all_music_albums
    when 3
      @app.list_all_games
    when 4
      @app.list_all_genres
    when 5
      @app.list_all_labels
    when 6
      @app.list_all_authors
    when 7
      @app.add_book
    when 8
      @app.add_music_album
    when 9
      @app.add_game
    when 10
      @app.quit
    else
      invalid_choice
    end
    puts "\n"
    display_menu
  end

  def invalid_choice
    puts 'Invalid choice!'
  end

end

def main
  menu = Menu.new(@app)
  menu.display_menu
end

main
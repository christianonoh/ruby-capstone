require_relative 'app'

def display_menu
  puts '-------------------'
  puts 'My Catalogue App'
  puts '-------------------'
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
  puts '0. Quit'
  puts '-------------------'
  print 'Enter your choice: '
end

def process_choice(choice, app)
  options = {
    1 => :list_all_books,
    2 => :list_all_music_albums,
    3 => :list_all_games,
    4 => :list_all_genres,
    5 => :list_all_labels,
    6 => :list_all_authors,
    7 => :add_book,
    8 => :add_music_album,
    9 => :add_game,
    0 => :quit
  }

  action = options[choice]
  if action
    app.send(action)
  else
    puts 'Invalid choice. Please try again.'
  end
  !choice.zero?
end

def main
  app = App.new

  loop do
    display_menu
    choice = gets.chomp.to_i

    break unless process_choice(choice, app)

    puts "\n"
  end
end

main

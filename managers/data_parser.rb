# data_parser.rb

module DataParser
    def parse_music_albums(data)
      data.map do |item|
        genre = parse_genre(item[:genre])
        author = parse_author(item[:author])
        label = parse_label(item[:label])
  
        music_album = MusicAlbum.new(
          genre: genre,
          author: author,
          label: label,
          publish_date: item[:publish_date],
          on_spotify: item[:on_spotify]
        )
        music_album.instance_variable_set(:@id, item[:id]) unless item[:id].nil?
        music_album
        
    
      end
    end

    #books
    def parse_books(data)
        data.map do |item|
          genre = parse_genre(item[:genre])
          author = parse_author(item[:author])
          label = parse_label(item[:label])
    
          books = Book.new(
            genre: genre,
            author: author,
            label: label,
            publish_date: item[:publish_date],
            publisher: item[:publisher],
            cover_state: item[:cover_state]
          )
          books.instance_variable_set(:@id, item[:id]) unless item[:id].nil?
          books
          
      
        end
      end


      #games
      def parse_games(data)
        data.map do |item|
          genre = parse_genre(item[:genre])
          author = parse_author(item[:author])
          label = parse_label(item[:label])
    
          games = Game.new(
            genre: genre,
            author: author,
            label: label,
            publish_date: item[:publish_date],
            last_played_at: item[:last_played_at],
            multiplayer: item[:multiplayer]

          )
          games.instance_variable_set(:@id, item[:id]) unless item[:id].nil?
          games
          
      
        end
      end
    

        
    #genre
    def parse_genre(genre_data)
      genre = Genre.new(genre_data[:name])
      genre.instance_variable_set(:@id, genre_data[:id])
      genre
    end
  
    #author
    def parse_author(author_data)
      author = Author.new(author_data[:first_name], author_data[:last_name])
      author.instance_variable_set(:@id, author_data[:id])
      author
    end
  
    #label
    def parse_label(label_data)
        color = label_data[:color] && label_data[:color][:color]
        label = Label.new(label_data[:title], color: color)
        label.instance_variable_set(:@id, label_data[:id])
        label
      end
  end
  
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
        # music_album.instance_variable_set(:@id, item[:id])
        # music_album
      end
    end
  
    def parse_genre(genre_data)
      genre = Genre.new(genre_data[:name])
      genre.instance_variable_set(:@id, genre_data[:id])
      genre
    end
  
    def parse_author(author_data)
      author = Author.new(author_data[:first_name], author_data[:last_name])
      author.instance_variable_set(:@id, author_data[:id])
      author
    end
  
    def parse_label(label_data)
      label = Label.new(label_data[:title], color: nil)
      label.instance_variable_set(:@id, label_data[:id])
      label
    end
  end
  
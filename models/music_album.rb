class MusicAlbum < Item
    attr_accessor :on_spotify
  
    def initialize(genre, author, label, publish_date, archived: false, on_spotify: false)
      super(genre, author, label, publish_date, archived: archived)
      @on_spotify = on_spotify
    end
  
    def can_be_archived?
      super && @on_spotify
    end
  end
  
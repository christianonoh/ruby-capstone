class Music_album < Item

    def initialize(genre, author, label, publish_date, archived: false, on_spotify: false)
        super(genre, author, label, publish_date, archived: false)
        @artist = artist
        @genre = genre
        @year = year
    end
end
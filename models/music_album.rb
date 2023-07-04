class Music_album < Item

    def initialize(genre, author, label, publish_date, archived: false, on_spotify: false)
        super(genre, author, label, publish_date, archived: false)
        @on_spotify = on_spotify
        @archived = archived
    end

    def can_be_archived?
        if @archived == true
            return true
        else
            return false
        end
    end
end
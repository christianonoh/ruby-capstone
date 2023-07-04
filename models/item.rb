require 'date'

class Item
  attr_accessor :archived, :author, :label, :genre

  def initialize(genre, author, label, publish_date, archived: false)
    @id = Random.rand(1..10000)
    @genre = genre
    @author = author
    @label = label
    @publish_date = Date.parse(publish_date)
    @archived = archived
  end

  def can_be_archived?
    Date.today - @publish_date > (10 * 365)
  end

  def move_to_archive
    if can_be_archived?
      self.archived = true
    else
      self.archived = false
    end
  end
end

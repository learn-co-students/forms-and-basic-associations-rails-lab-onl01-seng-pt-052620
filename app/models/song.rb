class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist.name if self.artist
  end

  def note_contents=(n)
    n.each { |n| self.notes << Note.find_or_create_by(content: n)}
  end

  def note_contents
    self.notes.map { |note| note.content unless note.content.empty? }
  end
end

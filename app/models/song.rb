class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(arg)
    self.artist = Artist.find_or_create_by(name: arg)
  end

  def artist_name
    self.artist.name if self.artist
  end

  def note_contents=(arg)
    arg.each { |arg| self.notes << Note.find_or_create_by(content: arg) }
  end

  def note_contents
    self.notes.map { |note| note.content unless note.content.empty? }
  end

end

class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)

  end

  def note_contents
    self.notes.map do |note|
      note.content unless note.content.empty?
    end


  end

  def note_contents=(notes)
    notes.each do |note|
      self.notes <<  Note.find_or_create_by(content: note)
    end

  end
  # add associations here
end

class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  

  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by(name: artist_name)
  end

  def artist_name
    self.artist.try(:name)
  end

  def note_1
    self.notes.first.try(:content)
  end

  def note_1=(content)
    @note_1 = self.notes.build(content: content)
  end

  def note_2
    self.notes.last.try(:content)
  end

  def note_2=(content)
    @note_2 = self.notes.build(content: content)
  end

  def note_contents=(notes_content)
    notes_content.each do |note_content|
      self.notes.build(content: note_content)
    end
  end

end

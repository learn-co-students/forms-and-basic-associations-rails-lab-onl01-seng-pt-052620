class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre 
  has_many :notes



  #validates :artist_id, :genre_id, {presence: true}
  #validates :title, {presence: true, uniqueness: { scope: [:artist_id]}}

  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by(name: artist_name)
  end

  def artist_name
    self.artist.try(:name)
  end 

  def notes_1
    self.notes.first.try(:content)
  end

  def notes_1=(content)
  @note_1 = self.notes.build(content: content)
  end

  def notes_2  
    self.notes.last.try(:content)
  end

  def notes_2=(content)
    @note_2 = self.notes.build(content: content)
  end

end

class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  # validations
  # validates :artist_id, :genre_id, presence: true
  # validates :title, {presence: true, uniqueness: { scope: [:artist_id]}}

  def artist_name=(artist_name)
    # artist= method 
    # assigns the associate object, extracts the primary key, and sets it as the foreign key
    self.artist = Artist.find_or_create_by(name: artist_name)
    # find_or_create_by method
    # finds the first record with the given attributes, or creates a record with the attributes if one is not found
  end 

  def artist_name
    self.artist.try(:name)
    # way of preventing no method error
    # does object know how to respond to method
    # if it does, call it (self.send)
    # otherwise, return nil
    # useful in method chaining, if case where self.artist is nil
  end 

  def note_1=(note)
    @note_1 = self.notes.build(content: note) 
  end

  def note_1
    self.notes.first.try(:content)
  end 

  def note_2=(note)
    @note_2 = self.notes.build(content: note) 
  end

  def note_2
    self.notes.last.try(:content)
  end 

  def note_contents=(notes_content)
    notes_content.each do |note_content|
      self.notes.build(content: note_content)
    end 
  end  
  
  def note_contents

  end 

end

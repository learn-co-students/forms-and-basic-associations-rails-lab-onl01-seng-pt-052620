class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  #validations
  validates :artist_id, :genre_id, presence: true
  validates :title, {presence: true, uniqueness: { scope: [:artist_id]}}

  def artist_name=(artist_name)
    # artist= method 
    # assigns the associate object, extracts the primary key, and sets it as the foreign key
    self.artist = Artist.find_or_create_by(name: artist_name)
    # find_or_create_by method
    # finds the first record with the given attributes, or creates a record with the attributes if one is not found
  end 

  def artist_name
    self.artist.try(:name)
  end 
                 
end

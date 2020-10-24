class Song < ActiveRecord::Base
  # add associations here

  belongs_to :artist
  belongs_to :genre
  has_many :notes

  validates :artist_id, :genre_id, {presence: true}
  validates :title, {presence: true, uniqueness: {scope: [:artist_id]}}

  def artist_name
    self.try(:artist).try(:name)
  end

  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by(name: artist_name)
    self.save
  end

  def genre_name
    self.genre.name if self.genre
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def note_contents
    self.notes.collect(&:content)
  end

  def note_contents=(note_contents)
    note_contents.each do |content|
      unless content.empty?
        self.notes << Note.create(content: content)
        self.save
      end
    end
  end
end

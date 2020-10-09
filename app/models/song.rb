class Song < ActiveRecord::Base
    belongs_to :artist
    belongs_to :genre
    has_many :notes

    def artist_name=(name)
        self.artist = Artist.find_or_create_by(name: name)
    end

    def artist_name
        self.artist ? self.artist.name : nil
    end

    def note_contents=(args)
        args.each do |n|
          note = Note.new(content: n)
          self.notes << note
        end
    end
end

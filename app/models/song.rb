class Song < ActiveRecord::Base
  attr_accessor :artist_name, :genre_name

  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist.name if artist
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.name if genre
  end

  def genre_id=(id)
    self.genre = Genre.find_or_create_by(id: id)
  end

  def note_contents=(notes)
    notes.each do |note|
      self.notes.build(content: note) if !note.empty?
    end
  end

  def note_contents
    self.notes.map {|note| note.content }
  end
end

 # def note_contents=(notes)
 #    notes.each do |content|
 #      if content.strip != ''
 #        self.notes.build(content: content)
 #      end
 #    end
 #  end

 #  def note_contents
 #    self.notes.map(&:content)
 #  end
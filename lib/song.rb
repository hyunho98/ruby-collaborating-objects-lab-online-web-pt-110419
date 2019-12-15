class Song
  attr_accessor :name, :artist
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.new_by_filename(file)
    hold = file.split(" - ")
    song = Song.new(hold[1])
    song.artist = Artist.find_or_create_by_name(hold[0])
    song
  end

  def artist_name=(artist)
    Artist.find_or_create_by_name(artist).add_song(self)
  end
end

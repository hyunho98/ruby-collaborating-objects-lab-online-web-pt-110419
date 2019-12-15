class Artist
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def add_song(song)
    song.artist = self
  end

  def songs
    Song.all.select{|songs| songs.artist == self}
  end

  def self.find_or_create_by_name(name)
    @@all.each{|i|
    if i.name == name
      return i
    end}
    return Artist.new(name)
  end

  def print_songs
    Song.all.each{|i|
      if i.artist == self
        puts i.name
      end}
  end
end

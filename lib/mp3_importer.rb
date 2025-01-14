class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    files = []
    Dir.entries(@path).each{|i|
    if i.include?(".mp3")
      files << i
    end
      }
    files
  end

  def import
    self.files.each{|i|
      Song.new_by_filename(i)
    }
  end
end

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    @name = name
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    @name = name
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name)? find_by_name(name) : create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by! do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    data = filename.split(" - ")
    name = data[1].chomp(".mp3")
    artist_name = data[0]
    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).save
  end

  def self.destroy_all
    @@all.clear
  end
end

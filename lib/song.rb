class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name="default", artist="default")
    @name = name
    @artist_name = artist
    self.save
  end

  def self.all
    @@all
  end
  def self.find_or_create_by_name(name)
    self.find_by_name(name) !=nil ? self.find_by_name(name) : self.create_by_name(name)
  end
  def save
    self.class.all << self
  end
  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end
  def self.new_by_name(name)
    self.new(name)
  end
  def self.create_by_name(name)
    self.new(name)
  end
  def self.create
    self.new
  end
  def self.destroy_all
    @@all = []
  end
  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end
  def self.new_from_filename(name)
    temp = name.split(" - ")
    puts temp
    self.new(temp[1].delete_suffix(".mp3"),temp[0])
  end
  def self.create_from_filename(name)
    temp = name.split(" - ")
    puts temp
    self.new(temp[1].delete_suffix(".mp3"),temp[0])
  end
end

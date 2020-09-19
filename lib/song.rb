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
    newsong = Song.new
    newsong.save
    newsong
  end

  def self.new_by_name(title)
    newsong = Song.new
    newsong.name = title
    newsong
  end

  def self.create_by_name(title)
    newsong = Song.new
    newsong.name = title
    newsong.save
    newsong
  end

  def self.find_by_name(n)
    all.find do |s|
      s.name == n
    end
  end

  def self.find_or_create_by_name(the_name)
    if find_by_name(the_name)
      find_by_name(the_name)
    else
      create_by_name(the_name)
    end
  end

  def self.alphabetical
    all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(string)
    artist, title = string[0..-5].split(" - ")
    the_object = create_by_name(title)
    the_object.artist_name = artist
    the_object
  end

  def self.create_from_filename(format)
    new_from_filename(format).save
  end

  def self.destroy_all
    @@all = []
  end

end

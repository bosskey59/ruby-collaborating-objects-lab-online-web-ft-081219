require "pry"
class Artist
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name 
    @songs = []
    @@all << self
  end 

  def add_song(song)
    song.artist = self
  end

  def self.find_or_create_by_name(artist_name) 
  #    if self.all.find{|artist_obj| artist_obj.name == artist_name}
  #     self.all.find{|artist_obj| artist_obj.name == artist_name}
  #    else
  #     self.new(artist_name) 
  #    end
    self.all.find{|artist_obj| artist_obj.name == artist_name} || Artist.new(artist_name)
  end

  def print_songs
    self.songs.each{|song| puts "#{song.name}"}
  end

  def self.all
      @@all
  end

  def songs
    Song.all.select{|song| song.artist == self}
  end

end
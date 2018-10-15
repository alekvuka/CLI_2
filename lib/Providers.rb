class Providers

  @@all = Array.new

  attr_accessor :name, :team, :specialties, :languages, :title

  def initialize(attr_hash)
    @name = :name
    @team = :team
    @specialties = :specialties
    @languages = :languages
    @title = :title 

    @@all << self
  end

  def self.all
    @@all
  end

end

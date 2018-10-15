class Providers

  @@all = Array.new

  attr_accessor :name, :team, :specialties, :languages, :title, :qualifications

  def initialize(attr_hash)
    @name = :name
    @team = :team
    @specialties = :specialties
    @languages = :languages
    @title = :title
    @qualifications = :qualifications

    @@all << self
  end

  def self.all
    @@all
  end

end

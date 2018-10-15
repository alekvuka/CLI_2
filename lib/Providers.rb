class Providers

  @@all = Array.new

  attr_accessor :name, :team, :specialties, languages

  def initialize(attr_hash)
    @name = :name
    @team = :team
    @specialties = :specialties
    @languages = :languages

    @@all << self
  end

  def self.all
    @@all
  end

end

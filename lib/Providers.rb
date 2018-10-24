
class Providers

  @@all = Array.new

  attr_accessor :name, :team, :specialites, :languages, :title, :qualifications

  def initialize(attr_hash)

    @name = attr_hash[:name]
    @title = attr_hash[:title]
    @qualifications = attr_hash[:qualification]
    @specialites = attr_hash[:specialties]

    @team = attr_hash[:team]
    @languages = attr_hash[:languages]

    @@all << self

  end

  def self.find_by_team(team)
    @@all.select{ |provider| provider.team == team}
  end

  def self.find_by_name(name)
    @@all.find{ |provider| provider.name == name}
  end

  def self.find_by_language(language)
    @@all.select{ |provider| provider.languages.include?(language)}
  end

  def self.find_by_specialty(specialty)
    @@all.select{ |provider| provider.specialty.include?(specialty)}
  end

  def self.all
    @@all
  end

end

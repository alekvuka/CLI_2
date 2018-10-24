
class Provider

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
    @@all.find{ |provider| provider.name.upcase == name.upcase}
  end

  def self.find_by_language(language)

    languages = @@all.map {|provider| provider.languages}.join(",").split(",").uniq
    if languages.any?{|lang| lang.upcase == language.upcase}
        @@all.select{|provider| provider.languages.map(&:upcase).include?(language.upcase)}
    else
      nil
    end

  end

  def self.find_by_specialty(specialty)

    specialites = @@all.map {|provider| provider.specialites}.join(",").split(",").uniq
    if specialites.any?{|s| s.upcase == specialty.upcase}
      @@all.select{ |provider| provider.specialites.map(&:upcase).include?(specialty.upcase)}
    else
      nil
    end

  end

  def self.all
    @@all
  end

end

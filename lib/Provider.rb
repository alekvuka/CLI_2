
class Provider

  @@all = Array.new

  attr_accessor :name, :team, :specialites, :languages, :title, :qualifications

  def initialize(attr_hash)

    @name = attr_hash[:name]
    @title = attr_hash[:title]
    @qualifications = attr_hash[:qualification]
    @specialites = attr_hash[:specialties].split(",")

    @team = attr_hash[:team]
    @languages = attr_hash[:languages].split(",").collect{|language| language.strip}


    @@all << self

  end

  def self.find_by_team(team)
    @@all.select{ |provider| provider.team.upcase == team.upcase}
  end

  def self.find_by_name(name)
    @@all.find{ |provider| provider.name.upcase == name.upcase}
  end

  def self.find_by_language(language)

    languages_s = Array.new

    lang = @@all.map do |provider|
        provider.languages
      end

    binding.pry


    lang = @@all.map {|provider| provider.languages.split(",")}.join(",").split(",")
    lang = lang.map {|language| language.strip}.uniq


    if lang.any?{|lag| lag == language}
        @@all.select{|provider| provider.languages.include?(language)}
    else
      nil
    end
  end

  def self.find_by_specialty(specialty)
    spec = @@all.map {|provider| provider.specialites.split(",")}.join(",").split(",")
    spec = spec.map {|specialty| specialty.strip}.uniq
    if spec.any?{|s| s == specialty}
      @@all.select{ |provider| provider.specialites.include?(specialty)}
    else
      nil
    end

  end

  def self.all
    @@all
  end

end

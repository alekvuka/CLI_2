require_relative "Specialites.rb"


class Providers

  @@all = Array.new

  attr_accessor :name, :team, :specialites, :languages, :title, :qualifications

  def initialize(attr_hash)

    @name = attr_hash[:name]
    #@specialties = attr_hash[:specialties]
    @title = attr_hash[:title]
    @qualifications = attr_hash[:qualification]

  
    @specialites = Specialites.add_by_name(attr_hash[:specialties], self)
    @team = Teams.add_by_name(attr_hash[:team], self)
    @languages = Languages.add_by_name(attr_hash[:languages], self)



    @@all << self

  end

  def self.all
    @@all
  end

end

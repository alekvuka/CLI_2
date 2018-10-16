require 'pry'

require_relative "Providers.rb"

class Teams

  @@all = Array.new

  attr_accessor :name, :providers

  def initialize(name)
    @name = name
    @providers = Array.new
    @@all << self
  end


  def self.add_by_name(team_name, provider)
    binding.pry

    if team_name == nil
      nil
    else
      our_team = @@all.select do |team|
                        team.name == team_name.strip
                      end

      if our_team == false || our_team == nil || our_team.length == 0
        new_team = Teams.new(team_name.strip)
        new_team.providers << provider
        new_team
      else
        our_team[0].providers << provider
        our_team
      end

    end

  end



  def self.providers_by_team(team_name)

      list_of_providers = Array.new

      @@all.each do |team|
        if team.name == team_name
          team.providers.each do |prvdr|
            list_of_providers << prvdr.name
          end
        end
      end

      list_of_providers
  end

  def self.team_by_provider(provider)

    @@all.each do |team|
      team.providers.each do |pvdr|

        if pvdr == provider
          return team.name
        end
      end
    end

  end

  def self.all
    @@all
  end

end

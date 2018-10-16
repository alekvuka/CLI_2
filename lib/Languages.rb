require 'pry'

require_relative "Providers.rb"

class Languages

  @@all = Array.new

  attr_accessor :name
  attr_reader :providers

  def initialize(name)
    @name = name
    @providers = Array.new
    @@all << self
  end

  def self.add_by_name(name, provider)

    #accounting for providers who speak multiple languages
    ary = name.split(",")

    ary.each do |language|

      if @@all.any? {|lang| lang.name == language.strip}
        our_language = @@all.detect do |langu|
                          langu.name = language.strip
                        end

        our_language.providers << provider

      else
        new_language = Languages.new(language)
        new_language.providers << provider
      end

    end

  end

  def self.languages_by_provider(provider)

      provider_languages = Array.new

      @@all.each do |language|
        language.providers.each do |prvdr|
          if prvdr == provider
            provider_languages << language.name
          end
        end
      end

      #binding.pry
      provider_languages.join(',')

  end

end

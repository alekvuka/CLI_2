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

  def self.add_by_name(language_names, provider)


    #accounting for providers who speak multiple languages
    ary = language_names.split(",")


    i = 0
    while i < ary.size
      ary[i] = ary[i].strip
      i+=1
    end

    ary.each do |language|

      if @@all.any? {|lang| lang.name == language}
        our_language = @@all.find do |langu|
                          langu.name = language.strip
                        end

        our_language.providers << provider
        our_language


      else
        our_language = Languages.new(language)
        our_language.providers << provider
        our_language
      end

    end
    our_language

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
      provider_languages.join(',')

  end

  def self.all
    @@all
  end

end

require 'pry'

require_relative "Providers.rb"

class Languages

  @@all = Array.new

  attr_accessor :name, :providers

  def initialize(name)
    @name = name
    @providers = Array.new
    @@all << self
  end


  def self.add_by_name(language_names, provider)

    ary = language_names.split(",")
    language_instances_to_return = Array.new

    i = 0
    while i < ary.size
      ary[i] = ary[i].strip
      i+=1
    end

    ary.each do |language_name|

      our_language = @@all.select do |langu|
                        langu.name == language_name
                      end


      if our_language == false || our_language == nil || our_language.length == 0
        new_language = Languages.new(language_name)
        new_language.providers << provider
        language_instances_to_return << our_language

      else
        our_language[0].providers << provider
        language_instances_to_return << our_language
      end

    end
    language_instances_to_return
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
      provider_languages.join(', ')
  end

  def self.all
    @@all
  end

end

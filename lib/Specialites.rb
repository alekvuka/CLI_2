

class Specialites

  @@all = Array.new
  attr_accessor :name, :providers



  def initialize(name)
    @name = name
    @providers = Array.new
    @@all << self
  end



  def self.add_by_name(specialties, provider)

  
    ary = specialties.split(",")
    speciality_instances_to_return = Array.new

    i = 0
    while i < ary.size
      ary[i] = ary[i].strip
      i+=1
    end

    ary.each do |specialty|

      our_specialty = @@all.select do |langu|
                        langu.name == specialty
                      end


      if our_specialty == false || our_specialty == nil || our_specialty.length == 0
        new_specialty = Specialites.new(specialty)
        new_specialty.providers << provider
        speciality_instances_to_return << new_specialty

      else
        our_specialty[0].providers << provider
        speciality_instances_to_return << our_specialty
      end

    end
    speciality_instances_to_return
  end



  def self.specialties_by_provider(provider)

      provider_specialties = Array.new

      @@all.each do |specialty|
        specialty.providers.each do |prvdr|
          if prvdr == provider
            provider_specialties << specialty.name
          end
        end
      end
      provider_specialties.join(', ')
  end



  def self.all
    @@all
  end

end

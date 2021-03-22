class Person < Object
  attr_reader :name
  def initialize(name)
    @name = name
  end

  def ==(other_person)
    name == other_person.name
  end
end

me = Person.new("Donny")
me_too = Person.new('Donny')

p me.eql?(me_too)

#Object#===
  #-should override to fit your specific class needs
  #- if not overridden #=== is a alias for #==
    # -Person#== OR BasicObject#==
      # BasicObject#==
        #- WHEN #== is not overridden
        # BasicObect#== is an alias for BasicObject#equal?
          # consideres the object_id of each object

#Person < Object < Kernel (module) < BasicObject
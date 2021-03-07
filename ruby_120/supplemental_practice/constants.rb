module MyModule
  CONSTANT2 = "Hello from #{self}"
end

class FirstClass
  include MyModule
  CONSTANT = 'Hello from FirstClass'

  def self.hi
    puts "#{CONSTANT2} via #{self} via interface inheritance"
  end
end

class AnotherClass
  def self.hello
    puts "#{FirstClass::CONSTANT} via #{self} using namespace resolution"
  end
  
  def self.hi
    puts "#{MyModule::CONSTANT2} via #{self} using namespace resolution"
  end
end

class SecondClass < FirstClass
  include MyModule
  def self.hello
    puts "#{CONSTANT} via #{self} using direct inheritance"
  end

  def self.hi
    puts "#{CONSTANT2} via #{self} via interface inheritance"
  end
end

class ThirdClass < SecondClass
  include MyModule
  def self.hello
    puts "#{FirstClass::CONSTANT} via #{self} using namespace resolution"
  end
end

AnotherClass.hello
SecondClass.hello
ThirdClass.hello
puts ""
AnotherClass.hi
FirstClass.hi
SecondClass.hi
ThirdClass.hi

#When not inherited -- we must reference constants using
# namespace resolution (::)

#When a class inherits a constant from a more super class --  we can reference
# the constant as IF it were defined within the body of the subclass itself
# no need for namespace resolution
  # a user COULD use namespace as well -- the benfit being that anyone interacting
  # with the codebase would understand where, explicitly, the constant was defined.

#Module inheritance works in the same way. If the module is included in the class
# OR a superclass -- then we can reference the constant as IF it were defined in the
# class definiton of any subclass
  #Neither SecondClass or ThirdClass explicitly 'include' MyModule yet they 
  # have access to CONSTANT2 as if it were defined in their own class definitons

#In short
  #if a constant is inherited -- there is no need to use namespacing, but it IS
  # a good practice in order to reduce the ambiguity when other people are interacting
  # with our code in a larger code base



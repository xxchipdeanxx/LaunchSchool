#Now create a smart name= method that can take just a first name or a full 
#name, and knows how to set the first_name and last_name appropriately.

class Person
  attr_accessor :first_name, :last_name
  def initialize(name)
    @first_name = name
    @last_name = ''
  end

  def name
    @first_name + " " + @last_name
  end

  def name=(new_name)
    # checks for a full or partial name entry
    partial_name = new_name.split
    self.first_name = partial_name.first
    self.last_name = partial_name.size > 1 ? partial_name.last : ''
  end
end


bob = Person.new('Robert')
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
p bob.last_name             # => ''
bob.last_name = 'Smith'
p bob.name                  # => 'Robert Smith'

bob.name = "John"
p bob.name
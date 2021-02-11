#Write the classes and methods that will be necessary to make this code run, 
#and print the following output:

def new_line
  puts "\n"
end

class Pet
  attr_reader :name, :pet_type
  def initialize(pet_type, name)
    @pet_type = pet_type
    @name = name
  end

  def print_info
   puts "a #{pet_type} named #{name}"
  end
end

class Owner
  attr_reader :name, :pets
  def initialize(name)
    @name = name
    @pets = []
  end

  def number_of_pets
    @pets.size
  end

  def add_pet(pet)
    @pets << pet
  end
end

class Shelter
  def initialize
    @recorded_owners = []
    @unadopted_pets = []
  end

  def adopt(owner, animal)
    @recorded_owners << owner unless existing_owner?(owner)
    @unadopted_pets.delete(animal)
    owner.add_pet(animal)
  end

  def take_in(pet)
    @unadopted_pets << pet
  end

  def existing_owner?(owner)
    @recorded_owners.include?(owner)
  end

  def print_adoptions
    @recorded_owners.each do |owner|
     puts "#{owner.name} has adopted the following pets:"
     owner.pets.each do |pet|
      pet.print_info
     end
     new_line
    end 
  end

  def print_not_adopted
    puts "The Animal Shelter has the following pets seeking forever homes:"
    @unadopted_pets.each do |pet|
      pet.print_info
    end
  end
end




butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')
barko        = Pet.new('dog', 'Barko')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')
dredding = Owner.new('D Redding')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.take_in(barko)
shelter.adopt(dredding, barko)
shelter.print_adoptions
# puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
# puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."

# P Hanson has adopted the following pets:
# a cat named Butterscotch
# a cat named Pudding
# a bearded dragon named Darwin

# B Holmes has adopted the following pets:
# a dog named Molly
# a parakeet named Sweetie Pie
# a dog named Kennedy
# a fish named Chester

# P Hanson has 3 adopted pets.
# B Holmes has 4 adopted pets.
#On lines 41 and 42 of our code, we can see that grace and ada are located at 
#the same coordinates. So why does line 43 output false? Fix the code to 
#produce the expected output.

class Person
  attr_reader :name
  attr_accessor :location

  def initialize(name)
    @name = name
  end

  def teleport_to(latitude, longitude)
    @location = GeoLocation.new(latitude, longitude)
  end
end

class GeoLocation
  attr_reader :latitude, :longitude

  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
  end

  def to_s
    "(#{latitude}, #{longitude})"
  end

  def ==(other_location)
    latitude == other_location.latitude && longitude == other_location.longitude
  end
end

# Example

ada = Person.new('Ada')
ada.location = GeoLocation.new(53.477, -2.236)

grace = Person.new('Grace')
grace.location = GeoLocation.new(-33.89, 151.277)

ada.teleport_to(-33.89, 151.277)

puts ada.location                   # (-33.89, 151.277)
puts grace.location                 # (-33.89, 151.277)
puts ada.location == grace.location # expected: true
                                    # actual: false

#Person#location will return an instance of GeoLocation. While it is true
# that both ada.location and grace.location will return GeoLocation objects that
# have values that WE would consider equal; it is because GeoLocation is a custom class that
# we must define a (==) method in order for line 47 to evaluate as expexted

#In absence of a overridden (==) method - Ruby will seach for a (==) method
# up the ancestor chain and eventually find one in Objct#==. The trouble is
# Object#== is a alias for Object#equal?, meaning we are technically comparing
# the object id's of each instance of GeoLocation instead of the VALUES. 

#They are two seperate instances of GeoLocation class and thus have different
# object id's -- this is why our initial implementation returns false
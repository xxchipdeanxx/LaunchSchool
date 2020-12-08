# see if "Spot" is present.
# What are two other hash methods that would work just as well for this solution?

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.include?('Spot')
ages.key?('Spot')
ages.member?('Spot')
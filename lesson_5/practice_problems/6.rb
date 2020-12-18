#One of the most frequently used real-world string properties is that of "string substitution", where we take a hard-coded string and modify it with various parameters from our program.
#Print out each of the Munster family details to the console in a string.

## EXAMPLE ##
#(Name) is a (age)-year-old (male or female).

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |person, details|
  puts "#{person} is a #{details['age']} year old #{details['gender']}"
end
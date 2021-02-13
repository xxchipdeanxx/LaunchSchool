#Given this nested Hash:
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
#figure out the total age of just the male members of the family.

#ALGO#
# 1. iterate through the elements of the Hash
# 2. Check the value stored at 'gender' key
# 3. if 'gender' key stores 'male'
# 4. then access the value stored at 'age' and add it to total_male_age
# 5. print the fina number to the console

total_male_age = 0
munsters.each_value do |details|
  total_male_age += details['age'] if details['gender'] == 'male'
end
p total_male_age
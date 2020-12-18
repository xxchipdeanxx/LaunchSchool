#Modify the hash such that each member of the Munster family has an additional "age_group" key
#that has one of three values describing the age group the family member is in (kid, adult, or senior).
#Your solution should produce the hash below.

## EXAMPLE ## 
# { "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
# "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
# "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
# "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
# "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }

## RULES ## 
# Input: hash
# Output: original NESTED hash

## EXPLICIT ##
# 1. Program must modify the origional hash
# 2. The resulting hash will be NESTED
#   - The name will be the key
#   - The age,gender,age_group will be a hash itself
# 3. age_group is broken down into 3 categories
#   - 'kid' == (0..17)
#   - 'adult' == (18..65)
#   - 'senior' == (65..500)

## DATE STRUCTURE ## 
# A nested hash
  # - The family memebr name is the outter key
  # - The value is an array itself containnig the information

## ALGORITHM ##
# 1. Iterate through the outter keys of munsters
# 2. Access the integer (AGE) value stored by the 'age' key
# 3. A new key/value pair is created
#   a. the key will always be 'age_group'
#   b. the value will be assigned based on the value stored at 'age'
#     - if the age is less than 18 the age group is equal to 'kid'
#     - if the age group is greater than 18 but less than 65, age group equals 'adult'
#     - if the age group is greater then 65, age group equals 'senior'

## METHODS ##
# Since we need to 'modify' the origioal hash .each? may work



  munsters = {
    "Herman" => { "age" => 32, "gender" => "male" },
    "Lily" => { "age" => 30, "gender" => "female" },
    "Grandpa" => { "age" => 402, "gender" => "male" },
    "Eddie" => { "age" => 10, "gender" => "male" },
    "Marilyn" => { "age" => 23, "gender" => "female"}
  }

  munsters.each do |family_member, info_hash|
    age_group = nil
    family_member_age = info_hash['age']

    if (0..17).include?(family_member_age)
       age_group = 'kid'
    elsif (18..64).include?(family_member_age)
      age_group = 'adult'
    else
      age_group = 'senior'
    end
    info_hash['age_group'] = age_group
  end

  p munsters

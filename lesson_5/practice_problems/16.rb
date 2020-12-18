#Each UUID consists of 32 hexadecimal characters, and is typically broken into 5 sections like this 8-4-4-4-12 and represented as a string.
# Must adhere to 8-4-4-4-12 format
# Must be 32 RANDOM character bits
# Total string should be 36 characters
# Must also include 4 (-) in the format
# ALL characters must be random
  # letters are all lowercased

## METHODS ##
#(range).to_a
# Array.join

## EXAMPLE ## 
# "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

## ALGO ##
# 1. create a final_array to store characrer string
# 2. create a character range (a..z) and convert to an array
# 3. create a numer range (1..9) and convert to an array
# 4. append both arrays togather to for random_char array
# 5. sample random_char array and append the return value to the final_array
# 6. repeat step 6 until final_array size is equal to 32
# 3. place (-) in array at SPECIFIC indexes within final_array
# 4. join the array and return the resuling string

#INPUT: none
#OUTPUT: string of 36 characters
  # 32 character bits
  # 4 (-) in specific locations to adhere to format

def gen_uuid
  final_array = []
  char_array = ('a'..'z').to_a
  num_array = (1..9).to_a
  random_char_array = char_array + num_array
  dash_index_posittions = [8,13,18,23]

  until final_array.size == 32
    final_array << random_char_array.sample
  end

  dash_index_posittions.each do |index_num|
    final_array.insert(index_num, '-')
  end

  final_array.join
end

p gen_uuid

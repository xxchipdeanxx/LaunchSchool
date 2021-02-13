# Create a hash that expresses the frequency with which each letter occurs in this string

# EXAMPLE # 
#{ "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }

# RULES #
#Input: A string of characters
#Output: A hash with the letter as a key and the frequency of occurance as a value

# INPLICIT RULES #
#Keys do not have to be in alphabetical order
#It appears as if capital letters are the SAME as their lowercase counterparts

# ALGO_OPT 1 #
# 1. Create an empty hash to collect our results
# 2. Create an array that contains all possible letter matches
#   - upper and lower case 
# 3. Iterate through the entire 'letter' array
# 4. Scan the statement for matches
#   - will create an array with all letter matches
#   -frequency will be the size of the array produced
# 5. If there is a match
#   - the 'letter' becomes the hash key
#   - the frequency of the occurance becomes the value
# 6. Print the hash to the console


statement = "The Flintstones Rock"
uppercase = ('A'..'Z').to_a
lowercase = ('a'..'z').to_a
letters = uppercase + lowercase

letter_hash = {}

letters.each do |letter|
  frequency = statement.scan(letter).count
  letter_hash[letter] = frequency if frequency > 0
end

p letter_hash
# Find the index of the first name that starts with "Be"
#Input: Array of Strings
#Output: Integer (index of element)

# ALGORITHM #
# 1. iterate through Array
# 2. check each element against condidion (starts with 'Be')
# 3. return the index of the first element to match

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

p flintstones.index {|name| name.start_with?('Be')}

# Amend this array so that the names are all shortened to just the first three characters
#Input: An array of Strings
#Output: The same array, only modified

# ALGORITHM #
# 1. iterate through the array
# 2. modify each element so it only stores the first three characters
# 3. return the origional, modified array


flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

p flintstones.map! {|name| name[0,3]}
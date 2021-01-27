#Write a method 'scramble' that that returns true if a portion of
# str1 can be rearranged to match str2. Otherwise return false

# Only lowecase letters a-z will be used. And no punctuation or
# digits will be included as inputs

# Rules #
# only lower case letters will be used
# return true if a portion of str1 would be rearranged to form str2
  # - false otherwise
# what to do with blank strings? --> auto false?

#Input - two strings --> all lowercase letters
#Output - true or false

# Does the first string contain all the letters
# and the number of characters necessary to form the second string?
  # does 'javasss' contain:
    # - 2 j's
    # - 2 s's
  # In this case-- no --> false

  # Data - Array and Hash?
    # str1_char_hsh {
    #   j: 2
    #   s: 2
    #}

    # str2_char_hsh {
    #   j: 1
    #   a: 2
    #   v: 1
    #   s: 3
    #}

# Algo #
# create an empty hash called char_hsh {}
# get a letter count for str2 *
  # - break str2 into its component chars
  # - get a count of all the chars and their number of occurances
    # iterate through the char_ary
      # - if char_hsh.key?(char)
        # - char_hsh[char] += 1
      # - else char_hsh[char] = 1
# use char_hsh to compare against the chars in str1
  # - iterate through comparison = str1_hsh --> key/values (select)
    # - if str_2 hash has the same key and the same or more occurances --> true
        # - str2.key?(key) && str2[key] >= value
    # - else false
# if comparison.size == str1_hsh.size --> each char and amount of occurance was sastified

def scramble(str1, str2)
  str1_hsh = generate_char_hash(str1)
  str2_hsh = generate_char_hash(str2)
  
  post_compare_hsh = str2_hsh.select do |hsh2_k, hsh2_v|
    str1_hsh.key?(hsh2_k) && str1_hsh[hsh2_k] >= hsh2_v
  end
  post_compare_hsh == str2_hsh
end

def generate_char_hash(string)
  return_hsh = {}
  char_ary = string.chars

  char_ary.each do |char|
    if return_hsh.key?(char)
      return_hsh[char] += 1
    else
      return_hsh[char] = 1
    end
  end
  return_hsh
end

p scramble('javasss', 'jjss') == false
p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false
p scramble('scriptjava', 'javascript') == true
p scramble('scriptingjava', 'javascript') == true

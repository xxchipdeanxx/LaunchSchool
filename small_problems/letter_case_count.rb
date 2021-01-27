#Write a method that takes a string, and then returns a hash that contains 3 
#entries: one represents the number of characters in the string that are 
#lowercase letters, one the number of characters that are uppercase letters, 
#and one the number of characters that are neither.

#scan through a string and create a hash that contains a count:
  # lowercase chars
  # uppercase chars
  # neighter

#Rules
#input -string
#output- Hash

#a empty string should result in a hash with all values init. to zero
# a space is considered a char (neither) in this problem


#Data - Hash Array(?)

#Algo
# init a hash with 3 keys/val
#iterate through each char in the string
#evaluate if the char at the index is 
  # a up case letter
  # a down case letter
  # neither

#retun the hash



def letter_case_count(string)
  case_hsh = { lowercase: 0, uppercase: 0, neither: 0 }
  string.chars.each do |char|
    if (65..90).to_a.include?(char.ord)
      case_hsh[:uppercase] += 1 
    elsif (97..122).to_a.include?(char.ord)
      case_hsh[:lowercase] += 1 
    else
      case_hsh[:neither] +=1
    end
  end
  case_hsh
end


p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
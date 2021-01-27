#Write a function that takes an INTEGER as input, 
#and returns the number of bits that are equal to one in the binary representation of 
#that number. You can guarantee that input is non-negative.

#Write a method that take a postive integer.
#Method should return the number of BITS that equal 1 in the
#binary representaion of that number.

#Example: The binary representation of 1234 is 10011010010, 
# There are 5 1's in the binary string
#so the function should return 5 in this case

## RULES ##
# Input will always be positive
# Input will always be an INTEGER (i.e. NEVER a float)

#input: a positive integer
#output: an integer representing the numer of times 1 occurs in the
  #binary representaion of a number

## OBSERVATIONS ##
#How do get the binary representation of an Integer?

## METHODS ##
  # to_s(2) --> a STRING representation of a number in binary

## ALGO ##
# 1. convert the argument into a string of bits (.to_s(2))
# 2. invoke .count('1') on the bit string --> integer of matches


def count_bits(n)
  n.to_s(2).count('1')
end

p count_bits(1234) == 5 
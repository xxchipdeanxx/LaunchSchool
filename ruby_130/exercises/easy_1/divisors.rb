#Write a method that returns a list of all of the divisors of the positive 
#integer passed in as an argument. The return value can be in any sequence 
#you wish.

#Brute Force#
#Time Complexity: O(n)

# def divisors(num)
#   results = []
#   (1..num).each do |denom|
#     results << denom if (num % denom == 0)
#   end
#   results
# end

# def divisors(num)
#   1.upto(num).select {|divisor| num % divisor == 0}
# end

#Basic Integer Facotrialization Using Sqrt#
#Time Complexity: O(sqrt(n))

def divisors(num)
  results = []
  divisor = 1
  while divisor <= Integer.sqrt(num)
    if num % divisor == 0
      results << divisor << num.divmod(divisor).first
    end
    divisor += 1
  end
  results.uniq.sort
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
divisors(99400891) == [1, 9967, 9973, 99400891]  #may take a minute
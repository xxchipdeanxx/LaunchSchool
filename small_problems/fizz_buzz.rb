#Write a method that takes two arguments: the first is the starting number, 
#and the second is the ending number. Print out all numbers between the two 
#numbers, except if a number is divisible by 3, print "Fizz", if a number is 
#divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5, 
#print "FizzBuzz".

#Problem
#given two numbers; print out all the numbers from the first to the second
# if the num is divisible by 3 --> replace with "Fizz"
#if the num is div by 5 --> print "Buzz"
# if the num is div by BOTH 3 and 5 --> print "FizzBuzz"

#Rules
#input - two number
#output - a stream of numbers and "fizz" .. 'buzz' .. etc

#Data - 

#Algo
#iterate through the numbers inclusivly
#create conditional statment to check divisibility
#print the propper output

def div_by_3(num)
  num % 3 == 0
end

def div_by_5(num)
  num % 5 == 0
end


def fizzbuzz(num1, num2)
  (num1..num2).each do |num|
    if div_by_3(num) && div_by_5(num)
      puts 'FizzBuzz'
    elsif div_by_3(num)
      puts 'Fizz'
    elsif div_by_5(num)
      puts 'Buzz'
    else
      puts num
    end
  end
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
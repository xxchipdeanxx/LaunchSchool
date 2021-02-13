# Write a series of methods that will allow us to calculate the following:

# Examples # 
#seven(times(five)) # must return 35
#four(plus(nine)) # must return 13
#eight(minus(three)) # must return 5
#six(divided_by(two)) # must return 3

# Rules #

#There must be a function for each number from 0 ("zero") to 9 ("nine")

#There must be a function for each of the following mathematical operations:
# plus, minus, times, divided_by

#Each calculation consist of exactly one operation and two numbers

#The most OUTER function represents the LEFT operand, 

#the most INNNER function represents the RIGHT operand

#Division should be integer division. 
#For example:
  # eight(divided_by(three())) == 2
  # this should return 2, not 2.666666...:

#Input - Each number method could take either a operand method OR nil
#Output - An integer value after operation

# Data - Integers


# Algo #
# each number method can either be left or right operand
  # it must either implement another method OR be passed
  # we will need a defaul argument for each num method

# each operation will take an argument
  # one of the number definitions

# seven(times(five())) == 35
  # times(five()) --> 
  # seven(return value)

# five(opertation = nil)
  # if it is not passed an operation
  # return the value --> '5'

#times(return value of number)
  # return value of num.insert(0, '*').chars
    # ['*', '5']

#seven(operation = nil)
 # if operation == nil
    # --> '7'
  # else operation.unshift('7')
  # operation_array = ['7', '*', '5']
  # case operation[1]
  # when "+"
  # operation[0].to_i + operation[2].to_i
  # when "-"
    # operation[0].to_i - operation[2].to_i

def zero(operator = nil)
  return '0' if operator == nil
  operator.unshift('0')

  case operator[1]
  when "+"
    operator[0].to_i + operator[2].to_i
  when "-"
    operator[0].to_i - operator[2].to_i
  when "*"
    operator[0].to_i * operator[2].to_i
  when "/"
    operator[0].to_i / operator[2].to_i
  end
end

def one(operator = nil)
  return '1' if operator == nil
  operator.unshift('1')

  case operator[1]
  when "+"
    operator[0].to_i + operator[2].to_i
  when "-"
    operator[0].to_i - operator[2].to_i
  when "*"
    operator[0].to_i * operator[2].to_i
  when "/"
    operator[0].to_i / operator[2].to_i
  end
end

def two(operator = nil)
  return '2' if operator == nil
  operator.unshift('2')

  case operator[1]
  when "+"
    operator[0].to_i + operator[2].to_i
  when "-"
    operator[0].to_i - operator[2].to_i
  when "*"
    operator[0].to_i * operator[2].to_i
  when "/"
    operator[0].to_i / operator[2].to_i
  end
end

def three(operator = nil)
  return '3' if operator == nil
  operator.unshift('3')

  case operator[1]
  when "+"
    operator[0].to_i + operator[2].to_i
  when "-"
    operator[0].to_i - operator[2].to_i
  when "*"
    operator[0].to_i * operator[2].to_i
  when "/"
    operator[0].to_i / operator[2].to_i
  end
end

def four(operator = nil)
  return '4' if operator == nil
  operator.unshift('4')

  case operator[1]
  when "+"
    operator[0].to_i + operator[2].to_i
  when "-"
    operator[0].to_i - operator[2].to_i
  when "*"
    operator[0].to_i * operator[2].to_i
  when "/"
    operator[0].to_i / operator[2].to_i
  end
end

def five(operator = nil)
  return '5' if operator == nil
  operator.unshift('5')

  case operator[1]
  when "+"
    operator[0].to_i + operator[2].to_i
  when "-"
    operator[0].to_i - operator[2].to_i
  when "*"
    operator[0].to_i * operator[2].to_i
  when "/"
    operator[0].to_i / operator[2].to_i
  end
end

def six(operator = nil)
  return '6' if operator == nil
  operator.unshift('6')

  case operator[1]
  when "+"
    operator[0].to_i + operator[2].to_i
  when "-"
    operator[0].to_i - operator[2].to_i
  when "*"
    operator[0].to_i * operator[2].to_i
  when "/"
    operator[0].to_i / operator[2].to_i
  end
end

def seven(operator = nil)
  return '7' if operator == nil
  operator.unshift('7')

  case operator[1]
  when "+"
    operator[0].to_i + operator[2].to_i
  when "-"
    operator[0].to_i - operator[2].to_i
  when "*"
    operator[0].to_i * operator[2].to_i
  when "/"
    operator[0].to_i / operator[2].to_i
  end
end

def eight(operator = nil)
  return '8' if operator == nil
  operator.unshift('8')

  case operator[1]
  when "+"
    operator[0].to_i + operator[2].to_i
  when "-"
    operator[0].to_i - operator[2].to_i
  when "*"
    operator[0].to_i * operator[2].to_i
  when "/"
    operator[0].to_i / operator[2].to_i
  end
end

def nine(operator = nil)
  return '9' if operator == nil
  operator.unshift('9')

  case operator[1]
  when "+"
    operator[0].to_i + operator[2].to_i
  when "-"
    operator[0].to_i - operator[2].to_i
  when "*"
    operator[0].to_i * operator[2].to_i
  when "/"
    operator[0].to_i / operator[2].to_i
  end
end

def plus(number)
  number.insert(0, '+').chars
end

def minus(number)
  number.insert(0, '-').chars
end

def times(number)
  number.insert(0, '*').chars
end

def divided_by(number)
  number.insert(0, '/').chars
end


p seven(times(five())) == 35
p four(plus(nine())) == 13
p eight(minus(three())) == 5
p six(divided_by(two())) == 3

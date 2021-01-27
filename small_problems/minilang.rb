#In a stack-and-register language; we have two components the STACK and
#the REGISTER value. The STACK is a data type that is LIFO
#(Last in First Out). Values are either PUSHED onto the top of the stack
#or POPPED off. And when we issue the POP command, we are accessing the
#very first avaiable value on the stack, which was ALSO the most recently
#added value.

#STACK: 3,4,5
#POP 6 
#STACK: 3,4,6,6

#In a stack-and-register language; when we want to perform an
#operation that takes two values--> we pop one value off the stack
#and perform the opperation with another, user supplied value REGISTER
#the result of the operation is then stored in the REGISTER

#It is important to note that the REGISTER is a seperate data entity
#than the stack. The REGISTER holds the results of our operations.

#Consider a MULT operation in a stack-and-register language. 
#It multiplies the stack value with the register value, removes the value 
#from the stack, and then stores the result back in the register. 
#Thus, if we start with a stack of 3 6 4 (where 4 is the topmost item in the 
#stack), and a register value of 7, then the MULT operation will 
#transform things to 3 6 on the stack (the 4 is removed), and the result 
#of the multiplication, 28, is left in the register. If we do another MULT 
#at this point, then the stack is transformed to 3, and the register is left 
#with the value 168.

#Our goal is to write a method that acts as a stack-and-register
#mini language. In our case we will use Ruby's #Array class and 
#Array.push and #Array.pop to manage the stack. 

#Our stack will work from right to left. Meaning the right-most value
#was the most recently added and will be the first value to be POPPED off.

#Our mini-language should include the following commands:
# n - Place a value n in the "register". Do not modify the stack. 
# PUSH - Push the register value on to the stack. Leave the value in the register. 
# ADD - Pops a value from the stack and adds it to the register value, storing the result in the register. 
# SUB - Pops a value from the stack and subtracts it from the register value, storing the result in the register. 
# MULT - Pops a value from the stack and multiplies it by the register value, storing the result in the register.
# DIV - Pops a value from the stack and divides it into the register value, storing the integer result in the register.
# MOD - Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
  # REGISTER % STACK VALUE --> REGISTER
# POP - Remove the topmost item from the stack and place in register   
# PRINT - Print the register value 


#Rules
#Our operations will only be supplied with Integer values
# The register should be initialized to 0
# We can assume that all commands are correct
  # we do not need to consider error arguments where:
    # someone tries to POP a value not on the stack
    # the command string won't contain unknown tokens/commands
#Operations are always with respect to the REGISTER
  #REGISTER operaiton STACK VALUE --> REGISTER
#Make sure we are POPPING off STACK values when operations are called
#All strings will be upcased
#All numbers will be integers (positive or negative)

#Input - A string containing a chain of commands to be issued by our language
#Output - The output of any PRINT statements
  # the language will perform other tasks, but the only ouput
  # will be when PRINT comands are issued

#Syntax
# The occurance of a number loads it into the REGISTER
# The commands are issued in series from left-->right

#Data - Array

#Algo
#initilize a REGISTER = 0
#initilize a STACK = []
#break down the string by 'phrase' to create a command_stream
  # each element will represent a step that needs to be done in sequence
#iteate through the command_stream and execute based on the 'phrase'
  # command_stream.each do |command|
    # REGISTER = command.to_i if command.size == 1
#------
#option_1 (case statement) --> command
  # when ADD
    #REIGSTER +=  STACK
  #when PUSH
    #Stack << REGISTER
  #when PRINT
    #puts register

#Refactor
#Expand the ability of our function by creating another method
#Minilang that can format and pass an string to #minilang

# '(3 + (4 * 5) - 7) / (5 % 3)'

  # 5
  # PUSH
  # 3
  # MOD
  # PUSH

  # 4
  # PUSH
  # 5
  # MULT --> 20
  # PUSH
  # 3
  # ADD --> 23
  # PUSH
  # 7
  # SUB --> 16
 


#Problem
#Format the incoming string so that it will be compatiable with the
#syntax accepted by #minilang
#minilang(Minilang('(3 + (4 * 5) - 7) / (5 % 3)'))

#Data - String
# compute any values that are 

#Algo
# remove spaces from the string
  # "(3+(4*5)-7)/(5%3)"
# Divisor needs to be calculated first and the result #Pushed
  # if regexp match division
    # any num (optional) "("
    # at least one digits
    # any num (optional) ")"
    # 
# Nested operations need to be done first
  # regexp?

require 'pry'    

def minilang(string)
  register = 0
  stack = []
  command_stream = string.split

  command_stream.each do |command|
    register = command.to_i if command.size <= 2
    case command
    when "ADD"
      register += stack.pop
    when "SUB"
      register -= stack.pop
    when "MULT"
      register *= stack.pop
    when "DIV"
      register /= stack.pop
    when "MOD"
      register %= stack.pop
    when "PUSH"
      stack.push(register)
    when "POP"
      register = stack.pop
    when "PRINT"
      puts register
    end
  end
end

def new_line
 puts "\n"
end




#Examples
# minilang('PRINT')
# 0   --> because REGISTER is init. to 0

minilang('5 PUSH 3 MULT PRINT')
# 15
new_line

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8
new_line

minilang('5 PUSH POP PRINT')
# 5
new_line

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7
new_line

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6
new_line

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12
new_line

minilang('-3 PUSH 5 SUB PRINT')
# 8
new_line

minilang('6 PUSH')
# (nothing printed; no PRINT commands)

new_line

puts "end"
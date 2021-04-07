my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda
puts my_second_lambda
puts my_lambda.class
my_lambda.call('dog')
my_lambda.call
my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }

#Lines 1 and 2 demonstrate the two different ways in which we can create
#a lambda style Proc object. We can either use the LAMBDA keyword OR we can use
# the -> syntax
  #variable = -> (args*) {#block implrementation}

#Line 3 will invoke Object#to_s which will display some basic information
  #about the Proc object referenced by my_lambda
  #The ouput is similar to a simple Proc in that the console will display
  #The object's class (Proc)
  #An encoding of the memory address that the Proc object is stored at
  #BUT since my_lambda is a lambda style Proc object we will ALSO see
    # (lambda) displayed in the output as well
      #<Proc:0x0007...a30 (lambda)>

#Line 4 will display similar informaiton to the Object#to_s call on Line 3
  #The only real difference is that the memory encoding will be different
  #since my_lambda and my_second_lambda are two seperate instanes of Proc class

#Line 5 will display the class that my_lambda is an instance of.
  #=> Proc
  #Note, despite being a lambda, that the return of Object#class is Proc.
  #This tells us that lambdas are a specific TYPE of Proc, but they are
  #instanes of the Proc class nonetheless

#Line 6 will implrement just fine. We are using Proc#call to invoke the block
  #that was supplied during the creation of the Proc object that was created on line
  #Line 1. The output will be:
    #'This is a dog'

#Line 7 will result in the Ruby interpreter throwing an ArgumentError
  #since my_lambda is a lambda style proc, it has a stricter arity.
  #meaning it is EXPECTING to see exactly one argument passed to the block
  #any more and any less will result in an ArgumentError based on the way
  #we have chosen to implement the block and its BLOCK parameters
    #ArgumentError: wrong number of arguments (given 0, expected 1)

  #Note, had we decided to implement my_lambda in a different way, we may not
    #get an ArgumentError
      # my_lambda = lambda {|*thing| puts "This is a #{thing}."}
    #If this were the case, we COULD make a call like:
      #my_lambda.call #=> 'This is a []'
    #This is possible because the splat (*) operator causes the block parameter
      #thing to be turned into an array --> regardless if we actually pass any
      #arguments or not. In this case the block will always have an 'argument'

#Line 8 will reusult in an NameError. This is because the core Ruby interpreter
#has no context for the constant Lambda. Lambda is not a class that Ruby recognizes
#this further demonstates the concept that lambdas are NOT a seperate class than
#Procs. They are merely a specific STYLE of a proc object that have much tighter arity rules

#ANOTER important concept to remember is that blocks,Procs, and lambdas all behave
#VERY differently when they are supplied EXPLICIT return statements
  #lambdas will return one step out from where they were CALLED
  #blocks and Procs will return to where they were DEFINED.
  #This can create some buggy code if we are unaware of this difference
    #most of the time this behavior will never come into play
  #But if we have a series of methods that may pass a simple Proc as an
  #argumet and, somewhere along the line, the Proc oject gets invoked via
  # #call and the simple Proc had implemented an explicit RETURN statement
  #the execution of the program would return to WHERE the simple proc was
  #origionally defined. Essentially circumventing the rest of the execution
  
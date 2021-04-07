# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc
puts my_proc.class
my_proc.call
my_proc.call('cat')
my_proc.call('cat', 'dog')

#Line 2 creates a Proc object with a block that has one parameter
#Line 3 will use Object#to_s and display basic information about my_proc
  #which is an instance of Proc class
  #We will see the class displayed
  #Along with the memoy address encoded

#Line 4 will output Proc after Oject#class is called on my_proc
#Line 5 WILL be able to run, but since we have passed no argument that will
  #yield to the block the output will be 'This is a .'
  #the block will return (nil)
#Line 5 will also run, and since we have provided an argument, the final
  #output will be 'This is a cat.' The block will return (nil)

#Line 7 will produce the same result as line 6. It is true that we are passing
#one additional argument ('dog') into the block, but since my_proc us a simple
#proc object --> it has a laxed arity and will allow for MORE or LESS arguents
#to be passed that the number of BLOCK PARAMETERS defined. 
  #Had my_proc been created as a lambda style Proc -- we would have gotten
  #an argument error as the arity of lambdas is MUCH more restrictive

#BOTH lines 5 and 6 invoke Proc#call which will invoke the block that
  # was supplied when the Proc object was created. Any arguments that
  #are included with the invocation of #call will be passed to the block
  #although not all of the arguments will actually be used upon block invocation.



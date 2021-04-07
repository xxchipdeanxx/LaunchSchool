def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}
block_method_1('seal')

#Lines 1-3 are used to define a method that takes one 'normal' argument
#and is also meant to yield to an implicit block upon method invocation

#Line 5 will be able to be invoked, BUT the result may not be quite what
#was expected.
  #block_method_1 is invoked with a explicit argument 'seal' and an implicit
  #block which - itself - is meant to take one argument
#execution jumps into #block_method_1 where 'seal' is set to be referenced by
# the local variable 'animal'.
#from there the method yields to the block, and since a block was supplied
#implicitly --> we have no errors
#execution jumps into the block, BUT since we have passed NO arguments to the
#block via yield (on Line 2). The local block variable 'seal' was never initialized
#this it remains (nil)
# The string is displayed to the consol via Kernel#puts, BUT it will only
# display the following:
  # 'This is  .'

#Line 6 will give us some problems. We begin by invoking the method #block_method_1
#and we supply the explicit argument 'seal'. Execution jumps to the method where the
#String 'seal' with be referenced by the local variable animal. Execution continues to
#the yield method, BUT since we did not supply the method call with a block, no block was passed
#the result will be a LocalJump error.
  #Basically the Ruby interepreter is informing the user that is SEES that it SHOULD be yielding ('jumping')
  #to some location to continue execution, but it does not know where to go as a destinaton was never supplied
  #when #my_block_method_1 was invoked on Line 6

#we can provide a condition in which the method will yield to a block ONLY if a block was supplied
#if no block was supplied --> do not jump.
  #We accomplish this by using Kernel#block_given?
    # yield if block_given?


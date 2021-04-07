def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
# animal = 'test'
block_method_2('turtle') { puts "This is a #{animal}."}

#Lines 1-3 set up a method #block_method_2 which is designed to take
#one explicit, normal argument and an implicit block argument. When a block
#is supplied, the method will yield to the block and pass the local variable
#'animal' into the block to be used as a BLOCK ARGUMENT
#once the block has finished implementing. Execution is set to return to the method
#Since yield is the last statment in the method definition --> the return value of the block
#will become the implicit return value for the entire method

#Line 5 will invoke #block_method_2 by passing the method an explicit argument 'turtle'
#and an implicit block which -- itself -- takes a single block argument
#Execution jumps to the block where the String 'turtle' 'seal' is referenced by the
#local variable animal. 
#From there execution continues into the method body where Ruby will yield to the
#block and pass the string referened by animal into the block as an argument
#Execution jumps to the block where the String 'turtle' is set to be referenced by
#The local block variable 'turtle'.
#From there the block will invoke the Kernel#puts method and display the string:
  #'This is a turtle'
#The block will return (nil) since Kernel#puts returns nil
#Control is returned to #block_method_2 and since yield is the last line in the method
#definition --> the retrun value of the block (nil) will be the return value of the method


#Line 6 will be invoked in a very similar way. #block_method_2 is called with
#one explicit argument -- the String 'turtle', and an implicit block that has two
#parameters defined 'turtle' and 'seal'
#Execution jumps to the method where the String 'turtle' is set to be referenced by the local
#variable animal. From there Ruby will yield to the block and pass the String refereced by animal into the block
#Execution jumps into the block where the String 'turtle' is set to by referenced by the local, block variable
#turtle. BUT since we did not supply a second argument when we yielded to the block. The second block variable
#seal will not be initialized and will this remain (nil)

#Since the arity rules of a block are very laxed, the block is able to be invoked regardless
#The Kernel#puts method will display the string:
  # 'This is a turtle and a .'
  #NOTE how our seal variable simply returns an empty space since it was (nil)
#The block will return nil and exeution will return to the method where nil will be the final return value

#Line 9 will begin invocation in a similar way. Execution will eventually jump to the
#block with the String 'turtle' being passed as block argument. The issue here is that, 
#the way the block was implemented -- the String 'turtle' will never be assigned to
#any local block variables. Since the block never defined any block parameters -- the Ruby
#interpreter does not know what #{animal} is meant to be. This is why we get a NameError
  # undefined local variales or method 'animal' (NameError)

#And since there was no 'animal' method or local variable defined within the binding scope
#of the block definition...animal has ZERO context

#HAD we defined a local variable animal in the main portion of the program. The block
#would have bound the context of animal and simply used that object to invoke the call to #{animal}

#It is IMPORTANT to rememer that closures in Ruby have a binding scope. They
#carry the context of where they were defined WITH them. WHERE they are defined
#if is great importance when determining the value of certain methods/variables elsewhere in the program
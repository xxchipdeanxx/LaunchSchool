# You started writing a very basic class for handling files. However, 
#when you begin to write some simple test code, you get a NameError. 
#The error message complains of an uninitialized constant 
#File::FORMAT.

class File
  attr_accessor :name, :byte_content

  def initialize(name)
    @name = name
  end

  alias_method :read,  :byte_content
  alias_method :write, :byte_content=

  def copy(target_file_name)
    target_file = self.class.new(target_file_name)
    target_file.write(read)

    target_file
  end

  def to_s
    "#{name}.#{self.class::FORMAT}"
  end
end

class MarkdownFile < File
  FORMAT = :md
end

class VectorGraphicsFile < File
  FORMAT = :svg
end

class MP3File < File
  FORMAT = :mp3
end

# Test

blog_post = MarkdownFile.new('Adventures_in_OOP_Land')
blog_post.write('Content will be added soon!'.bytes)

copy_of_blog_post = blog_post.copy('Same_Adventures_in_OOP_Land')

puts copy_of_blog_post.is_a? MarkdownFile     # true
puts copy_of_blog_post.read == blog_post.read # true

puts blog_post

# We are thrown a NameError due to line 24. We must remember that Constants in Ruby
# have a lexical scope, meaning their scope depends on WHERE they are defined/accessed.

# The call to FORRMAT causes the Ruby interpreter to search for FORMAT within File class.
# It does not find it there and it will continue to seach UP the ancestor chain for a definition
  # File < Object < Kernel < BasicObject -- but it will not find one.

#The trouble is -- due to the lexical scoping-- Ruby doesn't 'see' that Format is defined
#within the object that is actually calling the #to_s method.

#In order to solve the problem we must provide namespace resolution in order to be me explicit as to WHERE
# the Ruby interpreter should be searching for a constant named FORMAT

#Another thing to note is that the namespace resoltion operator (::) only works on
#modules and classes. Meaning we can NOT apply it to an instance of class and get a valid return
  # Correct invocation '#{name}.#{self.class::FORMAT}'
  # Incorrect invocation '#{name}.#{self::FORMAT}'

# The second attempt will result in a TypeError informing us that the calling
# object (self) can not utilize the namespace resolution operator since it is
# neither a module or a class.
  # #<MarkdownFile:0x00007f9f288683b8> is not a class/module (TypeError)

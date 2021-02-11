#Complete this program so that it produces the expected output:

class Book
  attr_reader :title
  def initialize(author, title)
    @author = author
    @title = title
  end

  def to_s
    %("#{title}", by #{author})
  end

  def author
    first_name, last_name = @author.split
    %(#{last_name}, #{first_name})
  end

  
end

book = Book.new("Neil Stephenson", "Snow Crash")
puts %(book = #{book}.)
puts %(The author of "#{book.title}" is #{book.author}.)


#Expected output
# The author of "Snow Crash" is Neil Stephenson.
# book = "Snow Crash", by Neil Stephenson.
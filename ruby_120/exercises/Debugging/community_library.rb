#On line 42 of our code, we intend to display information regarding the books 
#currently checked in to our community library. 
#Instead, an exception is raised. Determine what caused this error and 
#fix the code so that the data is displayed as expected.

class Library
  attr_accessor :address, :phone, :books

  def initialize(address, phone)
    @address = address
    @phone = phone
    @books = []
  end

  def check_in(book)
    books.push(book)
  end
end

class Book
  attr_accessor :title, :author, :isbn

  def initialize(title, author, isbn)
    @title = title
    @author = author
    @isbn = isbn
  end

  def display_data
    puts "---------------"
    puts "Title: #{title}"
    puts "Author: #{author}"
    puts "ISBN: #{isbn}"
    puts "---------------"
  end
end

community_library = Library.new('123 Main St.', '555-232-5652')
learn_to_program = Book.new('Learn to Program', 'Chris Pine', '978-1934356364')
little_women = Book.new('Little Women', 'Louisa May Alcott', '978-1420951080')
wrinkle_in_time = Book.new('A Wrinkle in Time', 'Madeleine L\'Engle', '978-0312367541')

community_library.check_in(learn_to_program)
community_library.check_in(little_women)
community_library.check_in(wrinkle_in_time)

community_library.books.each(&:display_data) ## OR
#community_library.display_books

#When we invoke community_library.books we are accessing
# the instance varaible @books which is an array containing Book objects.

#The way the line was initially written --  we were technially trying to invoke
# Array#display_data since our call (community_library.books) will return the
# container @books via our getter method --> this results in a NoMethodError

#In order for the program to run as expected-- we must invoke #display_data
#for each Book object stored in @books. Thus we must iterate through the container
# in order to access the instances of Book themselves

# community_library.books.each(&:display_data)


## ALTERNATE ##
#Or, in order to clean up the syntax a little bit. Rather than having to
# chain a series of calls togeather on line 47, we could
# create a method Library#display_books for our Library class that will help
# clean up the public interface and leave the responsibility to the class itself

#This is probably more in line with (OOP) practices as Library#display_books is
# a behavior that can logically be included in the Library class
# without a second guess from anyone else who may need to interact with the
# Lirary class in a shared codebase


# Class Library
  # rest of the class definition

  #def display_books
    #books.each(&:display_data)
  #end

  #Just remeber that this method will technicallu return the origional
  # @books container once finished iterating --> something to note for future implementaitons
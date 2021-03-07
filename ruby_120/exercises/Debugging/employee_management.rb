#We have written some code for a simple employee management system. 
#Each employee must have a unique serial number. However, when we are testing 
#our program, an exception is raised. Fix the code so that the program works 
#as expected without error.

class EmployeeManagementSystem
  attr_reader :employer

  def initialize(employer)
    @employer = employer
    @employees = []
  end

  def add(employee)
    if exists?(employee)
      puts "Employee serial number is already in the system."
    else
      employees.push(employee)
      puts "Employee added."
    end
  end

  alias_method :<<, :add

  def remove(employee)
    if !exists?(employee)
      puts "Employee serial number is not in the system."
    else
      employees.delete(employee)
      puts "Employee deleted."
    end
  end

  def exists?(employee)
    employees.any? { |e| e == employee }
  end

  def display_all_employees
    puts "#{employer} Employees: "

    employees.each do |employee|
      puts ""
      puts employee.to_s
    end
  end

  private

  attr_accessor :employees
end

class Employee
  attr_reader :name

  def initialize(name, serial_number)
    @name = name
    @serial_number = serial_number
  end

  def ==(other)
    serial_number == other.serial_number
  end

  def to_s
    "Name: #{name}\n" +
    "Serial No: #{abbreviated_serial_number}"
  end

  protected
  attr_reader :serial_number

  private
  def abbreviated_serial_number
    serial_number[-4..-1]
  end
end

# Example

miller_contracting = EmployeeManagementSystem.new('Miller Contracting')

becca = Employee.new('Becca', '232-4437-1932')
raul = Employee.new('Raul', '399-1007-4242')
natasha = Employee.new('Natasha', '399-1007-4242')

miller_contracting << becca     # => Employee added.
miller_contracting << raul      # => Employee added.
miller_contracting << raul      # => Employee serial number is already in the system.
miller_contracting << natasha   # => Employee serial number is already in the system.
miller_contracting.remove(raul) # => Employee deleted.
miller_contracting.add(natasha) # => Employee added.

miller_contracting.display_all_employees

#Becasue Employee#serial_number was intially listed as private --> no 'outside'/'explicit' calls
# to the method can be made. This line of thinking is correct -- data such as
# serial numbers, emails, credit card numbers ..etc should not be accessible via
# a public interface

#The issue is, because Employee#serial_number is listed as private
# the line (other.serial_number) on line 61 is interpreted by Ruby to be an
# 'outside' call to the method. Which, as we know is private, and results in the
# NoMethodError

#private methods can not be called with an explicit caller (as a general rule of thumb). Prior to Ruby (2.7.0)
# even self.arbitraty_private_method would have thrown an NoMethodError even though it was
#the actual instance of the class attempting to invoke its own instance method
  # Since Ruby (2.7.0) we can call self for private methods but it's good to know for legacy code

#The solution is to list Employee#serial_number as a protected method in order
#for calls WITHIN the class to be treated as public without sacrificing the 
#data security from TRUE outside calls
#We created a simple BankAccount class with overdraft protection, that does 
#not allow a withdrawal greater than the amount of the current balance. 
#We wrote some example code to test our program. However, we are surprised 
#by what we see when we test its behavior. 
#Why are we seeing this unexpected output? 
#Make changes to the code so that we see the appropriate behavior.

class BankAccount
  attr_reader :balance

  def initialize(account_number, client)
    @account_number = account_number
    @client = client
    @balance = 0
  end

  def deposit(amount)
    if amount > 0
      self.balance += amount
      "$#{amount} deposited. Total balance is $#{balance}."
    else
      "Invalid. Enter a positive amount."
    end
  end

  def withdraw(amount)
    if amount > 0
      success = (self.balance -= amount)
    else
      success = false
    end

    if success
      "$#{amount} withdrawn. Total balance is $#{balance}."
    else
      "Invalid. Enter positive amount less than or equal to current balance ($#{balance})."
    end
  end

  def balance=(new_balance)
    if valid_transaction?(new_balance)
      @balance = new_balance
      true
    else
      false
    end
  end

  def valid_transaction?(new_balance)
    new_balance >= 0
  end
end

# Example

account = BankAccount.new('5538898', 'Genevieve')

                          # Expected output:
p account.balance         # => 0
p account.deposit(50)     # => $50 deposited. Total balance is $50.
p account.balance         # => 50
p account.withdraw(80)    # => Invalid. Enter positive amount less than or equal to current balance ($50).
p account.balance         # => 50

#The issue here is that SETTER methods in Ruby, regardless of any explicit return statements in their
# definitions will ALWAYS return the values that were passed into them as arguments

#Meaning line 28 will always return a truthy value after the compound assignment call (self.balance -= amount)
  #Since we know in Ruby that anything other than FALSE or NIL is 'truthy', even a negative number
  #will evaluate as true -- meaning line 28 will never have the potential to evaluate as false

  # balance=(10) #=> 10 --> evaluates as true
  # balance=(-100) #=> -100 --> also evaluates as true
    #!!(-100) #=> true

#The SETTER method does attempt to take into account a condition where the amount withdrawn
# would be greater than the current balance of the account via BankAccount#valid_transaction?, but by design all SETTER methods in Ruby
# return the arguments they were passed. Menaning the explicit reuturns of TRUE or FALSE in the
# if..else statements on lines 41-46 in BankAccount#balance= ultamitly
# will never be implemented as they were designed to be used
  #They may be returned temporarily but are ultamitly eclipsed by the FINAL return value of the SETTER method 

    #balance=(new_balance)
      #method logic
      # a 'return' of TRUE or FALSE depending on BankAccount#valid_transaction?
    #end
    #=> new_balance --> the FINAL return of the SETTER method by Ruby convention

#This is a cautionary tale against using setter methods to evaluate conditional statements
# as MOST times our setter mehtods will return a value of a 'truthy' nature
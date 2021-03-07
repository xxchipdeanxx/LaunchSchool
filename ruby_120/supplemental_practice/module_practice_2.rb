module Access
  def enable
    true
  end
end

class NightClub
  def initialize
    @access = Access.enable
  end

  def enter
    if @access
      puts 'Welcome back'
    else
      puts 'Better luck next time'
    end
  end
end

club = NightClub.new
club.enter

#We need to spicify 'self' in our module definition in order for the
#method to be scoped properly such that Access.enable is understood to be
#a module method rather than an instance method that could be mixed into a
#class for implementation at the object level

#Since we have not included Access in our class. The only way we can
#get a true value returned for our instance variabe @access is to
#call Access.enable

#However, much like a class method, Ruby is searching for a propely scoped
#method 'enable'. It searches Access but does not find an enable method that
#pertains to the module itself
  #left unchanged 'enable' is interpreted as an instance method that can be mixed in
  #to another class and NOT a method that is specific to the module itself
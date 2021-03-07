#Consider the foling code
# Modify this class so both flip_switch and the setter method switch= are 
#private methods.


class Machine

  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end

  def status
    switch
  end

  private

  attr_writer :switch
  attr_reader :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

test = Machine.new

test.start


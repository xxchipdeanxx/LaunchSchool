class MyObject
  def to_proc
    puts 'Hello World!'
    Proc.new {}
  end
end

p Proc.ancestors

test = Proc.new.confirm_local
# [1,2,3].map
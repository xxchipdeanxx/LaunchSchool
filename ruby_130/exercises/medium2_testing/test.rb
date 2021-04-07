require 'stringio'

def get_timeshare(amount:, output: $stdout)
  output.puts "Welcome to our Get Rich Quick seminar!
                Please take a seat and be sure to grab a nametag.
                Now, we are going to be covering a lot of information so I hope eveyone brough a pen
                A pencil would work too, but I find the smooth glide of a ball point pen to be very relaxing
                The perfect headspace to make some money.
                Now, what is a time share...well Webster's dictionary decribes a time share as a 'scam'
                employed by 'greasy people'
                with not morals"

  puts "Anyways - that's my pitch. You now owe #{amount} for your portion"
end

output = StringIO.new
get_timeshare(amount: 3000, output: output)
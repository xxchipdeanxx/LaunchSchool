#In order to test the case when authentication fails, we can simply set 
#API_KEY to any string other than the correct key. 
#Now, when using a wrong API key, we want our mock search engine to raise an 
#thenticationError, and we want the find_out method to catch this error and print its error message 
#API key is not valid.

#Why do we always get the following output instead?
# Sushi rocks!
# Rain rocks!
# Bug hunting rocks!

class AuthenticationError < StandardError; end

# A mock search engine
# that returns a random number instead of an actual count.
class SearchEngine
  def self.count(query, api_key)
    unless valid?(api_key)
      raise AuthenticationError, 'API key is not valid.'
    end

    rand(200_000)
  end

  private

  def self.valid?(key)
    key == 'LS1A'
  end
end

module DoesItRock
  API_KEY = 'LS1A'

  class NoScore; end

  class Score
    def self.for_term(term)
      positive = SearchEngine.count(%{"#{term} rocks"}, API_KEY).to_f
      negative = SearchEngine.count(%{"#{term} is not fun"}, API_KEY).to_f

      positive / (positive + negative)
    rescue Exception #too broad and will catch ANY exceptions previously raised
      NoScore.new #this is where the masking begins --> we generate a NEW NoScore object and return it (go to line 52)
                  #if the issues is an ArgumentError --> why would we need to create a NoScore object?
    end
  end

  def self.find_out(term)
    score = Score.for_term(term)

    case score
    when NoScore #this is where the actual making takes place. The behavior does not reflect the actual problem
      "No idea about #{term}..."
    when 0...0.5
      "#{term} is not fun."
    when 0.5
      "#{term} seems to be ok..."
    else
      "#{term} rocks!"
    end
  rescue StandardError => e
    e.message
  end
end

# Example (your output may differ)

puts DoesItRock.find_out('Sushi')       # Sushi seems to be ok...
puts DoesItRock.find_out('Rain')        # Rain is not fun.
puts DoesItRock.find_out('Bug hunting') # Bug hunting rocks!

# Our issue here is that -- the exception handling in the DoesItRock module
#is too encompasing. It's too broad and is catching and masking our AuthenticationError
#that is thrown when we intentionally cause the api_keys to NOT match

#Since all exceptions derive from the most super Exception class -- our AuthenticationError
# triggers Score to create a NoScore object which is THEN interpreted in the #find_out method
# as an unknown search entry

#Basically -- our exception handling in Score class is catching and masking
#the REAL issue (the fact that the api-keys do not match)

#ideally we want any exceptions raised on lines 39 or 40 to be able to cascade down all the way to our final
#exception handling on line 62
#this final exception can be a bit more broad (StandardError) as it is the final exception

#BUT NOTE -- we never want to handle Exception class object directly as these are the most
#fundamental errors and we want our terminal to display what is actually going on rather than potentially
#mask some of the more 'fatal' errors we can encounter in Ruby

#In order to fix this -- we must refine our exception handling within Score to be
#more selective and only return NoScore.new when we get zero division
  #raise ZeroDivisionError (line 43)


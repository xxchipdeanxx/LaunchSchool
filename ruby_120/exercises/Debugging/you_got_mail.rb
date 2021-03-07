#Can you decipher and fix the error that the following code produces?

class Mail
  def to_s
    "#{self.class}"
  end
end

class Email < Mail
  attr_accessor :subject, :body

  def initialize(subject, body)
    @subject = subject
    @body = body
  end
end

class Postcard < Mail
  attr_reader :text

  def initialize(text)
    @text = text
  end
end

module Mailing
  def receive(mail, sender)
    mailbox << mail unless reject?(sender)
  end

  # Change if there are sources you want to block.
  def reject?(sender)
    false
  end

  def send_mail(destination, mail)
    "Sending #{mail} from #{name} to: #{destination}"
    # Omitting the actual sending.
  end
end

class CommunicationsProvider
  attr_reader :name, :account_number

  def initialize(name, account_number=nil)
    @name = name
    @account_number = account_number
  end
end

class EmailService < CommunicationsProvider
  include Mailing
  attr_accessor :email_address, :mailbox

  def initialize(name, account_number, email_address)
    super(name, account_number)
    @email_address = email_address
    @mailbox = []
  end

  def empty_inbox
    self.mailbox = []
  end
end

class TelephoneService < CommunicationsProvider
  def initialize(name, account_number, phone_number)
    super(name, account_number)
    @phone_number = phone_number
  end
end

class PostalService < CommunicationsProvider
  include Mailing
  attr_accessor :street_address, :mailbox

  def initialize(name, street_address)
    super(name)
    @street_address = street_address
    @mailbox = []
  end

  def change_address(new_address)
    self.street_address = new_address
  end
end

rafaels_email_account = EmailService.new('Rafael', 111, 'Rafael@example.com')
johns_phone_service   = TelephoneService.new('John', 122, '555-232-1121')
johns_postal_service  = PostalService.new('John', '47 Sunshine Ave.')
ellens_postal_service = PostalService.new('Ellen', '860 Blackbird Ln.')

puts johns_postal_service.send_mail(ellens_postal_service.street_address, Postcard.new('Greetings from Silicon Valley!'))
# => undefined method `860 Blackbird Ln.' for #<PostalService:0x00005571b4aaebe8> (NoMethodError)

#The issue here is that #send is being called on an instance of PostalService
  #Ruby searches PostalService for an instance method #send but is does not find one
  #When this happens, Ruby searches up the ancestor chain in order to find a #send method
    # PostalService < Object < Kernel < BasicObject
  #Ruby DOES find a #send method in the Object class, but it's implementation is clearly not what was desired
    #Object#send is another way to invoke a method by supplying #send with an argument in either String or Symbol form
    #Thus Ruby, because we have not overriden #send to take on another meaning
    #Ruby thinks we are trying to invoke a method called :860 Blackbird Ln within
    # PostalService class -- which clearly does not exist and thus why we get a NoMethodError

  #The best solution is to provide a differnt name within our Mailing module in order
  # to not accidentally override Object#send
    #This is considered a better practice as we generally do not want to override Object class methods as it
    #is one of the most super and essential classes to ALL Ruby objects

  #In addition - we must also be sure to include the Maling module within our PostalService
  #class definition in order to implement our adjustments. Otherwise we would end up with a
  #NoMethodError regardless
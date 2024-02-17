# DIP = Dependency Inversion Principle

# EXPLANATION: "A high-level module should not depend on a low-level module; both should depend on abstraction." (https://www.honeybadger.io/blog/ruby-solid-design-principles/)
# In this principle we decouple software modules and classes
# We use inject dependency to do the inversion dependency, decoupling all directly instancy creation to a dependency of the class
# The easiest way to understand is by creating some examples :smile:

module EmailService
  def send_confirmation_email(order)
    raise NotImplementedError
  end
end

class SmtpEmailSender
  include EmailService

  def send_confirmation_email(order)
    # Email sending logic using SMTP
  end
end

class MockEmailSender
  include EmailService

  def send_confirmation_email(order)
    # Simulate email sending for testing
  end
end

class OrderProcessor
  attr_reader :email_service


  # Note that my class does not instantiate any email service itself, it just receive and call a method expected
  # So I can have a lot of different types os email sender, and the OrderProcessor don't need to make this directly, it just process acording with the instancy received
  def initialize(email_service)
    @email_service = email_service
  end

  def send_confirmation_email(order)
    @email_service.send_confirmation_email(order)
  end
end

# Here how I use the code in real world app
order_processor = OrderProcessor.new(SmtpEmailSender.new)
order_processor.send_confirmation_email(order)

# Here how I use the code in my tests
order_processor = OrderProcessor.new(MockEmailSender.new)
order_processor.send_confirmation_email(order) 

# And I can create others senders and use without change OrderProcessor
order_processor = OrderProcessor.new(GmailEmailSender.new) # just create a GmailEmailSender service using the EmailService module
order_processor.send_confirmation_email(order)



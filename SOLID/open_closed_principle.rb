# OCP = Open Close Principle

# EXPLANATION: The class should be open to extension but closed to modification, but what does it mean?
# Let's code some example to understand it better, look to the "Notification" class 👇

class Notification
  def initialize(attributes, type)
    @attributes = attributes
    @type = type
  end

  # ❌ this method has a lot of logic here, one for each type of notification, 
  # imagine that you can have another type of notification in the future
  # This method will turn into a mess, it's bad...
  def send
    if @type == :email
      # some logic here
    elsif @type == :mobile
      # some logic here
    end  
  end

  # What? we have a method only for mobile notification type in this class? Very ugly...
  def mobile_already_sent?
    return unless @type == :mobile
      # some logic here
  end
end

# A way to solve this, is to turn the "Notification" class into an interface
# and create specific classes for each notification, let's do this:

# Create the interface
class Notification
  def initialize(attributes)
    @attributes = attributes
  end

  # 💡Enforce the subclasses to implement the "send" method, because it is mandatory for every notification type
  def send
    raise NotImplementedError, "Must implement the 'send' method"
  end
end

# Now we can crate an Email Notification class, follow the notification pattern 🤓
class EmailNotification < Notification
  def initialize(attributes)
    @attributes = attributes
  end

  # if we don't set this method, we'll get and error in the constructor
  def send
    # some logic here
    specific_email_method
  end
  
  private
  def specific_email_method
    # Now we can put new methods for the email notification, "extending" the behavior of "Notification"
  end
end

# As we did with the Email, we have to do with Mobile
class MobileNotification < Notification
  def initialize(attributes)
    @attributes = attributes
  end

  def send
    # some logic here
    check_some_rules
  end

  # Here we can put this another public method for Mobile notifications
  # and web don't need to "mix" the code like our first verion of "Notification" class 😅
  def already_sent?
    # some logic here
  end
  
  private
  def check_some_rules
    # some logic here
  end
end

# Woow, now we have improve our code a lot following the Open/closed principle
# We have an interface that sets the patterns of notifications, which we do not modify
# but we can extend the code, generating child classes with your particular behaviors.
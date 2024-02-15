# OCP = Open Close Principle

# EXPLANATION: The class should be open to extension but closed to modification, but what does it mean?
# Let's code some example to understand it better, look to the "Notification" class 👇

class Notification
  def send(&block)
    puts 'Sending a notification to webapp...'

    if block_given? # here I'm not changing the behavior of the Notification, I'm just give the possibility to extending
      block.call
    end
  end
end

class NotificationHandler
  def send
    notification = Notification.new # here I'm extending the use of the notifications without modify the use
    notification.send do
      puts 'Sending a notification to mobile...'
      puts 'Sending a email notification...'
    end
  end
end

# Another Example
class Notification
  def initialize(type = :webapp)
    @type = type
  end

  # ❌ this method has a lot of logic here, one for each type of notification, 
  # imagine that you can have another type of notification in the future
  # This method will turn into a mess, it's bad...
  def send
    if @type == :webapp
      # some web app logic here
    elsif @type == :email
      # some email logic here
    elsif @type == :mobile
      # some mobile logic here
    end  
  end
end

# let's turn the Notification class in a base class that contains the default behavior (webapp)
class Notification
  def send
    # some web app notification logic here
  end
end

# Now we can crate an Email Notification class, follow the Notification pattern 🤓
class EmailNotification < Notification
  # And here we can extend the behavior to our email notification
  def send
    # some new logic here
    specific_email_method
  end
  
  private
  def specific_email_method
    # Now we can put new methods for the email notification, "extending" the behavior of "Notification"
  end
end

# As we did with the Email, we have to do with Mobile
class MobileNotification < Notification
  def send
    # some new logic here
    check_some_rules
  end

  # Here we can put this another public method for Mobile notifications, extending the behavior
  def already_sent?
    # some logic here
  end
  
  private
  def check_some_rules
    # some logic here
  end
end
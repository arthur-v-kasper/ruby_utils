# Factory Pattern

## Explanation

The factory method pattern is a creational pattern that uses factory methods to deal with the problem of creating objects, providing an interface for creating objects in a base class, and then preparing specific implementations in subclasses.

## Example 01

Image that we have an app that sends a lot of notifications for different types.

```ruby
class WelcomeNotification
  def initialization(type)
    @type = type
  end

  def send
    msg = 'Welcome to our app!'

    if @type == :email
      EmailProvider.new(msg).send!
    elsif @type == :sms
      SMSProvider.new(msg).call
    elsif @type == :push
      PushAppProvider.new(msg).push
    else
      EmailProvider.new(msg).email
    end
  end
end
```

It's an ugly code, that will be getting fat if the application grows with time...
So here we can convert the logic into a factory to isolate the codes

This class provides the common behavior that allows to creation other types of notifications following the same pattern

```ruby
class NotificationProvider
  def generate
    raise NotImplementedError, "Subclasses must implement generate"
  end
end

# the subclasses

class EmailProvider < NotificationProvider
 def initialize(msg)
   @msg = msg
 end
 def generate
  EmailService.new(@msg).send!
 end
end

class SMSProvider < NotificationProvider
 def initialize(msg)
   @msg = msg
 end
 def generate
  SMSApi.new(@msg).call
 end
end

class PushAppProvider < NotificationProvider
 def initialize(msg)
   @msg = msg
 end
 def generate
  PushService.new(@msg).notification
 end
end

```

Now, we can create the factory

```ruby
class NotificationFactory

  NOTIFICATION_PROVIDER = {
    email: EmailProvider,
    sms: SMSProvider,
    push: PushAppProvider,
  }

  def self.create(type, msg)
    (NOTIFICATION_PROVIDER[type] || EmailProvider).new(msg).generator
  end
end
```

And use the factory in our welcome notification

```ruby
class WelcomeNotification
  def initialization(type)
    @type = type
  end

  def send
    msg = 'Welcome to our app!'

    NotificationFactory.create(type, msg)
  end
end
```

So... if we need to send notifications in another part of our app, we just use the factory.
If for some reason we need to change some logic, add ou remove a kind of notification we just change it in one place

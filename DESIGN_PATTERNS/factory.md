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

## Why Factory Pattern is more apropriate that instance classes somethimes...

- Statelessness:
  - Factory methods are generally stateless. They don't rely on the state of a particular instance to create new objects. Instead they focus on creating new instances based on the input parameters.
- SRP (sigle responsability principle)
  - Using class methods for object creation keeps these operations separate from the behavior of the instantiated objects themselves adhering to SRP.
- Ease of access and use
  - Class methods can be called directly on the class without needing to instantiate an object first. This is particularly used for factory methods because the whole point is to create new instances. If factory methods were instance methods, you'd need an existing instance to create more instances which could be paradoxical or just unnecessarily complicated.
- Flexibility and Extensibility.
  - Implementing the factory pattern as class methods allows for more flexibility in extending the factory functionality. For example, a subclass can easily override a class method to provide specialized behavior without affecting the instantiation of other classes. This is harder to achieve with instance methods without also modifying object instantiation logic.
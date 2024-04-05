# Chain of Responsability

## Explanation

The short definition of CoR is a behavior pattern, that allows you to pass requests along a chain of handlers, so each handler decides either to process or pass to the next handler, following the chain, giving more than one object a chance to handle the request.

_In a real-world analogy_, imagine that you have software that needs to contact a user to inform something (hypothetical situation), and depending on the urgency or other params, this notification uses diferent ways to notify the user, in a normal way the code seems like this:

```ruby
# others_params can be a sequenci of others condition with the notification
case notification
  when notification.urgency == 3 && others_params
    EmailNotification.call
  when notification.urgency == 2 && others_params
    SlackNotification.call
  when notification.urgency == 1 && others_params
    CallNotification.call
  else
    EmailNotification.call
end
```

This code could be hard to refactor if the rules change and can be very cumbersome.

Here we can use a CoR to create a chain, so the objects can decide who will handle the request, and we also can define the order, easily add new handlers, and define rules for each handler.

Let's convert the code to a CoR
First of all, we will create an interface for our handler, and this interface will have the method that checks if it can handle the request or needs to pass to the next handler

```ruby
class BaseHandlerChain
  def initialize(successor = nil)
    @successor = successor
  end

  def call(notification)
    return @successor.call(notification) unless can_handle?(notification)

    handle(notification)
  end

  def hundle(notification)
    raise NotImplementedError, 'Should have a hundle method'
  end
end
```

With this we guarantee that our chain can be in practice, the call method calls the successor if can not handle it, otherwise, the current handle runs the request.

Now we will create our handlers following the interface:

```ruby
class EmailHandler < BaseHandlerChain
  private

  def handle(notification)
    puts "Call EmailNotification #{notification.to_s}"
  end

  def can_handle?(notification)
   notification.urgency == 3
  end

end


class SlackHandler < BaseHandlerChain
  private

  def handle(notification)
    puts "Call SlackNotification #{notification.to_s}"
  end

  def can_handle?(notification)
   notification.urgency == 2 && notification.business_hours? && notification.other_condition?
  end
end

class CallHandler < BaseHandlerChain
  private

  def handle(notification)
    puts "Call CallNotification #{notification.to_s}"
  end

  def can_handle?(notification)
   notification.urgency <= 2
  end
end
```

Now we can call the handlers recursively the method `can_handle?` guarantees that the right handler will respond to the request.

```ruby
Notification = Struct.new(:urgency, :other_condition?, :business_hours?)
email_notification = Notification.new(3, true, false)
slack_notification = Notification.new(2, true, true)
call_2_notification = Notification.new(2, true, false)
call_notification = Notification.new(1, true, false)

# here we can easily add and remove new handlers
notification_chain = EmailHandler.new(SlackHandler.new(CallHandler.new))

# you can see the chain calls working
notification_chain.call(email_notification)
notification_chain.call(slack_notification)
notification_chain.call(call_2_notification)
notification_chain.call(call_notification)

```

### references:

http://rubyblog.pro/2017/11/chain-of-responsibility-ruby

https://refactoring.guru/design-patterns/chain-of-responsibility

## Strategy Pattern

## Explanation

This pattern helps change the algorithm inside a method/class, usually using inject dependency.
It's good to use this pattern to keep your code extensible if you want your class to do specific or new things
you don't need to change the class itself, but only the strategy that you pass to the class

An example of using strategy pattern 

Notification module has the strategies

```ruby
module Notification
  class EMAIL
    def self.send(data)
      p "📧 Sending email notification with '#{data}' content"
    end
  end

  class WHATSAPP
    def self.send(data)
      p "💬 Sending whatsapp notification with '#{data}' content"
    end
  end

  class PUSH
    def self.send(data)
      p "📳 Sending App notification with '#{data}' content"
    end
  end
end
```

```ruby
class NotificationGenerator
  def self.generate(data, strategy)
    strategy.send(data)
  end
end

data = 'Message to show in the notification...'

NotificationGenerator.generate(data, Notification::EMAIL)
NotificationGenerator.generate(data, Notification::WHATSAPP)
NotificationGenerator.generate(data, Notification::PUSH)
```
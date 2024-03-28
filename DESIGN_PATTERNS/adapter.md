# Adapter Pattern

## Explanation

The adapter is a structural pattern that literally adapt incompatible object/class, to communicate with each other.
Simple as that

## Example 01

```ruby
# Here's a legacy API, that use XML
class OldApi
  def get_result
    puts 'received XML data from an old API.....'
  end
end

# Here's a new API, that already use JSON
class NewAPI
  def get
    puts 'received JSON data from a New API.....'
  end
end

# Sometimes I will need to get some data from the old API, but my current system do not
# understand XML data format, so I need to adapt the result when I need it.
class OldApiAdapter < NewAPI
  def initialize(old_api)
    @old_api = old_api
  end

  def get
    convert_xml_to_json(@old_api.get_result)
  end

  private

  def convert_xml_to_json(result)
   # logic to convert
  end
end

old_api = OldApi.new
old_api_adapter = OldApiAdapter.new(old_api)

new_aPI = NewAPI.new

puts "Using OldApiAdapter with NewAPI interface via adapter:"
puts "Result: #{old_api_adapter.get}"


puts "Using NewAPI directly:"
puts "Result: #{new_aPI.get}"
```

## Example 02

> It's a copy of Refactoring.guru, because I found this example super exploratory 😊

```ruby
# The Target defines the domain-specific interface used by the client code.
class Target
  # @return [String]
  def request
    'Target: The default target\'s behavior.'
  end
end

# The Adaptee contains some useful behavior, but its interface is incompatible
# with the existing client code. The Adaptee needs some adaptation before the
# client code can use it.
class Adaptee
  # @return [String]
  def specific_request
    '.eetpadA eht fo roivaheb laicepS'
  end
end

# The Adapter makes the Adaptee's interface compatible with the Target's
# interface.
class Adapter < Target
  # @param [Adaptee] adaptee
  def initialize(adaptee)
    @adaptee = adaptee
  end

  def request
    "Adapter: (TRANSLATED) #{@adaptee.specific_request.reverse!}"
  end
end

# The client code supports all classes that follow the Target interface.
def client_code(target)
  print target.request
end

puts 'Client: I can work just fine with the Target objects:'
target = Target.new
client_code(target)
puts "\n\n"

adaptee = Adaptee.new
puts 'Client: The Adaptee class has a weird interface. See, I don\'t understand it:'
puts "Adaptee: #{adaptee.specific_request}"
puts "\n"

puts 'Client: But I can work with it via the Adapter:'
adapter = Adapter.new(adaptee)
client_code(adapter)
```

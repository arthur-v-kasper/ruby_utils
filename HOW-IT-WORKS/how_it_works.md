include vs extend

With include, the methods will be available in the class when you instantiate the class, you can use it as a class method, as in the example below

```ruby

module FooInclude
  def greet = 'Hey include!'
end

class BarInclude
  include FooInclude
end

BarInclude.new.greet # => "Hey include!"
BarInclude.greet # Error

#########################################
```

With the \***\*extend\*\*** being more flexible, ruby creates a singleton instance for the method and you can use it in a class or in an instance

```ruby
module FooExtend
  def greet = 'Hey Extend!'
end

class BarExtend
  extend FooExtend
end

BarExtend.greet

# To uso in an instance you can do this

bar_extend = BarExtend.new
bar_extend.extend(FooExtend)
bar_extend.greet
```

But you can work with both cases, if you want to include and extend at the same time to the user as a static method and as an instance method

```ruby

module Foo
  def greet = 'Hey you!'
end

class Bar
  include Foo
  extend Foo
end

Bar.new.greet # => "Hey you!"
Bar.greet # => "Hey you!"

```

## 3 Concepts of Functional Programming

1 - Functions are definitions, not a list of instructions, they get an input value to give an output value, instead of a list of instructions

2 - Immutable definitions, not variables: We do not assign values, we define things, which means we don't have variables that can't change when the program runs (because if it happens the value of things will change)

3 - Functions are first-class citizens: It means we can use in everywhere normally we use an another variable, including passing to another function

## Implementing map functions, using Proc

The idea is to recreate the original map function of ruby, using the same contexts

The map receives an array and returns a new array giving an anonymous function passed throught the map

```ruby
# Create an anonymous function that applies 15% of taxes
apply_taxes = proc {|item| item += item * 0.15 }

def map(list, fn)
  result = []
  list.each {|item| result << fn.call(item) }
  result
end
```

## Block

Blocks in ruby are optional so you need if there is a block in your code so you can user `block_given?`

```ruby
def with_block?
  puts "I'm a block" if block_given?
end

with_block?
with_block? { 1 + 2 } # I'm a block
```

To use the block you can use yield, which stops the code runs the block pass-in in and returns the code method at the point of our method stop e keeps going with the execution, let's see an example

```ruby
def method_with_yield
  puts "Starting the execution..."
  yield 3 if block_given?
  puts "Finishing the execution..."
end

method_with_yield
method_with_yield { |param| puts "you pass #{param}"}
```

Recreate the `each` method with block

```ruby
def each_(list)
  for i in 0..(list.length - 1)
    yield list[i]
  end
end

each_([1,2,3,4]) {|item| puts item + 5 }
```

Another example, a method that splits words from a phrase, so you can give a block to do something else with each work, for example, count them

```ruby
def map_words(phrase)
  phrase.split.map do |word|
    yield(word)
  end
end

phrase = 'Welcome to the Community'

# say the length of each word
map_words(phrase) {|item| item.length }

# reverse each word
map_words(phrase) {|item| item.reverse }
```

`check difference between yield, &block and block.call`

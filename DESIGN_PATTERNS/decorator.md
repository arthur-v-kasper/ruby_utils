# Decorator Pattern

## Explanation

The Decorator is a structural pattern that allows you to create new object instances without change the original behavior of the class, but adding new funcionallities/behavior, follow the "composition over inheritance" principle.
Let's check some code example to understant it better.
I use the [mixandgo video](https://youtu.be/K5bmy3XXyNA) as inspiration.

### Module example

```ruby

# Here we have a default Pizza,
# In this example all pizza has at the min those ingredientes and it's price
class Pizza
  def ingredients = ['dough', 'tomato sauce', 'olive oil']

  def price = 10
end

module Margherita
  def ingredients = super.push('mozzarella', 'basil')

  def price = super + 2
end

module Bacon
  def ingredients = super.push('bacon', 'grated parmesan', 'onion')

  def price = super + 4
end


bacon_pizza = Pizza.new
bacon_pizza.extend(Bacon) # Can extend only once

puts "Bacon Pizza"
puts "ingredients: #{bacon_pizza.ingredients}"
puts "Price: $ #{bacon_pizza.price}"


margherita_pizza = Pizza.new
margherita_pizza.extend(Margherita) # Can extend only once

puts "Margherita Pizza"
puts "ingredients: #{margherita_pizza.ingredients}"
puts "Price: $ #{margherita_pizza.price}"
```

### MethodMissing examples
*wip*

```ruby
module DocoratorPizza
  def initialization(pizza)
    @pizza = pizza
  end

  def method_missing(meth, args*)

  end
end
```

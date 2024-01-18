# SRP = Single Responsability Principle
# The name is very straightforward.

# EXPLANATION: A class has to be only ONE responsibility, for example: 
# if you have a class called "AddItemToOrder" the only thing that this class can do is this and nothing else, let's check some code

class AddItemToOrder
  def def initialize(order, item)
    @order = order
    @item = item
  end
  
  def call
    @order.items << @item

    # ops... here we are breaking the SRP, because the name of the class refers only to add an item... it doesn't say anything about calculating the total, right?
    calculate_total_price
  end

  private

  def calculate_total_price
    @order.total_price += @item.price
  end
end

# So probably the correct way to do this is to move this piece of code to another class, for example:
class CalculateTotalPrice
  def def initialize(order, item)
    @order = order
    @item = item
  end
 
  def call
    @order.total_price += @item.price
  end
end

# And call both methods separately on the local that the classes were called
class OrdeItemController
  def create
    AddItemToOrder.new(order, item).call
    CalculateTotalPrice.new(order, item).call
  end
end

# Now we have more clarity on what each code does, in addition to making it easier to write tests.
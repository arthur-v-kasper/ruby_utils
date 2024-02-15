# LSP = Liskov substitution Principle

# EXPLANATION: This principle defines that the object of a superclass can be replaced with the object of a subclass WITHOUT 
# breaking the application. So the object of the subclass has to behave in the same way as your superclass, it works like a contract

# There are some rules which you have to follow to use the LSP 👇
# - The subclass has to use the same number and types of arguments of the superclass in your methods
# - The methods of subclass have to return the same type of the superclass
# - The subclass has to use the same name methods of the superclass
# - The subclass can change the behavior of the methods as long as it follows the previous rules

# Now, let's see some code examples 🧑‍💻

class DataBase
  def connect
    raise NotImplementedError, "Have to implement connect method"
  end

  def disconnect
    raise NotImplementedError, "Have to implement disconnect method"
  end
end

class MySql < DataBase
  def connect
    # some logic
  end

  def disconnect
    # some logic
  end
end

class Postgres < DataBase
  def connect
    # some logic
  end

  def disconnect
    # some logic
  end
end
# ISP = Interface Segregation Principle

# OBS⚡: This principle is for static languages, Ruby is a dynamic language and do not have interfaces, 
# so we can not use this principle "for real", but we can "translate" the concept for the language, so let's check the explanation

# EXPLANATION: A class/client should not be forced to depend upon an interface that they don't use, in other words,
# is better have a lot of specific interfaces over a generic one

# In this example we will create an "Interface like" in ruby, to understand the ISP

# Our ruby "interface"
class PaymentProcessor
  def credit_card_processor
    raise NotImplementedError, "credit_card_processor not implemented"
  end
  
  def paypal_processor
    raise NotImplementedError, "paypal_processor not implemented"
  end

  def money_processor
    raise NotImplementedError, "money_processor not implemented"
  end

  def bank_processor
    raise NotImplementedError, "bank_processor not implemented"
  end
end

class CashPayment < PaymentProcessor
  def money_processor
    # logic of money transfer
  end

  def bank_processor
    # logic of money transfer
  end

  # Ops... in this case we will need to implement the credit card and paypall methods, 
  # it don't make sense for CashPayment class, right? So here we are violating the ISP ❌
  def credit_card_processor
    # return false
  end
  
  def paypal_processor
    # return false
  end
end

# We can split the interface into small ones, like this
class CashProcessor
  def process_money
    raise NotImplementedError, "process_money not implemented"
  end

  def process_bank_transfer
    raise NotImplementedError, "process_money not implemented"
  end
end

class CreditCardProcessor
  def process_credit_card
    raise NotImplementedError, "process_credit_card not implemented"
  end
end

class OnlinePaymentProcessor
  def process_online_payment
    raise NotImplementedError, "process_online_payment not implemented"
  end
end

# And now... use these interfaces in the appropriate classes
class CashPayment < PaymentProcessor
  def process_money
    # logic when pay with cash
  end

  def process_money
    # logic when pay with directly bank transfer
  end
end

class PaypalPayment < OnlinePaymentProcessor
  def process_online_payment
    # logic when pay with paypal
  end
end

class MercadoPagoPayment < OnlinePaymentProcessor
  def process_online_payment
    # logic when pay with mercado pago.
  end
end

class VisaCardPayment < CreditCardProcessor
  def process_credit_card
    # logic when pay with visa credit card
  end
end

# there are other ways to interpret this principle in ruby, the article below shows a different way
# http://rubyblog.pro/2017/07/solid-interface-segregation-principle (but in my opinion it talks about the SRP 🤔)
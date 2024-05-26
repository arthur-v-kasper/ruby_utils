require 'date'
# Como ruby é uma linguagem dinamica, a classe nunca é finalizada de fato
# basta eu "reabrir" ela, que ela pode continuar a ser implementada, como no exemplo abaixo
class User
  def can_vote?
    @age >= 16
  end  
end

class User
  def initialize(birthday_date)
    days_since_birth = Date.today - Date.parse(birthday_date)
    @age = days_since_birth / 365
  end
end

bob = User.new('2020-01-01')
zack = User.new('2000-01-01')

puts bob.can_vote?
puts zack.can_vote?

class User
  def self.new_voter
    days_since_birth = Date.today - (16 * 365)
    new(days_since_birth.to_s)
  end
end

voter = User.new_voter
puts voter.can_vote?


require './data'

class Dinossaur
  def initialize(data)
    # with this, the attrs will be generated dynamically according to the object received
    data.each do |key, value|
      self.class.add_attributes(key, value)
    end
  end

  # define_method is private, so we need to encapsulate it in a class method
  def self.add_attributes(name, value)
    define_method(name) { value }
  end

  def self.match_attributes
    @match_attributes || []
  end

  def self.match_on(attr_name, &block)
    method_name = "match_#{attr_name}"
    matcher = block || -> attr, value { attr == value ? 1 : 0 }

    define_method(method_name) do |value|
      puts "value #{value}"
      puts "attr_name #{attr_name}"


      # with the 'send' we can run a method whose name corresponds to this name varialble 
      attr = self.send(attr_name)
      matcher.call(attr, value)
    end

    @match_attributes = self.match_attributes << attr_name
  end

  def self.match_on_any(attr_name)
      puts "attr_name #{attr_name}"

    self.match_on(attr_name) do |ours, theirs|
      puts "ours #{ours}"
      puts "theirs #{theirs}"

      (ours & theirs).size
    end
  end

  def self.match_on_at_least(attr_name, threshold)
    self.match_on(attr_name) do |_, value|
      value >= threshold ? 1 : 0
    end
  end

  def self.reject_if(pairs)
    puts "pairs #{pairs}"

    pairs.each do |attr_name, reject|
      puts "attr_name #{attr_name}"
      puts "reject #{reject}"


      self.match_on(attr_name) do |_, value|
        reject == value ? -1 : 0
      end  
    end
  end

  def match(other)
    attributes = self.class.match_attributes

    attributes.reduce(0) do |score, attr|
      match_method = "match_#{attr}"

      if other.respond_to?(attr)
        value = other.send(attr)
        score += send(match_method, value)
      else
        score  
      end
    end
  end
end

# class Diplodocus < Dinossaur
#   # it will generate methods that make the match based in the attribute required
#   match_on :diet
#   match_on :suborder
# end

# diplo = Diplodocus.new(DIPLODOCUS_DATA)
# p diplo.match_diet('herbivore')
# p diplo.match_suborder('Theropoda')
# p '...'

class Trex < Dinossaur
  # match_on :suborder
  # match_on_any :hobbies
  match_on_at_least :length, 4000
end


trex = Trex.new(TREX_DATA)
# puts trex.match_hobbies(['Bowling'])
puts trex.match_length(3000)
# p '...'

# class Stegosaurs < Dinossaur
#   avoided_attrs = { diet: "carnivore", period: "Jurassic" }
#   reject_if avoided_attrs
# end
  
# steg = Stegosaurs.new(STEGOSAURUS_DATA)
# p '.......'
# p steg.match(trex)
# p steg.match(diplo)

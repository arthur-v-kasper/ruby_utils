require './data'

class Dinossaur
  # define_method is private, so we need to encapsulate it in a class method
  def self.add_attributes(name, value)
    define_method(name) { value }
  end

  def self.match_on(attr_name, &block)
    method_name = "match_#{attr_name}"
    matcher = block || -> attr, value { attr == value }

    define_method(method_name) do |value|
      # with the 'send' we can run a method whose name corresponds to this name varialble 
      attr = self.send(attr_name)
      matcher.call(attr, value)
    end
  end

  def self.match_on_any(attr_name)
    self.match_on(attr_name) do |ours, theirs|
      (ours & theirs).any?
    end
  end

  def self.match_on_at_least(attr_name, threshold)
    self.match_on(attr_name) do |_, value|
      value >= threshold
    end
  end

  def initialize(data)
    # with this, the attrs will be generated dynamically according to the object received
    data.each do |key, value|
      self.class.add_attributes(key, value)
    end
  end
end

class Diplodocus < Dinossaur
  # it will generate methods that make the match based in the attribute required
  match_on :diet
  match_on :suborder
end

d = Diplodocus.new(DIPLODOCUS_DATA)
p d.match_diet('herbivore')
p d.match_suborder('Theropoda')
p '...'

class Trex < Dinossaur
  match_on :suborder
  match_on_any :hobbies
  match_on_at_least :length, 4000
end


trex = Trex.new(TREX_DATA)
puts trex.match_hobbies(['Bowling'])
puts trex.match_length(3000)

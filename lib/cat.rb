class Cat
  attr_reader :name
  attr_accessor :owner, :mood

  @@all = []

  def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    @@all << self
  end  # ends initialize method

  def self.all
    @@all
  end #  ends self.all method

end  # ends Cat class

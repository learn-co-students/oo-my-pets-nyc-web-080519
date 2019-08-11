class Owner
 
  attr_reader :name, :species

  @@all = []
 
  def initialize(name)
    @name = name
    @species = "human"
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    @@all = []
  end

  def say_species
    "I am a #{@species}."
  end

  def cats
    Cat.all.select do |cat|
      cat.owner == self
    end
  end

  def dogs
    Dog.all.select do |dog|
      dog.owner == self
    end
  end

  def buy_cat(cat)
    Cat.new(cat, self)
  end

  def buy_dog(dog)
    Dog.new(dog, self)
  end

  def walk_dogs
    self.dogs.each {|dog| dog.mood = "happy"}
  end

  def feed_cats
    self.cats.each {|cat| cat.mood = "happy"}
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end

  def sell_pets
    self.dogs.each {|dog| dog.mood = "nervous"} 
    self.dogs.each {|dog| dog.owner = nil}
    self.cats.each {|cat| cat.mood = "nervous"} 
    self.cats.each {|cat| cat.owner = nil}

  end









end
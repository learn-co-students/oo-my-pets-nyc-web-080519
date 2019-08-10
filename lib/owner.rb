require 'pry'

class Owner
  
  attr_reader :name, :species
  # attr_accessor :all
  
  @@all = []
  
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end # ends initialize method
  
  def self.all
    @@all
  end  # ends self.all method
  
  def self.count
    @@all.count
  end #ends self.count method
  
  def self.reset_all
    @@all = []
  end  #ends self.reset_all method

  def say_species
    "I am a #{@species}."
  end # ends say_species method

  def cats
    Cat.all.select { |cat| cat.owner == self }
  end # ends cats method

  def dogs
    Dog.all.select { |dog| dog.owner == self }
  end # ends dogs method

  def buy_cat(kitty)
    Cat.new(kitty, self)
  end  #ends buy_cat method

  def buy_dog(pup)
    Dog.new(pup, self)
  end  #ends buy_dog method

  def walk_dogs
    self.dogs.each { |dog| dog.mood = "happy" }
  end  # ends walk_dogs method

  def feed_cats
    self.cats.each { |cat| cat.mood = "happy" }
  end  # ends feed_cats method

  def sell_pets
    self.dogs.each { |dog| dog.mood = "nervous"; dog.owner = nil }
    self.cats.each { |cat| cat.mood = "nervous"; cat.owner = nil }
  end  # ends sell_pets method

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end  # ends list_pets method
end
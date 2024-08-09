# 1. Inheritance:
# Inheritance is a mechanism by which one class can inherit the properties and methods of another class.
# The class that is inherited from is called the "superclass" or "parent class," and the class that inherits is called the "subclass" or "child class."

# Defining a superclass (parent class)
class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def speak
    "..."
  end

  def info
    puts "I am an animal named #{@name}."
  end
end

# Defining a subclass (child class) that inherits from Animal
class Dog < Animal
  def initialize(name, breed)
    super(name)  # Calls the initialize method of the superclass
    @breed = breed
  end

  def speak
    "Woof!"
  end

  def info
    super  # Calls the info method of the superclass
    puts "I am a #{@breed} dog."
  end
end

# Creating an instance of the superclass
animal = Animal.new("Generic Animal")
animal.info
# Output:
# I am an animal named Generic Animal.

# Creating an instance of the subclass
dog = Dog.new("Buddy", "Golden Retriever")
dog.info
# Output:
# I am an animal named Buddy.
# I am a Golden Retriever dog.

# Calling the overridden method
puts dog.speak  # Output: Woof!

# 2. Method Overriding:
# Method overriding occurs when a subclass provides a specific implementation of a method that is already defined in its superclass.
# The overridden method in the subclass replaces the method in the superclass for instances of the subclass.

# Let's define another subclass that also inherits from Animal
class Cat < Animal
  def speak
    "Meow!"
  end

  def info
    puts "I am a cat named #{@name}."
  end
end

# Creating an instance of the Cat subclass
cat = Cat.new("Whiskers")
cat.info
# Output:
# I am a cat named Whiskers.

# Calling the overridden method
puts cat.speak  # Output: Meow!

# 3. Using `super`:
# The `super` keyword is used to call a method in the superclass that has been overridden in the subclass.
# It can be used to extend the functionality of the superclass method rather than completely replacing it.

# Another example with more complex inheritance and method overriding
class Vehicle
  def start
    puts "Starting the vehicle..."
  end

  def stop
    puts "Stopping the vehicle..."
  end
end

class Car < Vehicle
  def start
    super  # Calls the start method of the superclass
    puts "Starting the car..."
  end

  def stop
    puts "Applying the car brakes..."
    super  # Calls the stop method of the superclass
  end
end

# Creating an instance of the Car subclass
car = Car.new

# Calling the start method, which overrides the superclass method
car.start
# Output:
# Starting the vehicle...
# Starting the car...

# Calling the stop method, which also overrides the superclass method
car.stop
# Output:
# Applying the car brakes...
# Stopping the vehicle...

# 4. Inheritance Hierarchies:
# Inheritance can be extended to multiple levels, creating a hierarchy of classes.
# Each subclass inherits from its immediate superclass, and so on up the chain.

# Example of a multi-level inheritance hierarchy
class ElectricCar < Car
  def start
    super  # Calls the start method of the Car class
    puts "The electric motor is now running."
  end
end

# Creating an instance of the ElectricCar subclass
electric_car = ElectricCar.new

# Calling the start method, which cascades through the hierarchy
electric_car.start
# Output:
# Starting the vehicle...
# Starting the car...
# The electric motor is now running.

# 5. Overriding Accessor Methods:
# You can also override accessor methods (getter and setter methods) in a subclass.

class Robot
  attr_accessor :model

  def initialize(model)
    @model = model
  end

  def model
    "Model: #{@model}"
  end

  def model=(new_model)
    @model = new_model.upcase
  end
end

# Creating an instance of Robot
robot = Robot.new("R2D2")

# Calling the overridden getter method
puts robot.model  # Output: Model: R2D2

# Calling the overridden setter method
robot.model = "c3po"
puts robot.model  # Output: Model: C3PO

# 6. Preventing Inheritance and Method Overriding:
# You can prevent a class from being inherited by marking it as `final` (though Ruby does not have a `final` keyword).
# However, you can prevent method overriding by defining methods as `private` or `protected`.

class FinalClass
  def normal_method
    puts "This is a normal method."
  end

  private

  def private_method
    puts "This method cannot be overridden."
  end
end

# Creating an instance of FinalClass
final_class = FinalClass.new
final_class.normal_method

# 1. Modules:
# Modules in Ruby are a way to group related methods, constants, and other modules together.
# Unlike classes, modules cannot be instantiated or inherited. 
# Modules are used to share functionality between classes.

# Defining a simple module
module Greetings
  # A method in the module
  def say_hello
    puts "Hello!"
  end

  # Another method in the module
  def say_goodbye
    puts "Goodbye!"
  end
end

# Modules can also contain constants
module MathConstants
  PI = 3.14159
  E = 2.71828
end

# Accessing constants from a module
puts MathConstants::PI  # Output: 3.14159
puts MathConstants::E   # Output: 2.71828

# 2. Mixins:
# Mixins are a way to add functionality to a class using modules.
# When a module is included in a class, the methods from the module are added as instance methods to the class.

# Defining a class that includes a module
class Person
  # Include the Greetings module to use its methods
  include Greetings
  
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  # A method specific to the Person class
  def introduce
    puts "Hi, my name is #{@name}."
  end
end

# Creating an instance of the Person class
person = Person.new("Alice")

# Calling the method from the module
person.say_hello  # Output: Hello!

# Calling the method specific to the Person class
person.introduce  # Output: Hi, my name is Alice.

# Calling another method from the module
person.say_goodbye  # Output: Goodbye!

# 3. Extend:
# The `extend` method is used to add module methods as class methods instead of instance methods.
# This allows you to add functionality to the class itself, rather than its instances.

module Logger
  def log_info(message)
    puts "INFO: #{message}"
  end
end

# A class that extends a module
class Application
  extend Logger

  def self.run
    log_info("Application is running")  # Calls the class method from the Logger module
  end
end

# Calling the class method from the Application class
Application.run  # Output: INFO: Application is running

# The following line would raise an error if uncommented, 
# because `log_info` is not available as an instance method:
# Application.new.log_info("This won't work")

# 4. Namespaces:
# Modules can be used as namespaces to prevent name clashes between classes or methods 
# that may have the same name but belong to different contexts.

module Audio
  class Player
    def play
      puts "Playing audio..."
    end
  end
end

module Video
  class Player
    def play
      puts "Playing video..."
    end
  end
end

# Using the fully qualified name to avoid conflicts
audio_player = Audio::Player.new
audio_player.play  # Output: Playing audio...

video_player = Video::Player.new
video_player.play  # Output: Playing video...

# 5. Mixins and Multiple Inheritance:
# Ruby does not support multiple inheritance (inheriting from more than one class).
# However, you can achieve similar functionality using mixins (including multiple modules).

module Swimmable
  def swim
    puts "I'm swimming!"
  end
end

module Flyable
  def fly
    puts "I'm flying!"
  end
end

class Duck
  include Swimmable
  include Flyable

  def quack
    puts "Quack!"
  end
end

# Creating an instance of the Duck class
duck = Duck.new

# Calling methods from included modules
duck.swim  # Output: I'm swimming!
duck.fly   # Output: I'm flying!
duck.quack # Output: Quack!

# 6. Including vs Extending:
# - `include` adds the module's methods as instance methods to the class.
# - `extend` adds the module's methods as class methods to the class.

# Example of `include`
class Car
  include Logger

  def drive
    log_info("Car is driving")  # This works because `log_info` is now an instance method.
  end
end

car = Car.new
car.drive  # Output: INFO: Car is driving

# Example of `extend`
class Truck
  extend Logger
end

Truck.log_info("Truck is ready")  # Output: INFO: Truck is ready

# The following line would raise an error if uncommented, 
# because `log_info` is not available as an instance method:
# Truck.new.log_info("This won't work either")

# 7. Module Mixins vs. Class Inheritance:
# Inheritance is a "is-a" relationship, whereas Mixins provide a "has-a" or "can-do" relationship.
# Use class inheritance when the relationship is naturally hierarchical.
# Use mixins when you want to share behavior across unrelated classes.

# For example, `Duck` is a kind of `Bird` (inheritance), but it can also `Swim` and `Fly` (mixins).

# Summary:
# - Modules are a way to group related methods, constants, and other modules together.
# - Mixins allow you to include shared behavior across multiple classes using modules.
# - `include` adds module methods as instance methods; `extend` adds them as class methods.
# - Modules can also be used as namespaces to avoid name conflicts.


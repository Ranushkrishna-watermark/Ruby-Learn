# A class in Ruby is a blueprint for creating objects (instances).
# It defines the properties (variables )  and behaviors (methods) that the objects will have.

# Defining a basic class named `Person`
class Person
  # The `attr_accessor` method automatically creates getter and setter methods
  # for instance variables.
  attr_accessor :name, :age

  # The `initialize` method is a special method called when a new object is created.
  # It's often used to set initial values for instance variables.
  def initialize(name, age)
    @name = name  # `@name` is an instance variable. can save names like Ranush, etc
    @age = age    # `@age` is also an instance variable.
  end

  # This is a method that belongs to the `Person` class.
  # It can be called on any instance of the class.
  def greet
    puts "Hello, my name is #{@name} and I am #{@age} years old."
  end

  # A class method is defined with `self.` prefix.
  # Class methods are called on the class itself, not on instances of the class.
  def self.species
    "Homo sapiens"
  end

  # Private methods can only be called within the context of the class.
  # These methods are not accessible from outside the class.
  private

  def secret_identity
    "My secret identity is #{@name.reverse}"
  end
end

# Creating an instance (object) of the `Person` class.
person1 = Person.new("Alice", 30)

# Accessing and modifying instance variables using the accessor methods.
puts person1.name  # Output: Alice
person1.name = "Bob"
puts person1.name  # Output: Bob

# Calling an instance method.
person1.greet  # Output: Hello, my name is Bob and I am 30 years old.

# Calling a class method.
puts Person.species  # Output: Homo sapiens

# Private methods cannot be called from outside the class.
# The following line would result in an error if uncommented:
# person1.secret_identity

# Inheritance allows a class to inherit behavior from another class.
# This is useful for reusing code and creating specialized versions of a class.

# Defining a `Student` class that inherits from `Person`.
class Student < Person
  attr_accessor :grade

  def initialize(name, age, grade)
    # `super` calls the `initialize` method of the parent class (`Person`).
    super(name, age)
    @grade = grade
  end

  # Overriding a method from the parent class.
  def greet
    puts "Hi, I'm #{@name}, I'm #{@age} years old, and I'm in grade #{@grade}."
  end
end

# Creating an instance of the `Student` class.
student1 = Student.new("Ranush", 23, 12)

# Calling the overridden `greet` method.
student1.greet  # Output: Hi, I'm Ranush, I'm 23 years old, and I'm in grade 12.

# Demonstrating polymorphism.
# Both `Person` and `Student` respond to the `greet` method, but they behave differently.
people = [person1, student1]

people.each(&:greet)
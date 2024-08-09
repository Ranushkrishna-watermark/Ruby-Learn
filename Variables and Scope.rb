# Variables in Ruby:
# Variables are used to store data that can be used and manipulated in a program.
# Ruby has several types of variables, each with its own scope.

# 1. Local Variables:
# Local variables are defined within a method or block and are accessible only within that context.
# They begin with a lowercase letter or an underscore (_).

def local_variable_example
  local_var = "I'm a local variable"
  puts local_var
end

local_variable_example
# Output: I'm a local variable

# Trying to access the local variable outside its scope will result in an error.
# puts local_var # This would raise an error: undefined local variable or method `local_var'

# 2. Instance Variables:
# Instance variables are available across methods for any particular instance or object.
# They begin with an "@" symbol.

class Person
  def initialize(name)
    @name = name
  end

  def display_name
    puts "Hello, my name is #{@name}."
  end
end

person = Person.new("Alice")
person.display_name
# Output: Hello, my name is Alice.

# 3. Class Variables:
# Class variables are shared among all instances of a class.
# They begin with "@@" and can be used to store class-level data.

class PersonWithClassVar
  @@species = "Homo sapiens"

  def initialize(name)
    @name = name
  end

  def display_species
    puts "I am a #{@@species}."
  end
end

person1 = PersonWithClassVar.new("Bob")
person2 = PersonWithClassVar.new("Charlie")

person1.display_species
# Output: I am a Homo sapiens.
person2.display_species
# Output: I am a Homo sapiens.

# 4. Global Variables:
# Global variables are accessible from anywhere in the Ruby program.
# They begin with a "$" symbol.

$global_var = "I'm a global variable"

def global_variable_example
  puts $global_var
end

global_variable_example
# Output: I'm a global variable

# 5. Constants:
# Constants begin with an uppercase letter and are used to store data that should not change.
# Constants are available throughout the program but can be changed (though it is not recommended).

CONSTANT_VAR = "I'm a constant variable"
puts CONSTANT_VAR
# Output: I'm a constant variable

# Although constants can be changed, Ruby will give a warning.
# CONSTANT_VAR = "Changed constant"
# Warning: already initialized constant CONSTANT_VAR

# Scope:
# Scope determines where variables and methods can be accessed or modified in a program.

# 1. Local Scope:
# Local variables have local scope, meaning they can only be accessed within the method or block they are defined in.

def local_scope_example
  local_var = "I'm in local scope"
  puts local_var
end

local_scope_example
# Output: I'm in local scope

# 2. Instance Scope:
# Instance variables have instance scope and are accessible across methods within the same instance of a class.

class InstanceScopeExample
  def initialize
    @instance_var = "I'm in instance scope"
  end

  def show_instance_var
    puts @instance_var
  end
end

example = InstanceScopeExample.new
example.show_instance_var
# Output: I'm in instance scope

# 3. Class Scope:
# Class variables have class scope and are shared among all instances of the class.

class ClassScopeExample
  @@class_var = "I'm in class scope"

  def show_class_var
    puts @@class_var
  end
end

example1 = ClassScopeExample.new
example2 = ClassScopeExample.new

example1.show_class_var
# Output: I'm in class scope
example2.show_class_var
# Output: I'm in class scope

# 4. Global Scope:
# Global variables have global scope and can be accessed from anywhere in the program.

def global_scope_example
  puts $global_var
end

global_scope_example
# Output: I'm a global variable

# 5. Constant Scope:
# Constants are available throughout the program but should be used with caution as their values are not meant to be changed.

def constant_scope_example
  puts CONSTANT_VAR
end

constant_scope_example
# Output: I'm a constant variable

# Summary:
# - **Local Variables**: Defined within methods or blocks and accessible only within that context.
# - **Instance Variables**: Available across methods for any particular instance or object, starting with "@".
# - **Class Variables**: Shared among all instances of a class, starting with "@@".
# - **Global Variables**: Accessible from anywhere in the Ruby program, starting with "$".
# - **Constants**: Begin with an uppercase letter and should not change; accessible throughout the program.

# - **Local Scope**: Variables accessible only within the method or block they are defined in.
# - **Instance Scope**: Variables accessible across methods within the same instance of a class.
# - **Class Scope**: Variables shared among all instances of a class.
# - **Global Scope**: Variables accessible from anywhere in the program.
# - **Constant Scope**: Constants available throughout the program.


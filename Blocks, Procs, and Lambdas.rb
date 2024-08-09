# 1. Blocks:
# Blocks are anonymous pieces of code that can be passed to methods.
# They are not objects but can be converted into objects (Procs).
# Blocks are enclosed in either do...end or {}.

# Using a block with the `each` method
[1, 2, 3].each do |num|
  puts num * 2
end
# Output:
# 2
# 4
# 6

# The `{}` syntax is often used for single-line blocks.
[1, 2, 3].each { |num| puts num * 3 }
# Output:
# 3
# 6
# 9

# Blocks can take arguments, just like methods.
# The arguments are passed between the pipe symbols `| |`.

# 2. Procs:
# A Proc is an object that encapsulates a block of code, which can be stored in a variable,
# passed to methods, or called explicitly.

# Creating a Proc
my_proc = Proc.new { |name| puts "Hello, #{name}!" }

# Calling the Proc
my_proc.call("Alice")  # Output: Hello, Alice!
my_proc.call("Bob")    # Output: Hello, Bob!

# Passing a Proc to a method
def greet(proc)
  proc.call("Charlie")
end

greet(my_proc)  # Output: Hello, Charlie!

# Procs can be created using `proc` or `Proc.new`, both are functionally equivalent.
my_proc2 = proc { |name| puts "Hi, #{name}!" }
my_proc2.call("Dave")  # Output: Hi, Dave!

# Procs can return from the method they were called in. This can lead to unexpected behavior.
def some_method
  proc = Proc.new { return "Returning from Proc" }
  proc.call
  "Returning from method"
end

puts some_method  # Output: Returning from Proc

# 3. Lambdas:
# Lambdas are a special type of Proc, but with some key differences.
# They are more strict about arguments and return behavior.

# Creating a lambda
my_lambda = -> (name) { puts "Hello from lambda, #{name}!" }

# Calling the lambda
my_lambda.call("Eve")  # Output: Hello from lambda, Eve!

# Lambdas check the number of arguments passed, just like methods.
# The following line would raise an error if uncommented, because it expects one argument:
# my_lambda.call()

# Lambdas return to the calling method, not from the method where they are defined.
def some_other_method
  lambda = -> { return "Returning from lambda" }
  lambda.call
  "Returning from method"
end

puts some_other_method  # Output: Returning from method

# 4. Differences between Procs and Lambdas:
# - Argument Checking:
#   - Procs do not check the number of arguments. Missing arguments are set to `nil`.
#   - Lambdas do check the number of arguments and raise an error if they don't match.

proc_example = Proc.new { |x, y| puts "Proc: x=#{x}, y=#{y}" }
proc_example.call(1)    # Output: Proc: x=1, y=

lambda_example = -> (x, y) { puts "Lambda: x=#{x}, y=#{y}" }
# The following line would raise an error if uncommented, because it expects two arguments:
# lambda_example.call(1)

# - Return Behavior:
#   - Procs return from the method where they are called, which can exit the method early.
#   - Lambdas return to the method that called them, so they act more like regular methods.

def proc_vs_lambda
  proc = Proc.new { return "Proc returning" }
  proc.call
  return "Method returning"

  lambda = -> { return "Lambda returning" }
  lambda.call
  "Method returning"
end

puts proc_vs_lambda  # Output: Proc returning

# 5. Converting Blocks to Procs:
# Blocks can be converted into Procs using the `&` operator.

def block_to_proc(&block)
  block.call("Converted block to Proc!")
end

block_to_proc { |message| puts message }
# Output: Converted block to Proc!

# The `&block` converts a block into a Proc object that can be passed around or called.

# 6. Practical Use Cases:
# - Blocks are typically used for short pieces of code passed to methods like iterators.
# - Procs are useful when you need to pass multiple blocks to a method or reuse a block of code.
# - Lambdas are preferred when you want a block of code with strict argument checking and normal return behavior.

# Example of using a Proc for a reusable piece of code:
square = Proc.new { |x| x ** 2 }

puts [1, 2, 3, 4].map(&square)  # Output: [1, 4, 9, 16]

# Example of using a Lambda for strict argument checking:
add = -> (x, y) { x + y }
puts add.call(5, 3)  # Output: 8

# Summary:
# - Blocks are lightweight and often used for short tasks.
# - Procs are blocks that can be stored and reused.
# - Lambdas are similar to Procs but with stricter rules.


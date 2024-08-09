# Hashes in Ruby:
# A Hash is a collection of key-value pairs, where each key is unique.
# Hashes are similar to arrays, but instead of using an index to access elements, we use keys.

# 1. Creating a Hash:
# There are several ways to create a hash in Ruby.

# Using the hash literal notation:
my_hash = { "name" => "Alice", "age" => 25, "city" => "New York" }
puts my_hash
# Output: {"name"=>"Alice", "age"=>25, "city"=>"New York"}

# Using symbols as keys (common in Ruby):
my_hash_with_symbols = { name: "Bob", age: 30, city: "Los Angeles" }
puts my_hash_with_symbols
# Output: {:name=>"Bob", :age=>30, :city=>"Los Angeles"}

# Using the Hash class:
empty_hash = Hash.new
puts empty_hash
# Output: {}

# 2. Accessing Values in a Hash:
# You can access values in a hash using their corresponding keys.

# Accessing a value using a string key:
puts my_hash["name"]
# Output: Alice

# Accessing a value using a symbol key:
puts my_hash_with_symbols[:age]
# Output: 30

# 3. Adding and Updating Values:
# You can add a new key-value pair or update an existing one.

# Adding a new key-value pair:
my_hash["country"] = "USA"
puts my_hash
# Output: {"name"=>"Alice", "age"=>25, "city"=>"New York", "country"=>"USA"}

# Updating an existing value:
my_hash["age"] = 26
puts my_hash
# Output: {"name"=>"Alice", "age"=>26, "city"=>"New York", "country"=>"USA"}

# 4. Deleting a Key-Value Pair:
# You can delete a key-value pair from a hash using the delete method.

my_hash.delete("city")
puts my_hash
# Output: {"name"=>"Alice", "age"=>26, "country"=>"USA"}

# 5. Iterating Over a Hash:
# You can iterate over a hash using the each method.

my_hash.each do |key, value|
  puts "#{key}: #{value}"
end
# Output:
# name: Alice
# age: 26
# country: USA

# 6. Default Values:
# You can set a default value for a hash. If you try to access a key that doesn't exist, the hash will return the default value.

hash_with_default = Hash.new("Not Found")
puts hash_with_default[:missing_key]
# Output: Not Found

# 7. Merging Hashes:
# You can merge two hashes together using the merge method.

hash1 = { a: 1, b: 2 }
hash2 = { b: 3, c: 4 }

merged_hash = hash1.merge(hash2)
puts merged_hash
# Output: {:a=>1, :b=>3, :c=>4}

# Note: If the same key exists in both hashes, the value from the second hash will overwrite the value from the first hash.

# 8. Hash Methods:
# Some common hash methods include:

# keys: Returns an array of all the keys in the hash.
puts my_hash_with_symbols.keys
# Output: [:name, :age, :city]

# values: Returns an array of all the values in the hash.
puts my_hash_with_symbols.values
# Output: ["Bob", 30, "Los Angeles"]

# has_key?: Checks if a hash contains a specific key.
puts my_hash_with_symbols.has_key?(:name)
# Output: true

# has_value?: Checks if a hash contains a specific value.
puts my_hash_with_symbols.has_value?("Los Angeles")
# Output: true

# select: Returns a new hash containing only the key-value pairs that meet a certain condition.
selected_hash = my_hash_with_symbols.sel

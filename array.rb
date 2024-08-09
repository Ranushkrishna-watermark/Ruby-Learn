# Arrays in Ruby

# Array creation examples:
arr = (1..100).to_a # Creates an array from a range.
arr1 = Array.new # Creates an empty array => []
arr2 = Array.new(5) # Creates an array with 5 nil elements => [nil, nil, nil, nil, nil]
arr3 = Array.new(3, false) # Creates an array with 3 false elements => [false, false, false]
arr4 = Array.new(3) { Hash.new } # Creates an array with 3 empty hashes => [{}, {}, {}]
arr5 = Array.new(3) { |i| i.to_s } # Creates an array with string representations of indices => ["0", "1", "2"]
arr6 = Array.new(2) { Array.new(3) } # Creates a 2D array => [[nil, nil, nil], [nil, nil, nil]]
arr7 = Array.new(2) { Array.new(2) { Array.new(1) } } # Creates a 3D array => [[[nil], [nil]], [[nil], [nil]]]
arr8 = Array.new(1, Array.new(1, Array.new(1))) # Creates a nested array => [[[nil]]]
arr9 = Array({ a: "a", b: "b" }) # Converts a hash to an array => [[:a, "a"], [:b, "b"]]

# Accessing elements:
p arr.first # Returns the first element.
p arr.last # Returns the last element.
p arr[2] # Returns the element at index 2.
p arr[-1] # Returns the last element (negative index).
p arr[15, 30] # Returns a subarray from index 15, length 30.
p arr[15..30] # Returns elements from index 15 to 30.
p arr.at(15) # Returns the element at index 15.
p arr.fetch(150, "out of index") # Fetches the element at index 150, or returns "out of index".
p arr.sample # Returns a random element.
p arr.values_at(1, 3, 5) # Returns elements at the given indices.

# Array size and length:
p arr.length # Returns the length of the array.
p arr.size # Alias for length.
p arr.count # Returns the number of elements in the array.
p arr.count(2) # Counts occurrences of the element '2'.
p arr.empty? # Returns true if the array is empty.

# Checking for inclusion:
p arr.include?(45) # Returns true if 45 is present in the array.

# Adding elements:
arr.push(101) # Adds an element to the end.
arr << 102 # Adds an element to the end.
arr.unshift(0) # Adds an element to the beginning.
arr.insert(1, "inserted") # Inserts an element at index 1.
arr.insert(5, "1", "2", "3", "4") # Inserts multiple elements starting at index 5.
arr.concat([200, 201]) # Appends elements from another array.

# Removing elements:
arr.pop # Removes the last element.
arr.shift # Removes the first element.
arr.delete_at(10) # Removes the element at index 10.
arr.delete(5) # Removes all occurrences of the element 5.
arr.compact # Returns a new array with nil elements removed.
arr.compact! # Removes nil elements from the original array.
arr.uniq # Returns a new array with duplicate elements removed.
arr.uniq! # Removes duplicate elements from the original array.
arr.clear # Removes all elements from the array.

# Iterating over arrays:
arr.each { |a| print a } # Loops through the array and prints each element.
arr.reverse_each { |a| print a } # Loops through the array in reverse order.
arr.each_with_index { |a, i| print "#{i}: #{a} " } # Loops with index.

# Transformation:
p arr.map { |i| 2 * i } # Creates a new array with each element multiplied by 2.
p arr.map! { |i| 2 * i } # Modifies the original array with each element multiplied by 2.
p arr.collect { |i| i ** 2 } # Alias for map.
p arr.flatten # Flattens a multi-dimensional array.
p arr.flatten! # Flattens the original array.
p arr.shuffle # Returns a new array with elements shuffled.
p arr.shuffle! # Shuffles the elements in the original array.
p arr.sort # Returns a sorted array.
p arr.sort! # Sorts the original array.
p arr.sort_by { |i| -i } # Sorts based on a custom criteria.
p arr.transpose # Transposes a nested array (converts rows to columns).

# Selecting and rejecting elements:
p arr.select { |i| i.odd? } # Returns an array with only odd elements.
p arr.select! { |i| i.odd? } # Modifies the original array to keep only odd elements.
p arr.reject { |i| i.even? } # Returns an array with only non-even elements.
p arr.reject! { |i| i.even? } # Modifies the original array to reject even elements.
p arr.drop_while { |i| i < 50 } # Drops elements until a condition is met.
p arr.take_while { |i| i < 50 } # Takes elements while a condition is met.
p arr.find { |i| i > 50 } # Finds the first element that matches the condition.
p arr.find_all { |i| i > 50 } # Finds all elements that match the condition.
p arr.partition { |i| i.odd? } # Partitions the array into two arrays based on the condition.
p arr.group_by { |i| i % 2 } # Groups elements by a condition.

# Combining arrays:
p arr + [200, 201] # Concatenates two arrays.
p arr & [2, 4, 6] # Returns elements common to both arrays.
p arr | [2, 4, 6] # Returns elements from both arrays without duplicates.
p arr - [2, 4, 6] # Removes elements that are in the other array.
p arr * 2 # Repeats the array twice.
p arr * "-" # Joins elements with a separator.
p arr.product([:a, :b]) # Combines elements from both arrays.

# Array set operations:
p arr.intersection([2, 4, 6]) # Alias for & (Intersection).
p arr.union([2, 4, 6]) # Alias for | (Union).
p arr.difference([2, 4, 6]) # Alias for - (Difference).

# Array slicing and dicing:
p arr.slice(2, 5) # Returns a subarray from index 2, length 5.
p arr.slice!(2, 5) # Removes a subarray from index 2, length 5.
p arr[2..5] # Returns elements from index 2 to 5.
p arr.dig(0, 1) # Extracts a nested value.

# Advanced queries:
p arr.any? { |i| i > 50 } # Returns true if any element matches the condition.
p arr.all? { |i| i > 50 } # Returns true if all elements match the condition.
p arr.none? { |i| i > 100 } # Returns true if no elements match the condition.
p arr.one? { |i| i > 50 } # Returns true if exactly one element matches the condition.

# Array combinations and permutations:
p arr.combination(2).to_a # Returns all combinations of length 2.
p arr.permutation(2).to_a # Returns all permutations of length 2.
p arr.repeated_combination(2).to_a # Returns repeated combinations.
p arr.repeated_permutation(2).to_a # Returns repeated permutations.

# Searching and indexing:
p arr.index(50) # Returns the index of the first occurrence of 50.
p arr.rindex(50) # Returns the index of the last occurrence of 50.
p arr.bsearch { |x| x >= 50 } # Binary search for element >= 50.
p arr.bsearch_index { |x| x >= 50 } # Binary search for index of element >= 50.

# Array reduction and aggregation:
p arr.reduce(:+) # Sums up all elements.
p arr.reduce(:*) # Multiplies all elements.
p arr.inject(:+) # Alias for reduce.
p arr.sum # Sums up all elements.
p arr.min # Returns the minimum element.
p arr.max # Returns the maximum element.
p arr.minmax # Returns both min and max elements.
p arr.tally # Counts occurrences of each element.

# Array transformations:
p arr.join("-") # Joins elements into a string with "-" as a separator.
p arr.zip([:a, :b, :c]) # Combines corresponding elements into pairs.
p arr.pack("C*") # Packs array contents into a binary sequence.

# Converting to other types:
p arr.to_h # Converts an array of pairs into a hash.
p arr.to_a # Returns itself as an array (for compatibility).
p arr.to_ary # Returns itself as an array (for compatibility).
p arr.to_s # Converts the array to

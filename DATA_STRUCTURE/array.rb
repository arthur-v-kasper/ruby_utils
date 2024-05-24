arr = [1,2,3,4,5]
puts "Original arr: #{arr}"


p arr.length

p arr.reverse

# return a new array with the "n" elements taken from the original array
take_arr = arr.take(2)
puts "arr: #{arr}"
puts "take_arr: #{take_arr}" # take_arr: [1, 2]

# return a new array with the "n" elements that left over from the original array
drop_arr = arr.drop(2)
puts "drop: #{arr}"
puts "drop_arr: #{drop_arr}" # drop_arr: [3, 4, 5]

# add num item to the end of the array
# do not return num element
arr.push(6)
puts "push: #{arr}" # push: [1, 2, 3, 4, 5, 6]

# removes the item pass as a param to the array
# do not return num element
arr.delete(3)
puts "delete: #{arr}" # delete: [1, 2, 4, 5, 6]

# Removes the last item of an array
# do not return num element
arr.pop(1)
puts "pop: #{arr}"

# iterate with all elements and return a new array for each iteration was true in the operation
even_arr = arr.select {|elem| elem + 3 }
puts "select with even numbers #{even_arr}"

# returns a single element formed by an operation
# value: that you are operate in the loop
# loop: current value of the array
# inject is the same of reducer
sum_array = arr.inject { |val, elem| val += elem }
puts "sum_array with inject #{sum_array}" # 12

#you can add a initial number in the inject
sum_array = arr.inject(8) { |val, elem| val += elem }
puts "sum_array with inject(8) #{sum_array}\n" # 20

# each returns self
blah = []
arr2 = [1,2,3,4,5]
new_arr = arr2.each{|num| blah.push(num+2)}
puts "each return: #{new_arr}"
puts "each original: #{arr2}"
puts "each: #{blah}"

# map returns nem object
new_arr = arr2.map {|num| num + 2}
puts "map return: #{new_arr}"
puts "map original: #{arr2}"
def binary_search_target(array, target)
  array.sort!

  left = 0
  right = array.length - 1

  mid = array.length / 2

  while left <= right
    if array[mid] == target
      return mid
    elsif array[mid] < target
      left = mid + 1
      mid = (left + right) / 2
    elsif array[mid] > target
      right = mid - 1
      mid = (left + right) / 2
    end
  end
end

arr = [2, 4, 7, 8, 9, 11, 13, 15, 23, 26, 30, 34, 44, 51, 78]
puts binary_search_target(arr, 9) # => 4
puts binary_search_target(arr, 4) # => 1
puts binary_search_target(arr, 30) # => 10
puts binary_search_target(arr, 78) # => 15
puts binary_search_target(arr, 15) # => 7
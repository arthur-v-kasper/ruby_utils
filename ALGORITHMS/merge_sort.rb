def merge_sort(list)
  return list if list.length <= 1
    
  mid = (list.length / 2).floor
  left = merge_sort(list[0...mid])
  right = merge_sort(list[mid..list.length])
  merge(left, right)
end

def merge(left, right)
  if left.empty?
    right
  elsif right.empty?
    left
  elsif left.first < right.first
    [left.first] + merge(left[1..left.length], right)
  else
    [right.first] + merge(left, right[1..right.length])
  end
end

p arr = Array.new(11) { rand(0..30) }
p merge_sort arr
# Returns a new array to that contains elements in the intersection of the two input arrays
# Time complexity: O(nlogn) + O(logn) where n is the number of elem is array1
# Space complexity:O(n) --> O(n) + O(n) + O(m) where n is the number of elems in array1 and m is the number of elems in intersect
def intersection(array1, array2)
  intersect = []
  return intersect if !array1 || !array2
  array1 = merge_sort(array1)
  array2.each do |elem|
    intersect << elem if binary_search(array1, elem)
  end
  return intersect
end

def merge_sort(array)
  return array if array.length <= 1
  mid = array.length / 2
  arr1 = merge_sort(array[0...mid])
  arr2 = merge_sort(array[mid..-1])
  return merge(arr1, arr2)
end

def merge(arr1, arr2)
  return arr1 if arr2.empty?
  return arr2 if arr1.empty?
  if arr1[0] <= arr2[0]
    return arr1[0...1] + merge(arr1[1..-1], arr2)
  else
    return arr2[0...1] + merge(arr1, arr2[1..-1])
  end
end

def binary_search(array, x)
  return false if array.empty?
  mid = array.length / 2
  if array[mid] == x
    return true
  elsif array[mid] > x
    binary_search(array[0...mid], x)
  else
    binary_search(array[(mid + 1)..-1], x)
  end
end

system("clear")

#2. Write a method that takes an array of strings, and returns an array of the
#same string values, except with the vowels (a, e, i, o, u) removed.
def remove_vowels(arr)
  arr.map { |str| str.delete("aeiouAEIOU")}
end
def remove_vowels(strings)
  for string in strings
    string.delete!('aeiouAEIOU')
  end
end
def remove_vowels(arr)
  arr.each{ |str| str.delete!("aeiouAEIOU")}
end
# p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
# p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
# p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

#3.Write a method that calculates and returns the index of the first Fibonacci
#number that has the number of digits specified as an argument.
#(The first Fibonacci number has index 1.)
# def find_fibonacci_index_by_length(num_digits)
#   fib = [1, 1]
#   while fib[-1].to_s.size != num_digits do
#     fib << (fib[-1] + fib[-2])
#   end
#    fib.index(fib[-1])+1
# end
def find_fibonacci_index_by_length(num_digits)
  fib = [1, 1]
  until fib[-1].to_s.size == num_digits do #read: se dodeka...
    fib << (fib[-1] + fib[-2])
  end
   fib.index(fib[-1])+1
end

# p find_fibonacci_index_by_length(2) == 7
# p find_fibonacci_index_by_length(10) == 45
# p find_fibonacci_index_by_length(100) == 476
# p find_fibonacci_index_by_length(1000) == 4782
# p find_fibonacci_index_by_length(10000) == 47847

#4.Write a method that takes an Array as an argument, and reverses its elements
#in place; that is, mutate the Array passed into this method. The return value
#should be the same Array object.

#You may not use Array#reverse or Array#reverse!.
def reverse!(arr)
  temp = arr.dup
  arr.map!.with_index(1) { |_, i|  p temp[-i] }
end
def reverse!(arr)
  arr.sort_by!.with_index { |_, idx| -idx }
end
def reverse!(arr)
  dup = arr.dup
  arr.each_with_index { |_, i| arr[i] = dup.pop }
end
def reverse!(arr)
  arr.each_with_index { |_, idx|arr.insert(idx, arr.pop) }
end
#?????????????????????????
def reverse!(arr)
  arr.sort_by! { |i| arr.length - arr.index(i) }
end

# list = [1,2,3,4]
# result = reverse!(list) # => [4,3,2,1]
# p list == [4, 3, 2, 1]
# p list.object_id == result.object_id
#
# list = %w(a b c d e)
# reverse!(list) # => ["e", "d", "c", "b", "a"]
# p list == ["e", "d", "c", "b", "a"]
#
# list = ['abc']
# reverse!(list) # => ["abc"]
# p list == ["abc"]
#
# list = []
# reverse!(list) # => []
# p list == []

#5.Write a method that takes an Array, and returns a new Array with the elements
# of the original list in reverse order. Do not modify the original list.

#You may not use Array#reverse or Array#reverse!, nor may you use the method you wrote in the previous exercise.
def reverse(arr)
  arr.map.with_index(1){ |ele, i|  arr[-i]}
end
def reverse(arr)
  arr.sort_by.with_index{ |_,i| -i}
end

# p reverse([1,2,3,4]) == [4,3,2,1]          # => true
# p reverse(%w(a b c d e)) == %w(e d c b a)  # => true
# p reverse(['abc']) == ['abc']              # => true
# p reverse([]) == []                        # => true
#
# list = [1, 2, 3]                      # => [1, 2, 3]
# new_list = reverse(list)              # => [3, 2, 1]
# p list.object_id != new_list.object_id  # => true
# p list == [1, 2, 3]                     # => true
# p new_list == [3, 2, 1]                 # => true

#6.Write a method that takes two Arrays as arguments, and returns an Array that
#contains all of the values from the argument Arrays. There should be no duplication
# of values in the returned Array, even if there are duplicates in the original Arrays.
# def merge(arr1, arr2)
#   (arr1 + arr2).uniq
# end
# def merge(arr1, arr2)
#   a = arr1 + arr2
#   a.each_with_index do |ele, i|
#     a.delete_at(i) if a.count(ele) > 1 && i < a.size
#   end.sort
# end
# def merge(array1, array2)
#   hash = {}
#   (array1 + array2).each { |elem| hash[elem] = true }
#   hash.keys
# end

def merge(arr1, arr2)
  (arr1 + arr2).each_with_object([]) { |x, ary| ary << x if ary.count(x) == 0 }
end
def merge(array1, array2)
  array1 + array2.select { |element| !array1.include?(element) }
end

#p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

# 7.Write a method that takes an Array as an argument, and returns two Arrays
# that contain the first half and second half of the original Array, respectively.
# If the original array contains an odd number of elements, the middle element
# should be placed in the first half Array.
# AMAZING!!!!
# YOU DONT NEED ANY NEW ARRAY, SHOWELING ECT..JUST USE RANGE!!!!
def halvsies(ary)
  ary.size.even? ? [ary[0...(ary.size/2)], ary[(ary.size/2)..-1]] : [ary[0..(ary.size/2)], ary[(ary.size/2 + 1)..-1]]
end

def halvsies(arr)
  half = arr.size.fdiv(2).ceil
  arr.partition.with_index { |_, idx| idx < half }
end
def halvsies(arr)
  result = []
  if arr.size.odd?
    result << arr.select.with_index { |ele, i| i <= arr.size / 2}
    result << arr.reject.with_index { |ele, i| i <= arr.size / 2 }
  else
    result << arr.select.with_index { |ele, i| i < arr.size/2}
    result << arr.reject.with_index { |ele, i| i < arr.size/2}
  end
  result
end
# #CHECK THIS USE OF .CEIL AND THE USE OF FIRST HALF TO DETERMINE SECOND HALF!!!!
def halvsies(array)
  first_half = array.slice(0, (array.size / 2.0).ceil)
  second_half = array.slice(first_half.size, array.size - first_half.size)
  [first_half, second_half]
end
#pushing from the front, and showeling in the first one, grabbing for the back
#and unshifting in the second one
def halvsies(ary)
  first_ary = []
  second_ary = []
  while ary.empty? == false
    first_ary << ary.shift
    break if ary.empty?
    second_ary.unshift(ary.pop)
  end
  p [first_ary, second_ary]
end

def halvsies(arr)
  first, last = [], []
  arr.each_with_index do |num, i|
    i < arr.length / 2.0 ? first << num : last << num
  end

  return first, last
end

# p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
# p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
# p halvsies([5]) == [[5], []]
# p halvsies([]) == [[], []]

#8.Given an unordered array and the information that exactly one value in the
#array occurs twice (every other value occurs exactly once), how would you determine
# which value occurs twice? Write a method that will find and return the duplicate
#value that is known to be in the array.

def find_dup(arr)
  arr.each{ | ele | return ele if arr.count(ele) == 2 }
end
def find_dup(array)
  array.find { |element| array.count(element) == 2 }
end
# p find_dup([1, 5, 3, 1]) == 1
# p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
#           38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
#           14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
#           78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
#           89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
#           41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
#           55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
#           85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
#           40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
#           7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73

#9.Write a method named include? that takes an Array and a search value as
#arguments. This method should return true if the search value is in the array,
#false if it is not. You may not use the Array#include? method in your solution.
def include?(arr, target)
   arr.any?{ |ele| ele == target} ? true : false
end

#The first method uses Array#find_index to scan the array for the first element
# that has the specified value. find_index returns the index number of the found
# element, which will always have a truthy value, or nil if no such element is
#present. We then use !! to force the return value to true or false in accordance
# with the implied promise of the ? in include?.
def include?(array, value)
  !!array.find_index(value)
end

#The second method does essentially the same thing, but it uses each instead of
#find_index. This takes a little bit more work, since we are explicitly returning
# false if the value is not found.
def include?(array, value)
  array.each { |element| return true if value == element }
  false
end
# p include?([1,2,3,4,5], 3) == true
# p include?([1,2,3,4,5], 6) == false
# p include?([], 3) == false
# p include?([nil], nil) == true
# p include?([], nil) == false

#10.Write a method that takes a positive integer, n, as an argument, and displays
# a right triangle whose sides each have n stars. The hypotenuse of the triangle
# (the diagonal side in the images below) should have one end at the lower-left
#of the triangle, and the other end at the upper-right.
def triangle(n)
  1.upto(n){ |i| p "#{' ' * (n-i)}#{ '*' * i }" }
end

triangle(5)
#     *
#    **
#   ***
#  ****
# *****

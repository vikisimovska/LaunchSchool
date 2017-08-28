system("clear")
#MEDUIM 1
#
# #1.Write a method that rotates an array by moving the first element to the end
# #of the array. The original array should not be modified.
# def rotate_array(array)
#   arr = array.dup
#   p arr.push(arr.shift)
# end
# #BETTER VERSION THEN ABOVE!!
# def rotate_array(arr)
#   array = arr.dup
#   array << array.shift
# end
# def rotate_array(array)
#   array[1..-1] + [array[0]]
# end
# def rotate_array(arr)
#   arr[1..-1] << arr.first
# en
# def rotate_array(array)
#   first, *remainder = array
#   remainder + [first]
# end
# def rotate_array(arr)
#   [*arr[1..-1], *arr.first]
# end
# # p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# # p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# # p rotate_array(['a']) == ['a']
#
# # x = [1, 2, 3, 4]
# # p rotate_array(x) == [2, 3, 4, 1]   # => true
# # p x == [1, 2, 3, 4]                 # => true
#
# #2.Write a method that can rotate the last n digits of a number
def rotate_rightmost_digits(long_number, n)
  return long_number if n == 1
  arr = long_number.to_s
  (arr[0...-n] +  arr[-n+1..-1] + arr[-n]).to_i
end
# p rotate_rightmost_digits(735291, 1) == 735291
# p rotate_rightmost_digits(735291, 2) == 735219
# p rotate_rightmost_digits(735291, 3) == 735912
# p rotate_rightmost_digits(735291, 4) == 732915
# p rotate_rightmost_digits(735291, 5) == 752913
# p rotate_rightmost_digits(735291, 6) == 352917

#CHECK THE REST OF THE SOLUTIONS!!!
#3.

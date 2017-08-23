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

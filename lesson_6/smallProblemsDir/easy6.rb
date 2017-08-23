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

#4.

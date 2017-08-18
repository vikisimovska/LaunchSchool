#Easy 1

#1. Write a method that takes two arguments, a string and a positive integer,
# and prints the string as many times as the integer indicates.

def repeat (str, num)
  num.times { |n| puts str }
end

#repeat('Hello', 3)

#2. Write a method that takes one integer argument, which may be positive,
#negative, or zero. This method return true if the number's absolute value is
#odd. You may assume that the argument is a valid integer value.

def is_odd?(num)
  num.abs.odd?
end

# puts is_odd?(-17)  # => true
# puts is_odd?(-8)   # => false

#3.Write a method that takes one argument, a positive integer, and returns a
#list of the digits in the number.

# version 1
# def digit_list(num)
#   new_arr = []
#   arr = num.to_s.split("")
#   arr.each do |str|
#     new_arr << str.to_i
#   end
#   new_arr
# end

#version 2
# def digit_list(num)
#   num.to_s.chars.map{ |str| str.to_i}
# end

#version 3
def digit_list(num)
  num.to_s.chars.map(&:to_i)
end

#digit_list(12345)

 #4.Write a method that counts the number of occurrences of each element in a
 # given array.

 # Hash solution
 # def decount_occurrences(arr)
 #  hash = {}
 #  arr.uniq.each do |ele|
 #    hash[ele] = arr.count(ele)
 #  end
 #  hash
 # end

# string solution
def decount_occurrences(arr)
  h = arr.group_by{ |str| arr.count(str) }
  p h
  h.each do |k,v|
    puts "#{v[0]} => #{k}"
  end
end

 vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle',
   'motorcycle', 'car', 'truck']
# decount_occurrences(vehicles)

#5.Write a method that takes one argument, a string, and returns the same string
# with the words in reverse order.

#version 1
# def reverse_sentence(str)
#   str.split.reverse.join(' ')
# end

#def reverse_sentence(str, new_arr = [])
#   arr = str.split
#   arr.each { |word| new_arr.unshift(word)}
#   new_arr.join(' ')
# end

#version 3
def reverse_sentence(str, new_arr = [])
  a = str.split
  new_arr << a.pop until a.empty?
  new_arr.join(' ')
end

#p reverse_sentence('Reverse these words') == 'words these Reverse'

#6.Write a method that takes one argument, a string containing one or more words
# and returns the given string with all five or more letter words reversed. Each
# string will consist of only letters and spaces. Spaces should be included only
 #when more than one word is present.
#version 1
# def reverse_words(str)
#   result = ''
#   str.split.each do |word|
#     if str.size > 1
#       if word.size >= 5
#          result += word.reverse + ' '
#        else
#          result += word + ' '
#        end
#      else
#        result = str.reverse
#      end
#   end
#   result
# end

#version 2
# def reverse_words(sentence)
#   sentence.split(' ').map do |word|
#     if word.length >= 5
#       word.reverse
#     else
#       word
#     end
#   end.join(' ')
# end

#GREAT VERSION COMPARABLE TO THE PREVIOUS ONE!!!
def reverse_words(string)
    string.split.map{ |word| word.length > 4 ? word.reverse : word }.join(' ')
end
#UNIQE SOLUTION!!
def reverse_words(str)
  str.gsub(/\w{5,}/, &:reverse)
end
# GREAT VERSION - version 3
def reverse_words(string)
  string.split.each { |item| item.reverse! if item.size >= 5 }.join(' ')
end

# puts reverse_words('Professional')          # => lanoisseforP
# puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
# puts reverse_words('Launch School')         # => hcnuaL loohcS

#7.Write a method that takes one argument, a positive integer, and returns a
#string of alternating 1s and 0s, always starting with 1. The length of the
#string should match the given integer.

def stringy(num)
  str = ''
  num.times{ |i| i.even? ? str += '1' : str += '0'}
  str
end
#SIMILAR SOLUTIONS
def stringy(num)
  str = ''
  (1..num).each{ |n| n.odd? ? str << '1' : str << '0' }
  str
end
#UNIQ SOLUTION
def stringy(size)
  numbers = Array.new(size)
  numbers.fill { |i| i.even? ? 1 : 0 }.join
end

def stringy(n, zero = 1)
  ("#{zero == 1 ? '10' : '01' }" * n)[0, n]
end
#puts stringy(6) == '101010'

#8.

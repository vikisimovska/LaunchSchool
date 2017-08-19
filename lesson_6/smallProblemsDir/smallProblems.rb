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

#8.Write a method that takes one argument, an array containing integers, and
#returns the average of all numbers in the array. The array will never be empty
#and the numbers will always be positive integers.
def average(arr)
  arr.reduce(:+)/arr.size
end

#SIMILAR SOLUTION WITH SUM AND COUNT, INSTEAD OF REDUCE AND SIZE!!
def average(arr)
  arr.sum/arr.count
end

#puts average([1, 5, 87, 45, 8, 8]) == 25
#9.Write a method that takes one argument, a positive integer, and returns the
#sum of its digits.
def sum(num)
   num.to_s.scan(/\d+/)
   arr.map { |str| str.to_i }.sum
end
def sum(number)
 number.to_s.chars.reduce(0) { |sum, digit| sum += digit.to_i }
end
def sum(num)
  num.to_s.chars.map(&:to_i).reduce(:+)
end
def sum(int)
  digits = int.to_s.split('').reduce {|sum, num| sum.to_i + num.to_i}
end
def sum(number)
number.digits.sum
end
def sum(int)
  return int if int.to_s.size <= 1
  int, remainder = int.divmod(10)
  remainder + sum(int)
end
# puts sum(496) == 19
# puts sum(123_456_789) == 45

#10.Write a method that takes two arguments, a positive integer and a boolean,
#and calculates the bonus for a given salary. If the boolean is true, the bonus
#should be half of the salary. If the boolean is false, the bonus should be 0.
def calculate_bonus(num, bool)
  bool == true ? num/2 : 0
end

#puts calculate_bonus(2800, true) == 1400
#puts calculate_bonus(1000, false) == 0

#********************************E A S Y 2 ************************************
#1.Build a program that randomly generates and prints Teddy's age. To get the age
 #you should generate a random number between 20 and 200.
# puts "Teddy is #{(20..200).to_a.sample} years old!"
#Teddy is 69 years old!

#2VERSION..you can use rand directly on range obj, sample had to be used on arr
age = rand(20..200)
#puts "Teddy is #{age} years old!"

#2.Build a program that asks a user for the length and width of a room in meters
# and then displays the area of the room in both square meters and square feet.

# puts "Enter the length of the room in meters:"
# length = gets.chomp.to_i
# puts "Enter the width of the room in meters:"
# width = gets.chomp.to_i
# result = length * width
# p "The area of the room is #{result.to_f} square meters (#{result*10.7639} square feet)."

#IMPROVED VERSION
# SQMETERS_TO_SQFEET = 10.7639
#
# puts '==> Enter the length of the room in meters: '
# length = gets.to_f
#
# puts '==> Enter the width of the room in meters: '
# width = gets.to_f
#
# square_meters = (length * width).round(2)
# square_feet = (square_meters * SQMETERS_TO_SQFEET).round(2)
#
# puts "The area of the room is #{square_meters} " + \
#      "square meters (#{square_feet} square feet)."

#3.Create a simple tip calculator. The program should prompt for a bill amount
#and a tip rate. The program must compute the tip and then display both the tip
# and the total amount of the bill.
# puts "What is the bill?"
# bill = gets.chomp.to_f
#
# puts "What is the tip percentage?"
# tip_percent = gets.chomp.to_f
#
# tip = (bill * tip_percent)/100
#
# puts "The tip is #{tip.round(2)}"
# puts "The total is #{bill + tip}"

#ANOTHER VERSION THAT CHECKS VALIDATION
# puts "--What is the total of the bill?"
# bill = gets.chomp
# until valid_number?(bill)
#   puts "--Please enter a valid number:"
#   bill = gets.chomp
# end

#4.Build a program that displays when the user will retire and how many years
#she has to work till retirement.

# puts "What is your age?"
# age = gets.chomp.to_i
# puts "At what age would you like to retire?"
# retire = gets.chomp.to_i
#
# years_to_work = retire - age
# puts "It's 2017. You will retire in #{2017 + years_to_work}."
# puts "You have only #{retire - age} years of work to go!"

#updated version using current_year = Time.now.year

#5.Write a program that will ask for user's name. The program will then greet
#the user. If the user writes "name!" then the computer yells back to the user.
# puts "What is your name?"
# name = gets.chomp
# if (name[-1] != '!')
#    puts "Hello #{name}."
#  else
#    puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
#  end
#UPDATED VERSION
#name.end_with?("!")
#??? name, exclamation = name.partition('!')

#6.Print all odd numbers from 1 to 99, inclusive. All numbers should be printed
# on separate lines.
#(1..99).each { |num| puts num if num.odd?}
#1.upto(99) { |num| puts num if num.odd? }
#100.times { |num| puts num if num.odd? }
#puts (1..99).reject{ |i| i.even? }
#puts (1..99).select{ |i| i.odd? }
#puts 1.step(by: 2, to: 99).to_a .. start from 1 up to 99, by 2

#7.Print the even numbers from 1 to 99, inclusive. All numbers should be printed
# on separate lines.
# (1..99).each { |num| puts num if num.even?}
#puts 1.upto(99).select(&:even?)

#8. Write a program that asks the user to enter an integer greater than 0, then
# asks if the user wants to determine the sum or product of all numbers between
# 1 and the entered integer.

# puts "Please enter an integer greater than 0:"
# num = gets.chomp.to_i
#
# puts "Enter 's' to compute the sum, 'p' to compute the product."
# computation = gets.chomp
#
# if computation == 's'
#   puts "The sum of the integers between 1 and #{num} is #{(1..num).sum}."
# elsif computation == 'p'
#   puts "The product of the integers between 1 and #{num} is #{(1..num).reduce(:*)}."
# end

#version 2..check out the sum and how it works with any enumerable method
# def compute_sum(number)
#   total = 0
#   1.upto(number) { |value| total += value }
#   total
# end

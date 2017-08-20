system("clear")
#1.Write a program that solicits 6 numbers from the user, then prints a message
#that describes whether or not the 6th number appears amongst the first 5 numbers.
# num_arr = []
# num = nil
#
# 1.upto(6) do |nth|
#   if nth == 6
#     p "==> Enter the last number:"
#     num = gets.chomp
#   else
#     p "=> Enter the #{nth} number:"
#     num_arr << gets.chomp
#   end
# end
#
# if num_arr.include?(num)
#   p "The number #{num} appears in #{num_arr}"
# else
#   p "The number #{num} does not appears in #{num_arr}"
# end

#2. Write a program that prompts the user for two positive integers, and then
#prints the results of the following operations on those two numbers: addition,
# subtraction, product, quotient, remainder, and power.

# p "==> Enter the first number:"
# num1 = gets.chomp.to_i
# p "==> Enter the second number:"
# num2 = gets.chomp.to_i
#
# p "==> #{num1} + #{num2} = #{num1 + num2}"
# p "==> #{num1} - #{num2} = #{num1 - num2}"
# p "==> #{num1} * #{num2} = #{num1 * num2}"
# p "==> #{num1} / #{num2} = #{num1 / num2}"
# p "==> #{num1} % #{num2} = #{num1 % num2}"
# p "==> #{num1} ** #{num2} = #{num1 ** num2}"

#updated version
# def prompt(message)
#   puts "==> #{message}"
# end
#
# prompt("Enter the first number:")
# first_number = gets.chomp.to_i
# prompt("Enter the second number:")
# second_number = gets.chomp.to_i

#3.Write a program that will ask a user for an input of a word or multiple words
# and give back the number of characters. Spaces should not be counted as a chars

# def prompt(msg)
#   p "==> #{msg}"
# end
#
# prompt "Please write word or multiple words:"
# words = gets.chomp
# words_arr = words.scan(/[\w,']+/)
# result = words_arr.reduce(0){|sum, word| sum + word.length}
# prompt "There are #{result} characters in \"#{words}\"."

#IMPROVED VERSION USING DELETE!!!!
# print 'Please write word or multiple words: '
# input = gets.chomp
# p number_of_characters = input.delete(' ').size
# puts "There are #{number_of_characters} characters in \"#{input}\"."

#IMPROVED VERSION USING GSUB!!
# puts "Please write word or multiple words:"
# input = gets.chomp
# puts "There are #{input.gsub(/ /, "").size} characters in #{input}"

#IMPROVED VERSION USING COUNT
# def num_chars
#   print "Please write word or multiple words: "
#   str = gets.chomp
#   count = str.count('^ ')
#   puts %(There are #{count} characters in "#{str}".)
# end

#IMPROVED VERSION TURNING IT INTO A STRING!!
# puts "Please write a word or multiple words: "
# word_or_words = gets.chomp
# characters = word_or_words.split.join.length
# puts "There are #{characters} characters in #{word_or_words}."

#4. MULTIPLY TWO numbers
def multiply(a, b)
  p a * b
end

#5.Using the multiply method from the "Multiplying Two Numbers" problem, write
#a method that computes the square of its argument (the square is the result of
# multiplying a number by itself).
def square(n)
  multiply(n, n)
end
#square(5)

#6. The || operator returns a truthy value if either or both of its operands are
# truthy, a falsey value if both operands are falsey. The && operator returns a
#truthy value if both of its operands are truthy, and a falsey value if either
#operand is falsey. This works great until you need only one of two conditions
#to be truthy, the so-called exclusive or.

#In this exercise, you will write a method named xor that takes two arguments,
#and returns true if exactly one of its arguments is truthy, false otherwise.
def xor?(value1, value2)
  if value1 == true && value2 == false
    return true
  elsif value1 == false && value2 == true
    return true
  else
    return false
  end
end

#IMPROVED version
def xor?(value1, value2)
  return true if value1 && !value2
  return true if value2 && !value1
  false
end

# p xor?(5.even?, 4.even?) == true
# p xor?(5.odd?, 4.odd?) == true
# p xor?(5.odd?, 4.even?) == false
# p xor?(5.even?, 4.odd?) == false

#7. Write a method that returns an Array that contains every other element of
#an Array that is passed in as an argument. The values in the returned list
#should be those values that are in the 1st, 3rd, 5th, and so on
# def oddities(arr)
#   arr.select.with_index { |ele, i| i.even? }
# end

#ADITTIONAL VERSIONS
def oddities(arr)
  arr.each_slice(2).map(&:first)
end

def oddities(arr)
   arr.partition.with_index { |_, idx| idx.odd? }.last
end

def oddities(arr)
  arr.reject.with_index { |_, idx| idx.odd? }
end

def oddities(arr)
  (0...arr.size).step(2).map { |idx| arr[idx] }
end

#oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
#oddities(['abc', 'def']) == ['abc']
# p oddities([123]) == [123]
# p oddities([]) == []

#8.Write a method that returns true if the string passed as an argument is a
#palindrome, false otherwise. A palindrome reads the same forward and backward.
# For this exercise, case matters as does punctuation and spaces.
def palindrome?(str)
  str == str.reverse
end

#9.Write another method that returns true if the string passed as an argument is
# a palindrome, false otherwise. This time, however, your method should be case-
#insensitive, and it should ignore all non-alphanumeric characters. If you wish,
# you may simplify things by calling the palindrome? method you wrote in the
#previous exercise.

def real_palindrome?(str)
  clean_str = str.downcase.delete(" " "," "'")
  clean_str == clean_str.reverse
end

#ADITTIONAL VERSIONS
def real_palindrome?(string)
  string = string.downcase.delete('^a-z0-9')
  palindrome?(string)
end
#??SCAN ALWAYS HAS EVERYTHING INSIDE [ ], DELETE IN " "
def real_palindrome?(words)
  words = words.scan(/[a-zA-Z0-9]/).join
  words.downcase == words.downcase.reverse
end
# ?? GSUB
def real_palindrome?(string)
  simple_string = string.downcase.gsub(/\W/, '')
  simple_string == simple_string.reverse
end
def real_palindrome?(str)
  palindrome?(str.gsub(/[^0-9A-z]/i, '').downcase)
end
# p real_palindrome?('madam') == true
# p real_palindrome?('Madam') == true           # (case does not matter)
# p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
# p real_palindrome?('356653') == true
# p real_palindrome?('356a653') == true
# p real_palindrome?('123ab321') == false

#10.Write a method that returns true if its integer argument is palindromic,
#false otherwise. A palindromic number reads the same forwards and backwardsDEF palindromic_number?(34543)
def palindromic_number?(num)
  num.to_s == num.to_s.reverse
end
# p palindromic_number?(34543) == true
# p palindromic_number?(123210) == false
# p palindromic_number?(22) == true
# p palindromic_number?(5) == true

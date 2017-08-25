system ("clear")
#EASY 8

#1.Write a method that takes an Array of numbers and then returns the sum of the
# sums of each leading subsequence for that Array. You may assume that the Array
#always contains at least one number.
def sum_of_sums(arr)
  arr.map.with_index { |_, i| arr[0..i].reduce(:+) }.reduce(:+)
end
def sum_of_sums(array)
  sums = 0
  array.map { |num| sums += num }.reduce(:+)
end
def sum_of_sums(arr)
  arr.size.downto(1).reduce(0) { |sum, n| sum + arr[-n] * n }
end

def sum_of_sums(nums)
  nums.reverse.map.with_index(1) { |n, idx|
    p " n is #{n}"
    p "idx is #{idx}"
    p "n * idx is #{n * idx}"
    n * idx }.reduce(0, :+)
end

def sum_of_sums(nums)
  (1..nums.size).reduce(0) { |sum, n| sum + nums.take(n).reduce(0, :+) }
end

#p sum_of_sums([3, 5, 2]) #== (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
# p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
# p sum_of_sums([4]) == 4
# p sum_of_sums([1, 2, 3, 4, 5]) == 35

#2.Mad libs are a simple game where you create a story template with blanks for
#words. You, or another player, then construct a list of words and place them
#into the story, creating an often silly or funny story as a result.
# p "Enter a noun:"
# noun = gets.chomp
#
# p "Enter a verb:"
# verb = gets.chomp
#
# p "Enter an adjective:"
# adj = gets.chomp
#
# p "Enter an adverb:"
# adv = gets.chomp
#
# p "Do you #{verb} your #{adj} #{noun} #{adv}? That's hilarious!"

#3.Write a method that returns a list of all substrings of a string that start
#at the beginning of the original string. The return value should be arranged in
# order from shortest to longest substring.
def substrings_at_start(str)
  str.chars.map.with_index { |ch, i| str[0..i] }
end

# p substrings_at_start('abc') == ['a', 'ab', 'abc']
# p substrings_at_start('a') == ['a']
# p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

#4.Write a method that returns a list of all substrings of a string. The returned
# list should be ordered by where in the string the substring begins. This means
# that all substrings that start at position 0 should come first, then all
#substrings that start at position 1, and so on. Since multiple substrings will
#occur at each position, the substrings at a given position should be returned
#in order from shortest to longest.
def substrings(str)
  arr = []
  str.chars.each_with_index do |_, i|
    str.chars.each_with_index do |_, j|
      i == j ? arr << str.chars[i] : arr << str.chars[i..j].join
    end
  end
  arr.reject { |str| str == '' }
end
#EXCELLENT SOLUTION!!
def substrings(str)
  substrings_array = []
  for i in 0...str.size
    for j in i...str.size
      substrings_array << str[i..j]
    end
  end
  substrings_array
end
#SIMILAR TO THE PREVIOUS ONE
def substrings(string)
  substrings = []
  0.upto(string.length - 1) do |index|
    index.upto(string.length - 1) do |count|
      substrings << string[index..count]
    end
  end
  substrings
end
def substrings(str)
  (0...str.size).flat_map { |n| substrings_at_start(str[n..-1]) }
end
def substrings(str)
  str.size <= 1 ? [str] : [*substrings_at_start(str), *substrings(str[1..-1])]
end
# p substrings('abcde') == [
#   'a', 'ab', 'abc', 'abcd', 'abcde',
#   'b', 'bc', 'bcd', 'bcde',
#   'c', 'cd', 'cde',
#   'd', 'de',
#   'e'
# ]

#5.
# def palindromes(str)
#   result = []
#   str.chars.each_with_index do |ch, i|
#     str.chars.each_with_index do |ch, j|
#       if i != j
#       result << str[i..j] if str[i..j] == str[i..j].reverse && str[i..j] != ""
#       end
#     end
#   end
#   result
# end
def palindromes(str)
  result = []
  for i in 0..str.size-1 do
    for j in  i..str.size-1 do
      result << str[i..j] if str[i..j] == str[i..j].reverse && str[i..j].size > 1
      end
    end
  result
end
# p palindromes('abcd') == []
# p palindromes('madam') == ['madam', 'ada']
# p palindromes('hello-madam-did-madam-goodbye') == [
#   'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
#   'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
#   '-madam-', 'madam', 'ada', 'oo'
# ]
#  p palindromes('knitting cassettes') == [
#   'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
# ]

#6.Write a method that takes two arguments: the first is the starting number,
#and the second is the ending number. Print out all numbers between the two
#numbers, except if a number is divisible by 3, print "Fizz", if a number is
#divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5,
# print "FizzBuzz".
def fizzbuzz(num1, num2)
  a = (num1..num2).map do |n|
    if n % 15 == 0
       "FizzBuzz"
    elsif  n % 3 == 0
      "Fizz"
    elsif n % 5 == 0
       "Buzz"
    else
       n
    end
  end.join(", ")
end

#p fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

#7Write a method that takes a string, and returns a new string in which every
#character is doubled.
def repeater(str)
  str.chars.map{ |ch| ch + ch}.join("")
end
def repeater(str)
  Array.new(2, str.chars).transpose.join
end

def repeater(str)
  [str.chars, str.chars].transpose.join
end

def repeater(str)
  str.gsub(/./, '\0\0')
end

def repeater(str)
  str.gsub(/./) { |c| c * 2 }
end

def repeater(str)
  str.chars.reduce('') { |result, char| result + char + char }
end
# p repeater('Hello') == "HHeelllloo"
# p repeater("Good job!") == "GGoooodd  jjoobb!!"
# p repeater('') == ''

#8.Write a method that takes a string, and returns a new string in which every
#consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and
#whitespace should not be doubled.
CONSONANTS = %w(b c d f g h j k l m n p q r s t v w x y z)
def double_consonants(str)
  str.chars.map do |ch|
    CONSONANTS.include?(ch.downcase) ? ch * 2 : ch
  end.join
end

# p double_consonants('String') == "SSttrrinngg"
# p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
# p double_consonants("July 4th") == "JJullyy 4tthh"
# p double_consonants('') == ""

#9.Write a method that takes a positive integer as an argument and returns that
# number with its digits reversed. Examples:
def reversed_number(num)
  num.to_s.reverse.to_i
end
def reversed_number(num)
   reverse = 0
   until num == 0
     num, remainder = num.divmod(10)
     reverse = reverse * 10 + remainder
   end
   p reverse
end
# p reversed_number(12345) == 54321
# p reversed_number(12213) == 31221
# p reversed_number(456) == 654
# p reversed_number(12000) == 21 # Note that zeros get dropped!
# p reversed_number(1) == 1

#10.Write a method that takes a non-empty string argument, and returns the
#middle character or characters of the argument. If the argument has an odd
#length, you should return exactly one character. If the argument has an even
#length, you should return exactly two characters.
def center_of(str)
  arr = str.chars
  arr.size.odd? ? arr[arr.size/2.ceil] :  arr[arr.size/2 - 1] + arr[arr.size/2]
end
#PERFECTO!!!
def center_of(str)
  str[str.size.fdiv(2).ceil - 1..str.size / 2]
end
#
# p center_of('I love ruby') #== 'e'
# p center_of('Launch School') #== ' '
# p center_of('Launch') #== 'un'
# p center_of('Launchschool') #== 'hs'
# p center_of('x') #== 'x'

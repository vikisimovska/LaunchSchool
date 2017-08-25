system("clear")
#EASY 9

#1.Create a method that takes 2 arguments, an array and a hash. The array will
#contain 2 or more elements that, when combined with adjoining spaces, will
#produce a person's name. The hash will contain two keys, :title and :occupation,
# and the appropriate values. Your method should return a greeting that uses the
# person's full name, and mentions the person's title.
def greetings(arr, hash)
  p "Hello #{arr.join(" ")}! Nice to have a #{hash[:title]} #{hash[:occupation]} around."
end
def greetings(name, job)
  format('Hello, %s %s %s! Nice to have a %s %s around.', *name, *job.values)
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
#=> Hello, John Q Doe! Nice to have a Master Plumber around.

#2.A double number is a number with an even number of digits whose left-side digits
#are exactly the same as its right-side digits. For example, 44, 3333, 103103,
#7676 are all double numbers. 444, 334433, and 107 are not.

#Write a method that returns 2 times the number provided as an argument, unless
# the argument is a double number; double numbers should be returned as-is.
def twice(num)
  str = num.to_s
  if str.size.even? && (str[0...(str.size / 2)] == str[str.size / 2...str.size])
     num
  else
     num * 2
  end
end

# p twice(37) == 74
# p twice(44) == 44
# p twice(334433) == 668866
# p twice(444) == 888
# p twice(107) == 214
# p twice(103103) == 103103
# p twice(3333) == 3333
# p twice(7676) == 7676
# p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
# p twice(5) == 10

#3.Write a method that takes a number as an argument. If the argument is a
#positive number, return the negative of that number. If the number is 0 or
#negative, return the original number.
def negative(num)
  num > 0 ? -num : num
end
def negative(number)
  -number.abs
end
# p negative(5) == -5
# p negative(-3) == -3
# p negative(0) == 0      # There's no such thing as -0 in ruby

#4.Write a method that takes an integer argument, and returns an Array of all
#integers, in sequence, between 1 and the argument.
def sequence(num)
  (1..num).to_a
end
# p sequence(5) == [1, 2, 3, 4, 5]
# p sequence(3) == [1, 2, 3]
# p sequence(1) == [1]

#5.Write a method that takes a string argument, and returns true if all of the
#alphabetic characters inside the string are uppercase, false otherwise.
#Characters that are not alphabetic should be ignored.
def uppercase?(str)
  str == str.upcase
end
# p uppercase?('t') == false
# p uppercase?('T') == true
# p uppercase?('Four Score') == false
# p uppercase?('FOUR SCORE') == true
# p uppercase?('4SCORE!') == true
# p uppercase?('') == true

#6.Write a method that takes a string as an argument, and returns an Array that
# contains every word from the string, to which you have appended a space and
#the word length.
def word_lengths(str)
  str.split.map{ |word| word + " " + word.size.to_s}
end
def word_lengths(string)
  string.split.map { |word| "#{word} #{word.length}" }
end

# p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]
#
# p word_lengths("baseball hot dogs and apple pie") ==
#   ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]
#
# p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]
#
# p word_lengths("Supercalifragilisticexpialidocious") ==
#   ["Supercalifragilisticexpialidocious 34"]
#
# p word_lengths("") == []

#7.Write a method that takes a first name, a space, and a last name passed as a
#single String argument, and returns a string that contains the last name, a
#comma, a space, and the first name.
def swap_name(str)
  str.split("\n").map do |name|
    n = name.split(" ")
    n[1] + ", " + n[0]
  end.join
end
#DOESNT EVEN NEED MAP!!
def swap_name(str)
  "#{str.split[1]}, #{str.split[0]}"
end
#EXCELLENT SOLUTION!!
def swap_name(name)
  name.split(' ').reverse.join(', ')
end
#\s a white space
def swap_name(str)
  str.gsub(/(.+)\s(.+)/, '\2, \1')
end

#p swap_name('Joe Roberts') == 'Roberts, Joe'

#8.Create a method that takes two integers as arguments. The first argument is a
# count, and the second is the first number of a sequence that your method will
#create. The method should return an Array that contains the same number of
#elements as the count argument, while the values of each element will be multiples
# of the starting number.
def sequence(count, num)
  arr = []
  count.times{ |i| arr << (i+1) * num }
  arr
end
#INTERESTING SOLUTION!!
def sequence(count, first)
  (1..count).map { |idx| idx * first }
end

# p sequence(5, 1) == [1, 2, 3, 4, 5]
# p sequence(4, -7) == [-7, -14, -21, -28]
# p sequence(3, 0) == [0, 0, 0]
# p sequence(0, 1000000) == []

#9.Write a method that determines the mean (average) of the three scores passed
#to it, and returns the letter value associated with that grade.
def get_grade(*args)
  ave = args.reduce(:+) / args.size

  case ave
  when 90..100 then 'A'
  when 80..89 then 'B'
  when 70..79 then 'C'
  when 60..69 then 'D'
  else             'F'
  end
end
#MORE FLEXIBLE CASE STRUCTURE!!
def get_grade(n1, n2, n3)
  avg = (n1 + n2 + n3) / 3
  case
    when avg < 60 then "F"
    when avg < 70 then "D"
    when avg < 80 then "C"
    when avg < 90 then "B"
    else "A"
  end
end
def get_grade(*num)
  case num.reduce(:+) / num.count
  when 90...Float::INFINITY then 'A'
  when 80...90 then 'B'
  when 70...80 then 'C'
  when 60...70 then 'D'
  else
    'F'
  end
end
#TOTALLY DIFF SOLUTION!!
GRADES = { A: 90..1000, B: 80...90, C: 70...80, D: 60...70, F: 0...60 }
def get_grade(*scores)
  GRADES.find { |k, v| v.cover?(scores.reduce(:+).fdiv(scores.size)) }.first.to_s
end

# p get_grade(95, 90, 93) == "A"
# p get_grade(50, 50, 95) == "D"

#10.Write a method which takes a grocery list (array) of fruits with quantities
# and converts it into an array of the correct number of each fruit.
def buy_fruit(array)
  array.each_with_object([]) do |arr, result|
    arr[1].times{|i| result << arr[0]}
  end
end
p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]

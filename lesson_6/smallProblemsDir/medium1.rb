system("clear")
#MEDUIM 1
#
# #1.Write a method that rotates an array by moving the first element to the end
# #of the array. The original array should not be modified.
def rotate_array(array)
  arr = array.dup
  p arr.push(arr.shift)
end
#BETTER VERSION THEN ABOVE!!
def rotate_array(arr)
  array = arr.dup
  array << array.shift
end
def rotate_array(array)
  array[1..-1] + [array[0]]
end
def rotate_array(arr)
  arr[1..-1] << arr.first
end
def rotate_array(array)
  first, *remainder = array
  remainder + [first]
end
def rotate_array(arr)
  [*arr[1..-1], *arr.first]
end

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
#3.If you take a number like 735291, and rotate it to the left, you get 352917.
# If you now keep the first digit fixed in place, and rotate the remaining digits,
# you get 329175. Keep the first 2 digits fixed in place and rotate again to 321759.
#Keep the first 3 digits fixed in place and rotate again to get 321597. Finally,
#keep the first 4 digits fixed in place and rotate the final 2 digits to get
#321579. The resulting number is called the maximum rotation of the original number.

#Write a method that takes an integer as argument, and returns the maximum
#rotation of that argument. You can (and probably should) use the
#rotate_rightmost_digits method from the previous exercise.
def max_rotation(num)
  arr = num.to_s.split("")
  first_rotation = arr[1..-1] + [arr[0]]
  result = first_rotation
  if arr.size == 1
    return num
  elsif arr.size == 2
    return first_rotation.join.to_i
  else
    rotation_times = first_rotation.size - 2

    1.upto(rotation_times) do |i|
      rotating_digit = result.delete_at(i)
      result.push(rotating_digit)
    end
  end
   return result.join.to_i
end
#
# #GREAT SOLUTION
def max_rotation(x)
  (0...x.to_s.size).reduce(x.to_s) { |x, n| x[0...n] + x[n + 1..-1] + x[n] }.to_i
end

# p max_rotation(735291) == 321579
# p max_rotation(3) == 3
# p max_rotation(35) == 53
# p max_rotation(105) == 15 # the leading zero gets dropped
# p max_rotation(8_703_529_146) == 7_321_609_845

#4.You have a bank of switches before you numbered from 1 to 1000. Each switch is
#connected to exactly one light that is initially off. You walk down the row of
#switches, and turn every one of them on. Then, you go back to the beginning and
#toggle switches 2, 4, 6, and so on. Repeat this for switches 3, 6, 9, and so on,
#and keep going until you have been through 1000 repetitions of this process.

#Write a program that determines which lights are on at the end.
switches = {}
 (1..1000).each do |switch_num|
   switches[switch_num] = false
 end
 (1..1000).each do |pass|
   switches.each do |num, _|
     switches[num] = !switches[num] if num % pass == 0
   end
 end
 switches.keys.select{|k| switches[k] == true}

#GREAT SOLUTION
def lights(num)
  (1..num**0.5).map(&:abs2)
end
#
#round 1: every light is turned on
#round 2: lights 2 and 4 are now off; 1, 3, 5 are on
#round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
#round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
#round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
#The result is that 2 lights are left on, lights 1 and 4.

#With 10 lights, 3 lights are left on: lights 1, 4, and 9.

#5.Write a method that displays a 4-pointed diamond in an n x n grid, where n is
# an odd integer that is supplied as an argument to the method. You may assume
# that the argument will always be an odd integer.

def diamond(n)
  s = ""
  odd_array = (1..n).select{|num| num.odd?}
  odd_array = odd_array + odd_array.reverse[1..-1]#1,3,5,7,9,7,5,3,1
  (0...n).each do |i| #0,1,2,3,4,5,6,7,8
    empty_spaces = n/2
    odd_array[i].times do |j|#1,3,5,7,9,7,5,3,1
      s = (" " * (empty_spaces-i).abs) + ("*" * (j+1)) + (" " * (empty_spaces-i).abs)
    end
    p s
    s=""
  end
end

#GREAT SOLUTION!!!!!!!!!!!!!!
def diamond(n)
  [*(1...n), *n.downto(1)].each { |i| puts ('*' * i).center(n) if i.odd? }
end

#diamond(9)

#BETTER SOLUTION
def print_row(grid_size, distance_from_center)
  number_of_stars = grid_size - 2 * distance_from_center
  stars = '*' * number_of_stars
  puts stars.center(grid_size)
end

def diamond(grid_size)
  max_distance = (grid_size - 1) / 2
  max_distance.downto(0) { |distance| print_row(grid_size, distance) }
  1.upto(max_distance)   { |distance| print_row(grid_size, distance) }
end

#6.Stack Machine Interpretation

def minilang(str)
  arr = str.split
  reg = 0
  stack = []

  arr.each do |command|
    case command
    when /\d/
      reg = command.to_i
    when "PUSH"
      stack.push(reg)
    when "ADD"
      reg += stack.pop
    when "SUB"
      reg -= stack.pop
    when "MULT"
      reg *= stack.pop
    when "DIV"
      reg /= stack.pop
    when "MOD"
      reg %= stack.pop
    when "POP"
      reg = stack.pop
    when "PRINT"
       reg
    else
        #reg = command.to_i
    end
  end

end
 #p minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')

#LOOK IT UP AGAIN!!
 #7.Write a method that takes a sentence string as input, and returns the same
 #string with any sequence of the words 'zero', 'one', 'two', 'three', 'four',
 #'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.
 def word_to_digit(words)
    hash ={
      'zero'  => "0",
      'one'   => "1",
      'two'   => "2",
      'three' => "3",
      'four'  => "4",
      'five'  => "5",
      'six'   => "6",
      'seven' => "7",
      'eight' => "8",
      'nine'  => "9"
   }
#    #words.delete(".").split(" ").each{|s| words.gsub!(s, hash[s]) if hash.keys.include?(s)}
#    #WORK OF A GINIUS!!!!!!!
    words.split(/\b/).map { |word| hash[word] || word }.join(" ")
   return words
end
#****************************************************************************
DIGIT_STRINGS = { "zero"  => "0", "one"  => "1", "two" => "2", "three" =>  "3",
                  "four"  => "4", "five" => "5", "six" => "6", "seven" =>  "7",
                  "eight" => "8", "nine" => "9" }

def word_to_digit(string)
  string.split(/\b/).map do |word|
    p word
    DIGIT_STRINGS[word] || word
  end.join
end
#****************************************************************************
#AMAZING!!!!!LOOK UP THE  /\w+/ one or many word chars
DIGITS = %w[zero one two three four five six seven eight nine]
def word_to_digit(str)
  str.gsub(/\w+/) do |word|
    p word
    DIGITS.index(word) || word
  end
end

#p word_to_digi('Please call me at five five five one two three four. Thanks.') #== 'Please call me at 5 5 5 1 2 3 4. Thanks.' 2 3 4. Thanks.'

#8.Fibonacci Numbers (Recursion)

def fibonacci(n)
  return 1 if n == 1 || n == 2
  fibonacci(n - 1) + fibonacci(n - 2)
end

# p fibonacci(1) == 1
# p fibonacci(2) == 1
# p fibonacci(3) == 2
# p fibonacci(4) == 3
# p fibonacci(5) == 5
# p fibonacci(12) == 144
# p fibonacci(20) == 6765

#9.Rewrite your recursive fibonacci method so that it computes its results without recursion.
def fibonacci2(n)
  sum = 1
  first_prev = 1
  second_prev = 1
  3.upto(n) do |num|
    sum = first_prev + second_prev
    first_prev = second_prev
    second_prev = sum
  end
  sum
end

#SECOND SOLUTION
def fibonacci(nth)
  first, last = [1, 1]
  3.upto(nth) do
    first, last = [last, first + last]
  end
  last
end
#THIRD SOLUTION
def fibonacci(n)
    arr = [1,1]
    while arr.size < n
        sum = arr[-1] + arr[-2]
        arr.push(sum)
    end
    arr[n-1]
end
#N - SOLUTION
def fibonacci(n)
  (3..n).reduce([1, 1]) { |(a, b), _| [b, a + b] }.last
end
#USING Enumerator
def fibonacci(n)
  fib = Enumerator.new do |y|
    a = b = 1
    loop do
      y << a
      a, b = b, a + b
    end
  end
  fib.take(n).last
end
# p fibonacci2(20) == 6765
# p fibonacci2(100) == 354224848179261915075

#10.In this exercise, you are going to compute a method that returns the last
#digit of the nth Fibonacci number.
def fibonacci_last(n)
  num = fibonacci(n)
  num.to_s[-1].to_i
end

#PART 2
#To compute the last digit of the nth Fibonacci number, you only need the last
#digit of the nth - 1 and nth -2 numbers. As a result, you only ever need the
#last digit of any intermediate result, which eliminates all of the computing
#effort needed to compute the massive numbers involved. Our second solution does
#exactly this: it only computes and uses the last digit in each intermediate
#result, and computes the last digit of the 123,456,789th Fibonacci number in
#less than a minute.

def fibonacci_last(nth)
  last_2 = [1, 1]
  3.upto(nth) do
    last_2 = [last_2.last, (last_2.first + last_2.last) % 10]
  end
  last_2.last
end
# p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
# p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
# p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
# p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
# p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
# p fibonacci_last(123456789)

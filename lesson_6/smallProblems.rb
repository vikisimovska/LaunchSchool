#Easy 1

#1. Write a method that takes two arguments, a string and a positive integer,
# and prints the string as many times as the integer indicates.

def repeat (str, num)
  num.times { |n| puts str }
end
repeat('Hello', 3)

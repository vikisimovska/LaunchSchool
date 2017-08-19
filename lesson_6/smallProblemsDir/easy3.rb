#1.Write a program that solicits 6 numbers from the user, then prints a message
#that describes whether or not the 6th number appears amongst the first 5 numbers.
num_arr = []
num = nil

1.upto(6) do |nth|
  if nth == 6
    p "==> Enter the last number:"
    num = gets.chomp
  else
    p "=> Enter the #{nth} number:"
    num = gets.chomp
    num_arr << num
  end
end

if num_arr.include?(num)
  p "The number #{num} appears in #{num_arr}"
else
  p "The number #{num} does not appears in #{num_arr}"
end

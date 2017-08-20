system("clear")
#EASY 4
#1.Write a method that takes two strings as arguments, determines the longest of
# the two strings, and then returns the result of concatenating the shorter
#string, the longer string, and the shorter string once again. You may assume
#that the strings are of different lengths.
def short_long_short(s1, s2)
  s1.size < s2.size ? s1 + s2 + s1 : s2 + s1 + s2
end
# p short_long_short('abc', 'defgh') == "abcdefghabc"
# p short_long_short('abcde', 'fgh') == "fghabcdefgh"
# p short_long_short('', 'xyz') == "xyz"


#FINISH TOMORROW!!!
#2.Write a method that takes a year as input and returns the century. The return
# value should be a string that begins with the century number, and ends with
#st, nd, rd, or th as appropriate for that number.

#New centuries begin in years that end with 01. So, the years 1901-2000 comprise
# the 20th century.
def century(num)
  str = num.to_s
  if str[-1] >= "1"
    num = num / 100 + 1
  else
    num = num / 100
  end
  num
end

def str_additions(num)
  case num
  when 1 then 'st'
  when 2 then 'nd'
  when 3 then 'rd'
  else 'th'
  end
end
#1901-2000 - 20th
# p century(2000) #== '20th'
# p century(2001) #== '21st'
# p century(1965) #== '20th'
# p century(256) #== '3rd'
# p century(5) #== '1st'
# p century(10103) #== '102nd'
# p century(1052) #== '11th'
# p century(1127) #== '12th'
# p century(11201) #== '113th'

#3. In the modern era under the Gregorian Calendar, leap years occur in every
#year that is evenly divisible by 4, unless the year is also divisible by 100.
#If the year is evenly divisible by 100, then it is not a leap year unless the
# year is evenly divisible by 400.

#Assume this rule is good for any year greater than year 0. Write a method that
#takes any year greater than 0 as input, and returns true if the year is a leap
#year, or false if it is not a leap year.

# def leap_year?(year)
#   return true if year % 4 == 0 && year % 100 != 0
#   return true if year % 100 == 0 && year % 400 == 0
#   false
# end

# p leap_year?(2016) == true
# p leap_year?(2015) == false
# p leap_year?(2100) == false
# p leap_year?(2400) == true
# p leap_year?(240000) == true
# p leap_year?(240001) == false
# p leap_year?(2000) == true
# p leap_year?(1900) == false
# p leap_year?(1752) == true
# p leap_year?(1700) == false
# p leap_year?(1) == false
# p leap_year?(100) == false
# p leap_year?(400) == true

#WATCH OUT ON THE FALSE OPTION IN IF STATEMENT.
#IF YOU ONLY RETURN TRUE FROM AN IF STATEMENT, NOT CONSIDERING FALSE OPTION,
#IF WILL RETURN NIL PER DEFAULT!!!
#4.The British Empire adopted the Gregorian Calendar in 1752, which was a leap
#year. Prior to 1752, the Julian Calendar was used. Under the Julian Calendar,
#leap years occur in any year that is evenly divisible by 4.

#Using this information, update the method from the previous exercise to
#determine leap years both before and after 1752.

def leap_year?(year)
  if year >= 1752
    return true if year % 4 == 0 && year % 100 != 0
    return true if year % 100 == 0 && year % 400 == 0
    false
  else
     year % 4 == 0 ? true : false
  end
end

# p leap_year?(2016) == true
# p leap_year?(2015) == false
# p leap_year?(2100) == false
# p leap_year?(2400) == true
# p leap_year?(240000) == true
# p leap_year?(240001) == false
# p leap_year?(2000) == true
# p leap_year?(1900) == false
# p leap_year?(1752) == true
# p leap_year?(1700) == true
# p leap_year?(1) == false
# p leap_year?(100) == true
# p leap_year?(400) == true

#5.Write a method that searches for all multiples of 3 or 5 that lie between 1
#and some other number, and then computes the sum of those multiples. For instance
#if the supplied number is 20, the result should be
#98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

def multisum(num)
  arr = []
  1.upto(num){ |i| arr << i if i % 3 == 0 || i % 5 == 0}
  arr.sum
end

# p multisum(3) == 3
# p multisum(5) == 8
# p multisum(10) == 33
# p multisum(1000) == 234168

#6.Write a method that takes an Array of numbers, and returns an Array with the
#same number of elements, and each element has the running total from the origi
def running_total(arr)
  arr.map!.with_index do |e, idx|
    idx > 0 ? e + arr[idx - 1] : e
  end
end

def running_total(arr)
  sum = 0
  arr.map! { |num| sum += num }
end

def running_total_1(array)
  sum = 0
  arr = array.each_with_object([]) { |num, arr| arr << sum += num }
end

def running_total(array)
    array.map.with_index do |num, index|
        array[0..index].reduce(:+)
    end
end
def running_total(arr)
  (1..arr.size).map { |amount| arr.take(amount).reduce(:+) }
end

def running_total(nums)
  nums.reduce([]) { |result, n| result + [result.last.to_i + n] }
end

#p running_total([2, 5, 13]) #== [2, 7, 20]
#p running_total([14, 11, 7, 15, 20]) #== [14, 25, 32, 47, 67]
# p running_total([3]) == [3]
# p running_total([]) == []

#7.
